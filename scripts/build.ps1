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
$superRoot = ""
try {
    $superRoot = (& git -C $root rev-parse --show-superproject-working-tree 2>$null).Trim()
} catch {
    $superRoot = ""
}
$workspaceRoot = if ($superRoot) { $superRoot } else { $root }
$exitCode = 0
$skipBuild = $false

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
        $texCandidate = Join-Path $root "tex\$Doc"
        if (Test-Path $texCandidate) {
            $Doc = $texCandidate
        } else {
            throw "File not found: $Doc"
        }
    }
}

Push-Location $root
try {
    New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
    New-Item -ItemType Directory -Force -Path $AuxDir | Out-Null
    $auxDirFull = if ([IO.Path]::IsPathRooted($AuxDir)) { $AuxDir } else { Join-Path $root $AuxDir }
    $env:TEXMFVAR = Join-Path $auxDirFull "texmf-var"
    $env:TEXMFCACHE = Join-Path $auxDirFull "texmf-cache"
    New-Item -ItemType Directory -Force -Path $env:TEXMFVAR | Out-Null
    New-Item -ItemType Directory -Force -Path $env:TEXMFCACHE | Out-Null

    if (-not $env:MODERNTECH_TIKZ_EXTERNAL_PRIMARY) {
        $env:MODERNTECH_TIKZ_EXTERNAL_PRIMARY = ((Join-Path $workspaceRoot ".build\\tikz") -replace '\\', '/')
    }
    if (-not $env:MODERNTECH_TIKZ_EXTERNAL_FALLBACK) {
        $env:MODERNTECH_TIKZ_EXTERNAL_FALLBACK = ((Join-Path $workspaceRoot "build\\tikz") -replace '\\', '/')
    }
    $primaryFsPath = $env:MODERNTECH_TIKZ_EXTERNAL_PRIMARY -replace '/', [IO.Path]::DirectorySeparatorChar
    $fallbackFsPath = $env:MODERNTECH_TIKZ_EXTERNAL_FALLBACK -replace '/', [IO.Path]::DirectorySeparatorChar
    New-Item -ItemType Directory -Force -Path $primaryFsPath | Out-Null
    New-Item -ItemType Directory -Force -Path $fallbackFsPath | Out-Null

    $latexmkRc = Join-Path $root "tex/latexmkrc"

    if ($Clean) {
        & latexmk -C "-r" $latexmkRc "-outdir=$OutDir" "-auxdir=$AuxDir" $Doc
        $exitCode = $LASTEXITCODE
        $skipBuild = $true
    }

    if (-not $skipBuild -and $Preflight) {
        $texliveonfly = Get-Command texliveonfly -ErrorAction SilentlyContinue
        if ($texliveonfly) {
            & $texliveonfly.Source --compiler=$Engine `
                --arguments="-interaction=nonstopmode -halt-on-error -file-line-error" `
                $Doc | Out-Host
        } else {
            Write-Warning "texliveonfly not found; skipping preflight."
        }
    }

    if (-not $skipBuild) {
        $args = @(
            "-r", $latexmkRc,
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
        $exitCode = $LASTEXITCODE
    }
}
finally {
    Pop-Location
}

if (-not $NoScrub) {
    $scrubScript = Join-Path $root 'scripts\scrub.ps1'
    if (Test-Path $scrubScript) {
        try {
            & $scrubScript
        } catch {
            Write-Warning "Scrub failed: $($_.Exception.Message)"
        }
    }
}

if ($exitCode -ne 0) {
    exit $exitCode
}
