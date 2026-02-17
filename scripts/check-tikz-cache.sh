#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SUPER_ROOT="$(git -C "$PROJECT_ROOT" rev-parse --show-superproject-working-tree 2>/dev/null || true)"
if [[ -n "$SUPER_ROOT" ]]; then
  WORKSPACE_ROOT="${SUPER_ROOT%/}"
else
  WORKSPACE_ROOT="$PROJECT_ROOT"
fi

PRIMARY_DIR="$WORKSPACE_ROOT/.build/tikz"
FALLBACK_DIR="$WORKSPACE_ROOT/build/tikz"

mapfile -t bad_files < <(
  find "$WORKSPACE_ROOT" -type f \
    \( -name '*-figure*.pdf' -o -name '*-figure*.log' -o -name '*-figure*.md5' -o -name '*-figure*.dpth' \) \
    ! -path "$PRIMARY_DIR/*" \
    ! -path "$FALLBACK_DIR/*" \
    ! -path '*/.git/*'
)

if (( ${#bad_files[@]} )); then
  echo "TikZ externalization artifacts found outside approved cache paths:"
  printf '  %s\n' "${bad_files[@]}"
  echo "Expected only under:"
  echo "  $PRIMARY_DIR"
  echo "  $FALLBACK_DIR"
  exit 1
fi

echo "TikZ externalization artifacts are confined to approved cache paths."
