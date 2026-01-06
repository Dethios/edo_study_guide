#requires -Version 5.1
[CmdletBinding()]
param(
    [string]$Output = "scratch/ai_context.zip",
    [string]$Log,
    [int]$LogLines = 300,
    [switch]$NoDiff,
    [switch]$NoStaged,
    [switch]$NoLog,
    [string[]]$File,
    [string]$List,
    [switch]$KeepStage
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$root = Split-Path -Parent $PSScriptRoot

if (-not [System.IO.Path]::IsPathRooted($Output)) {
    $Output = Join-Path $root $Output
}

$stageRoot = Join-Path $root "scratch"
New-Item -ItemType Directory -Force -Path $stageRoot | Out-Null
$stageDir = Join-Path $stageRoot ("ai_context_" + [System.Guid]::NewGuid().ToString("N"))
$contextDir = Join-Path $stageDir "context"
$filesDir = Join-Path $contextDir "files"
New-Item -ItemType Directory -Force -Path $filesDir | Out-Null

$notesFile = Join-Path $contextDir "notes.txt"
$missing = New-Object System.Collections.Generic.List[string]
$skipped = New-Object System.Collections.Generic.List[string]
$added = New-Object System.Collections.Generic.List[string]

try {
    if (-not $NoDiff -or -not $NoStaged) {
        $git = Get-Command git -ErrorAction SilentlyContinue
        if ($git) {
            Push-Location $root
            try {
                if (-not $NoDiff) {
                    git diff --patch | Set-Content (Join-Path $contextDir "git_diff.patch")
                }
                if (-not $NoStaged) {
                    git diff --staged --patch | Set-Content (Join-Path $contextDir "git_diff_staged.patch")
                }
                git status --short | Set-Content (Join-Path $contextDir "git_status.txt")
                git rev-parse HEAD | Set-Content (Join-Path $contextDir "git_head.txt")
            } finally {
                Pop-Location
            }
        } else {
            "git not available or repo not detected." | Add-Content $notesFile
        }
    }

    if (-not $NoLog) {
        if ($Log) {
            if (-not [System.IO.Path]::IsPathRooted($Log)) {
                $Log = Join-Path $root $Log
            }
        } else {
            $candidate = Join-Path $root "build/main.log"
            if (Test-Path $candidate) {
                $Log = $candidate
            } else {
                $candidate = Join-Path $root "out/main.log"
                if (Test-Path $candidate) {
                    $Log = $candidate
                } else {
                    $Log = Get-ChildItem -Path (Join-Path $root "build"), (Join-Path $root "out") `
                        -Filter "*.log" -ErrorAction SilentlyContinue |
                        Sort-Object LastWriteTime -Descending |
                        Select-Object -First 1 |
                        ForEach-Object { $_.FullName }
                }
            }
        }

        if ($Log -and (Test-Path $Log)) {
            Get-Content -Path $Log -Tail $LogLines | Set-Content (Join-Path $contextDir "log_tail.txt")
            $Log | Set-Content (Join-Path $contextDir "log_source.txt")
        } else {
            "No log file found." | Set-Content (Join-Path $contextDir "log_tail.txt")
        }
    }

    $filesToAdd = @()
    if ($File) { $filesToAdd += $File }
    if ($List) {
        if (Test-Path $List) {
            $lines = Get-Content -Path $List
            foreach ($line in $lines) {
                if ([string]::IsNullOrWhiteSpace($line)) { continue }
                if ($line.Trim().StartsWith("#")) { continue }
                $filesToAdd += $line
            }
        } else {
            "List file not found: $List" | Add-Content $notesFile
        }
    }

    foreach ($entry in $filesToAdd) {
        if ([string]::IsNullOrWhiteSpace($entry)) { continue }
        $candidate = $entry
        if (-not (Test-Path $candidate)) {
            $candidate = Join-Path $root $entry
        }
        if (-not (Test-Path $candidate)) {
            $missing.Add($entry)
            continue
        }
        $item = Get-Item -Path $candidate
        if ($item.PSIsContainer) {
            $skipped.Add("$entry (directory)")
            continue
        }
        $fullPath = (Resolve-Path -Path $item.FullName).Path
        if ($fullPath.StartsWith($root)) {
            $relPath = $fullPath.Substring($root.Length).TrimStart("\", "/")
        } else {
            $relPath = Join-Path "external" (Split-Path $fullPath -Leaf)
        }
        $dest = Join-Path $filesDir $relPath
        New-Item -ItemType Directory -Force -Path (Split-Path $dest -Parent) | Out-Null
        Copy-Item -Force -Path $fullPath -Destination $dest
        $added.Add($relPath)
    }

    $manifest = @(
        "AI context bundle",
        "Created (UTC): $([DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ssZ'))",
        "Repo root: $root",
        "Output: $Output",
        "Log lines: $LogLines",
        "Include diff: $(-not $NoDiff)",
        "Include staged diff: $(-not $NoStaged)",
        "Include log: $(-not $NoLog)",
        "",
        "Files included:"
    )
    if ($added.Count -eq 0) {
        $manifest += "  (none)"
    } else {
        foreach ($item in $added) { $manifest += "  - $item" }
    }
    $manifest | Set-Content (Join-Path $contextDir "manifest.txt")

    if ($missing.Count -gt 0) {
        "Missing files:" | Add-Content $notesFile
        foreach ($item in $missing) { "  - $item" | Add-Content $notesFile }
    }
    if ($skipped.Count -gt 0) {
        "Skipped entries:" | Add-Content $notesFile
        foreach ($item in $skipped) { "  - $item" | Add-Content $notesFile }
    }

    New-Item -ItemType Directory -Force -Path (Split-Path $Output -Parent) | Out-Null
    Compress-Archive -Path (Join-Path $stageDir "*") -DestinationPath $Output -Force
    Write-Host "Wrote $Output"
}
finally {
    if (-not $KeepStage) {
        Remove-Item -Path $stageDir -Recurse -Force -ErrorAction SilentlyContinue
    }
}
