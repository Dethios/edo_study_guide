#requires -Version 5.1
[CmdletBinding()]
param(
    [Parameter(Position = 0, ValueFromRemainingArguments = $true)]
    [string[]]$Path = @("tex/main.tex"),

    [switch]$All
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$root = Split-Path -Parent $PSScriptRoot
$config = Join-Path $root "tex/latexindent.yaml"

if (-not (Get-Command latexindent -ErrorAction SilentlyContinue)) {
    throw "latexindent not found in PATH."
}

$targets = @()

if ($All) {
    $texRoot = Join-Path $root "tex"
    $targets = Get-ChildItem -Path $texRoot -Recurse -Filter *.tex | Select-Object -ExpandProperty FullName
} else {
    foreach ($entry in $Path) {
        $resolved = if (Test-Path $entry) { $entry } else { Join-Path $root $entry }
        if (-not (Test-Path $resolved)) {
            $texCandidate = Join-Path $root "tex\$entry"
            if (Test-Path $texCandidate) {
                $resolved = $texCandidate
            }
        }
        if (Test-Path $resolved -PathType Container) {
            $targets += Get-ChildItem -Path $resolved -Recurse -Filter *.tex | Select-Object -ExpandProperty FullName
        } else {
            $targets += $resolved
        }
    }
}

foreach ($file in $targets) {
    if (-not (Test-Path $file -PathType Leaf)) {
        Write-Warning "Skipping missing file: $file"
        continue
    }
    & latexindent -w -s -m -l=$config --overwriteIfDifferent --outputdir=/dev/null $file
}
