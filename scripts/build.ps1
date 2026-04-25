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
    [string]$OutDir = "artifacts/out",
    [string]$AuxDir = "artifacts/build"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$root = Split-Path -Parent $PSScriptRoot
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
    $outDirFull = if ([IO.Path]::IsPathRooted($OutDir)) { $OutDir } else { Join-Path $root $OutDir }
    $auxDirFull = if ([IO.Path]::IsPathRooted($AuxDir)) { $AuxDir } else { Join-Path $root $AuxDir }
    New-Item -ItemType Directory -Force -Path $outDirFull | Out-Null
    New-Item -ItemType Directory -Force -Path $auxDirFull | Out-Null
    $env:TEXMFVAR = Join-Path $auxDirFull "texmf-var"
    $env:TEXMFCACHE = Join-Path $auxDirFull "texmf-cache"
    New-Item -ItemType Directory -Force -Path $env:TEXMFVAR | Out-Null
    New-Item -ItemType Directory -Force -Path $env:TEXMFCACHE | Out-Null

    $tikzCacheDir = Join-Path $root "artifacts\tikz"
    if (-not $env:MODERNTECH_TIKZ_EXTERNAL_PRIMARY) {
        $env:MODERNTECH_TIKZ_EXTERNAL_PRIMARY = ($tikzCacheDir -replace '\\', '/')
    }
    if (-not $env:MODERNTECH_TIKZ_EXTERNAL_FALLBACK) {
        $env:MODERNTECH_TIKZ_EXTERNAL_FALLBACK = ($tikzCacheDir -replace '\\', '/')
    }
    $primaryFsPath = $env:MODERNTECH_TIKZ_EXTERNAL_PRIMARY -replace '/', [IO.Path]::DirectorySeparatorChar
    $fallbackFsPath = $env:MODERNTECH_TIKZ_EXTERNAL_FALLBACK -replace '/', [IO.Path]::DirectorySeparatorChar
    New-Item -ItemType Directory -Force -Path $primaryFsPath | Out-Null
    if ($fallbackFsPath -ne $primaryFsPath) {
        New-Item -ItemType Directory -Force -Path $fallbackFsPath | Out-Null
    }

    $latexmkRc = Join-Path $root "tex/latexmkrc"

    if ($Clean) {
        & latexmk -C "-r" $latexmkRc "-outdir=$outDirFull" "-auxdir=$auxDirFull" $Doc
        $exitCode = $LASTEXITCODE
        $skipBuild = $true
    }

    if (-not $skipBuild) {
        $args = @(
            "-r", $latexmkRc,
            "-pdf",
            "-synctex=1",
            "-interaction=nonstopmode",
            "-file-line-error",
            "-outdir=$outDirFull",
            "-auxdir=$auxDirFull",
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
