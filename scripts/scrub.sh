#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DRY_RUN=0

if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=1
fi

patterns=(
  "*SAVE-ERROR*"
  "*.tmp"
  "*.temp"
  "*.lock"
  "*.lck"
  "*.auxlock"
  "*.synctex(busy)"
  "*.synctex.gz(busy)"
)

cd "$ROOT"

find_args=(.)
find_args+=( -type f '(' )
for pattern in "${patterns[@]}"; do
  find_args+=( -name "$pattern" -o )
done
unset 'find_args[${#find_args[@]}-1]'
find_args+=( ')' -not -path "./.git/*" )

if [[ "$DRY_RUN" == "1" ]]; then
  find "${find_args[@]}" -print
else
  find "${find_args[@]}" -print -delete
fi
