Param(
    [string]$Message
)

$ErrorActionPreference = 'Stop'

$baseDir = Split-Path -Parent $PSScriptRoot
$source = Join-Path $baseDir 'artifacts\out\main.pdf'
if (-not (Test-Path $source)) {
    Write-Error "Source PDF not found at $source"
    exit 1
}

$gh = Get-Command gh -ErrorAction SilentlyContinue
if (-not $gh) {
    Write-Error "GitHub CLI (gh) not found."
    Write-Host "Install on Windows: winget install --id GitHub.cli"
    Write-Host "Install on macOS: brew install gh"
    Write-Host "Install on Ubuntu: sudo apt-get update && sudo apt-get install -y gh"
    exit 127
}

$releaseDir = Join-Path $baseDir 'release'
if (-not (Test-Path $releaseDir)) {
    New-Item -ItemType Directory -Path $releaseDir | Out-Null
}

$dateStamp = Get-Date -Format 'yyyyMMdd'
$dateHuman = Get-Date -Format 'yyyy-MM-dd'
$tag = "release-$dateStamp"
$destination = Join-Path $releaseDir "EDO_Study_Guide_dtd_$dateStamp.pdf"
$changelog = Join-Path $baseDir 'CHANGELOG.md'
$notesFile = Join-Path $baseDir "artifacts\\build\\release_notes_$dateStamp.md"
New-Item -ItemType Directory -Force -Path (Split-Path $notesFile -Parent) | Out-Null

Copy-Item -Path $source -Destination $destination -Force
Write-Host "Copied $source to $destination"

$defaultMsg = "Release: EDO_Study_Guide_dtd_$dateStamp"
$msg = if ($Message) { $Message } else { $defaultMsg }

function Get-ChangelogSection {
    param(
        [string]$Path,
        [string]$Tag
    )
    if (-not (Test-Path $Path)) { return $null }
    $lines = Get-Content -Path $Path
    $section = New-Object System.Collections.Generic.List[string]
    $capture = $false
    $escapedTag = [regex]::Escape($Tag)
    foreach ($line in $lines) {
        if (-not $capture) {
            if ($line -match "^##\\s*\\[$escapedTag\\]" -or $line -match "^##\\s*$escapedTag") {
                $capture = $true
                continue
            }
        } else {
            if ($line -match "^##\\s+") { break }
            $section.Add($line)
        }
    }
    if ($capture -and $section.Count -gt 0) { return $section }
    return $null
}

$notesLines = New-Object System.Collections.Generic.List[string]
$notesLines.Add("## $tag ($dateHuman)")
$notesLines.Add("")

$section = Get-ChangelogSection -Path $changelog -Tag $tag
if ($section) {
    $section | ForEach-Object { $notesLines.Add($_) }
} else {
    $notesLines.Add("Changes:")
    $gitLog = git log --pretty=format:"- %s (%h)" -n 20
    if ($gitLog) {
        foreach ($line in $gitLog) { $notesLines.Add($line) }
    }
}

$notesLines | Set-Content -Path $notesFile

try {
    $branch = (git rev-parse --abbrev-ref HEAD 2>$null).Trim()
    if (-not $branch) { $branch = 'main' }
} catch {
    $branch = 'main'
}

# Guardrails: block obvious secret-like paths
$blockPatterns = @(
    '\.env',
    'id_rsa|id_ed25519|_key$',
    'token|apikey|secret'
)

$changedFiles = git ls-files -o -m --exclude-standard
$combinedPattern = ($blockPatterns -join '|')
if ($changedFiles | Where-Object { $_ -match $combinedPattern }) {
    Write-Warning 'Potential secret-like files changed. Review before pushing.'
    $changedFiles | Where-Object { $_ -match $combinedPattern } | ForEach-Object { Write-Host $_ }
    exit 1
}

git add -A
git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host 'No changes to commit.'
} else {
    git commit -m $msg
}

$tagExists = $false
git rev-parse $tag *> $null
if ($LASTEXITCODE -eq 0) {
    $tagExists = $true
} else {
    git tag -a $tag -m "EDO Study Guide $dateHuman"
}

git rev-parse --symbolic-full-name --verify '@{u}' *> $null
if ($LASTEXITCODE -ne 0) {
    git push -u origin $branch
} else {
    git push
}

if (-not $tagExists) {
    git push origin $tag
}

gh release view $tag *> $null
if ($LASTEXITCODE -eq 0) {
    gh release upload $tag $destination --clobber
    gh release edit $tag --notes-file $notesFile
} else {
    gh release create $tag $destination --title $tag --notes-file $notesFile
}

Write-Host "Done. Published $tag to $(git remote get-url origin)"
