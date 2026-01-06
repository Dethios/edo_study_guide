#requires -Version 5.1
[CmdletBinding()]
param(
    [switch]$DryRun
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$root = Split-Path -Parent $PSScriptRoot

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

$files = Get-ChildItem -Path $root -Recurse -File -Force -ErrorAction SilentlyContinue |
    Where-Object { $_.FullName -notmatch '\\.git\\' } |
    Where-Object {
        $name = $_.Name
        foreach ($pattern in $patterns) {
            if ($name -like $pattern) { return $true }
        }
        return $false
    }

if ($DryRun) {
    $files | ForEach-Object { Write-Output $_.FullName }
} else {
    $files | ForEach-Object {
        Remove-Item -LiteralPath $_.FullName -Force -ErrorAction SilentlyContinue
    }
}
