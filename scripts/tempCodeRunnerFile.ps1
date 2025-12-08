$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

# Config
$defaultMsg = "Auto-commit: $((Get-Date).ToUniversalTime().ToString("yyyy-MM-dd HH:mm:ss 'UTC'"))"
try {
    $branch = (git rev-parse --abbrev-ref HEAD 2>$null).Trim()
    if (-not $branch) { $branch = 'main' }
} catch {
    $branch = 'main'
}

# Guardrails: block obvious secret-like paths
$blockPatterns = @(
    '\.env'
    'id_rsa|id_ed25519|_key$'
    'token|apikey|secret'
)

# 0) Optional create a release file
Write-Host 'Creating release file...'
& (Join-Path $PSScriptRoot 'copy_release_windows.ps1')

# 1) Refuse if patterns present in staged or untracked
$changedFiles = git ls-files -o -m --exclude-standard
$combinedPattern = ($blockPatterns -join '|')
if ($changedFiles | Where-Object { $_ -match $combinedPattern }) {
    Write-Warning 'Potential secret-like files changed. Review before pushing.'
    $changedFiles | Where-Object { $_ -match $combinedPattern } | ForEach-Object { Write-Host $_ }
    exit 1
}

# 2) Stage & skip if nothing
git add -A
git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host 'No changes to commit.'
    exit 0
}

# 3) Commit with message (arg or default)
$msg = if ($args.Count -gt 0) { $args[0] } else { $defaultMsg }
git commit -m $msg

# 4) Ensure upstream once
git rev-parse --symbolic-full-name --verify '@{u}' *> $null
if ($LASTEXITCODE -ne 0) {
    git push -u origin $branch
} else {
    git push
}

Write-Host "Done. Pushed to $(git remote get-url origin) on branch $branch"
