Param(
  [string]$JobName = 'main'
)

$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$root      = Split-Path -Parent $scriptDir
$build     = Join-Path $root 'build'
$bcf       = Join-Path $build "$JobName.bcf"
if (-not (Test-Path $bcf)) {
  throw "BCF file '$bcf' not found. Run lualatex once so it gets generated."
}
$tempRoot = [System.IO.Path]::GetTempPath()
$tmpDir   = Join-Path $tempRoot "edo-biber-$([System.Guid]::NewGuid().ToString('N'))"
New-Item -ItemType Directory -Path $tmpDir | Out-Null
try {
  Copy-Item $bcf -Destination (Join-Path $tmpDir "$JobName.bcf")
  $runXml = Join-Path $build "$JobName.run.xml"
  if (Test-Path $runXml) {
    Copy-Item $runXml -Destination (Join-Path $tmpDir "$JobName.run.xml")
  }
  Get-ChildItem -Path $root -Filter '*.bib' | ForEach-Object {
    Copy-Item $_.FullName -Destination (Join-Path $tmpDir $_.Name)
  }
  Push-Location $root
  try {
    & biber --input-directory $tmpDir --output-directory $tmpDir $JobName
  }
  finally {
    Pop-Location
  }
  Copy-Item (Join-Path $tmpDir "$JobName.bbl") -Destination (Join-Path $build "$JobName.bbl") -Force
  Copy-Item (Join-Path $tmpDir "$JobName.blg") -Destination (Join-Path $build "$JobName.blg") -Force
  Write-Host "Biber run complete for $JobName."
}
finally {
  if (Test-Path $tmpDir) {
    Remove-Item $tmpDir -Recurse -Force
  }
}
