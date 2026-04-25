#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

SOURCE_PDF="$ROOT/artifacts/out/main.pdf"
if [[ ! -f "$SOURCE_PDF" ]]; then
  echo "Source PDF not found at $SOURCE_PDF" >&2
  exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI (gh) not found." >&2
  echo "Install on Ubuntu: sudo apt-get update && sudo apt-get install -y gh" >&2
  echo "Install on macOS: brew install gh" >&2
  echo "Install on Windows: winget install --id GitHub.cli" >&2
  exit 127
fi

RELEASE_DIR="$ROOT/release"
mkdir -p "$RELEASE_DIR"

today="$(date +%Y%m%d)"
date_human="$(date +%Y-%m-%d)"
TAG="release-${today}"
DEST_PDF="$RELEASE_DIR/EDO_Study_Guide_dtd_${today}.pdf"
CHANGELOG="$ROOT/CHANGELOG.md"
NOTES_FILE="$ROOT/artifacts/build/release_notes_${today}.md"
mkdir -p "$ROOT/artifacts/build"

cp "$SOURCE_PDF" "$DEST_PDF"
echo "Copied $SOURCE_PDF to $DEST_PDF"

DEFAULT_MSG="Release: EDO_Study_Guide_dtd_${today}"
MSG="${1:-$DEFAULT_MSG}"
BRANCH="$(git rev-parse --abbrev-ref HEAD 2> /dev/null || echo main)"

generate_notes() {
  if [[ -f "$CHANGELOG" ]]; then
    awk -v tag="$TAG" '
      BEGIN{found=0}
      $0 ~ "^##[[:space:]]*\\[" tag "\\]" || $0 ~ "^##[[:space:]]*" tag {
        found=1; next
      }
      found && /^##[[:space:]]/ { exit }
      found { print }
    ' "$CHANGELOG" | sed 's/[[:space:]]*$//' > "$NOTES_FILE"
  fi

  if [[ ! -s "$NOTES_FILE" ]]; then
    {
      echo "## $TAG ($date_human)"
      echo ""
      echo "Changes:"
      git log --pretty=format:'- %s (%h)' -n 20
    } > "$NOTES_FILE"
  else
    tmp="${NOTES_FILE}.tmp"
    {
      echo "## $TAG ($date_human)"
      echo ""
      cat "$NOTES_FILE"
    } > "$tmp"
    mv "$tmp" "$NOTES_FILE"
  fi
}

# Guardrails: block obvious secrets by pattern (edit as needed)
BLOCK_PATTERNS=(
  '\.env'
  'id_rsa|id_ed25519|_key$'
  'token|apikey|secret'
)
BLOCK_PATTERN="$(IFS='|'; echo "${BLOCK_PATTERNS[*]}")"

# Refuse if patterns present in staged or untracked
if git ls-files -o -m --exclude-standard | grep -E "$BLOCK_PATTERN" -iq; then
  echo "⚠️  Potential secret-like files changed. Review before pushing."
  git ls-files -o -m --exclude-standard | grep -E "$BLOCK_PATTERN" -i || true
  exit 1
fi

git add -A
if git diff --cached --quiet; then
  echo "No changes to commit."
else
  git commit -m "$MSG"
fi

tag_exists=0
if git rev-parse "$TAG" >/dev/null 2>&1; then
  tag_exists=1
else
  git tag -a "$TAG" -m "EDO Study Guide $date_human"
fi

if ! git rev-parse --symbolic-full-name --verify "@{u}" > /dev/null 2>&1; then
  git push -u origin "$BRANCH"
else
  git push
fi

if [[ "$tag_exists" == "0" ]]; then
  git push origin "$TAG"
fi

generate_notes

if gh release view "$TAG" >/dev/null 2>&1; then
  gh release upload "$TAG" "$DEST_PDF" --clobber
  gh release edit "$TAG" --notes-file "$NOTES_FILE"
else
  gh release create "$TAG" "$DEST_PDF" --title "$TAG" --notes-file "$NOTES_FILE"
fi

echo "✅ Published $TAG on $(git remote get-url origin)"
