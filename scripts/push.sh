#!/usr/bin/env bash
set -euo pipefail

# Config
DEFAULT_MSG="Auto-commit: $(date -u +'%Y-%m-%d %H:%M:%S UTC')"
BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo main)"

# Guardrails: block obvious secrets by pattern (edit as needed)
BLOCK_PATTERNS=(
  '\.env'
  'id_rsa|id_ed25519|_key$'
  'token|apikey|secret'
)

# 1) Refuse if patterns present in staged or untracked
if git ls-files -o -m --exclude-standard | grep -E "${BLOCK_PATTERNS[*]}" -iq; then
  echo "⚠️  Potential secret-like files changed. Review before pushing."
  git ls-files -o -m --exclude-standard | grep -E "${BLOCK_PATTERNS[*]}" -i || true
  exit 1
fi

# 2) Stage & skip if nothing
git add -A
git diff --cached --quiet && { echo "No changes to commit."; exit 0; }

# 3) Commit with message (arg or default)
MSG="${1:-$DEFAULT_MSG}"
git commit -m "$MSG"

# 4) Ensure upstream once
if ! git rev-parse --symbolic-full-name --verify "@{u}" >/dev/null 2>&1; then
  git push -u origin "$BRANCH"
else
  git push
fi

echo "✅ Pushed to $(git remote get-url origin) on branch $BRANCH"
