#requires -Version 5.1
[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string]$Doc,

    [ValidateSet("lualatex", "xelatex", "pdflatex")]
    [string]$Engine = "lualatex",

    [switch]$Watch,
    [switch]$Clean,
    [switch]$Preflight,
    [switch]$NoShellEscape,
    [switch]$Quiet,
    [switch]$NoScrub,

    [int]$Jobs,
    [string]$OutDir = "out",
    [string]$AuxDir = "build"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$root = Split-Path -Parent $PSScriptRoot

if (-not $Doc) {
    if (Test-Path (Join-Path $root "tex/main.tex")) {
        $Doc = "tex/main.tex"
    } elseif (Test-Path (Join-Path $root "main.tex")) {
        $Doc = "main.tex"
    } else {
        throw "No main.tex found (expected tex/main.tex)."
    }
}

if (-not (Test-Path $Doc)) {
    $candidate = Join-Path $root $Doc
    if (Test-Path $candidate) {
        $Doc = $candidate
    } else {
        throw "File not found: $Doc"
    }
}

Push-Location $root
try {
    New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
    New-Item -ItemType Directory -Force -Path $AuxDir | Out-Null

    if ($Clean) {
        & latexmk -C "-outdir=$OutDir" "-auxdir=$AuxDir" $Doc
        if (-not $NoScrub) {
            Remove-TempArtifacts -Root $root
        }
        return
    }

    if ($Preflight) {
        $texliveonfly = Get-Command texliveonfly -ErrorAction SilentlyContinue
        if ($texliveonfly) {
            & $texliveonfly.Source --compiler=$Engine `
                --arguments="-interaction=nonstopmode -halt-on-error -file-line-error" `
                $Doc | Out-Host
        } else {
            Write-Warning "texliveonfly not found; skipping preflight."
        }
    }

    $args = @(
        "-pdf",
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-outdir=$OutDir",
        "-auxdir=$AuxDir",
        "-f"
    )

    switch ($Engine) {
        "lualatex" { $args += "-lualatex" }
        "xelatex" { $args += "-xelatex" }
        "pdflatex" { }
    }

    if (-not $NoShellEscape) { $args += "-shell-escape" }
    if ($Jobs) { $args += "-jobs=$Jobs" }
    if ($Quiet) { $args += "-quiet" }
    if ($Watch) { $args += "-pvc" }

    & latexmk @args $Doc
}
finally {
    Pop-Location
}

function Remove-TempArtifacts {
    param([string]$Root)
    $patterns = @(
        '*SAVE-ERROR*',
        '*.tmp',
        '*.temp',
        '*.lock',
        '*.lck',
        '*.auxlock',
        '*.synctex(busy)',
        '*.synctex.gz(busy)'
    )
    Get-ChildItem -Path $Root -Recurse -File -Force -ErrorAction SilentlyContinue |
        Where-Object { $_.FullName -notmatch '\\.git\\' } |
        Where-Object {
            $name = $_.Name
            foreach ($pattern in $patterns) {
                if ($name -like $pattern) { return $true }
            }
            return $false
        } |
        ForEach-Object {
            Remove-Item -LiteralPath $_.FullName -Force -ErrorAction SilentlyContinue
        }
}

if (-not $NoScrub) {
    Remove-TempArtifacts -Root $root
}
