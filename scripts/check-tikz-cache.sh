#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

APPROVED_DIR="$PROJECT_ROOT/artifacts/tikz"

mapfile -t bad_files < <(
  find "$PROJECT_ROOT" -type f \
    \( -name '*-figure*.pdf' -o -name '*-figure*.log' -o -name '*-figure*.md5' -o -name '*-figure*.dpth' \) \
    ! -path "$APPROVED_DIR/*" \
    ! -path '*/.git/*'
)

if (( ${#bad_files[@]} )); then
  echo "TikZ externalization artifacts found outside the project build cache:"
  printf '  %s\n' "${bad_files[@]}"
  echo "Expected only under:"
  echo "  $APPROVED_DIR"
  exit 1
fi

echo "TikZ externalization artifacts are confined to the project build cache."
