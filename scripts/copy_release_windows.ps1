Param()

$baseDir = Split-Path -Parent $PSScriptRoot
$source = Join-Path $baseDir 'out\main.pdf'
if (-not (Test-Path $source)) {
	Write-Error "Source PDF not found at $source"
	exit 1
}

$releaseDir = Join-Path $baseDir 'release'
if (-not (Test-Path $releaseDir)) {
	New-Item -ItemType Directory -Path $releaseDir | Out-Null
}

$dateStamp = Get-Date -Format 'yyyyMMdd'
$destination = Join-Path $releaseDir "EDO_Study_Guide_dtd_$dateStamp.pdf"

Copy-Item -Path $source -Destination $destination -Force
Write-Host "Copied $source to $destination"
