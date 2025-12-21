#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG="$ROOT/latexindent.yaml"

if ! command -v latexindent >/dev/null 2>&1; then
  echo "latexindent not found in PATH." >&2
  exit 127
fi

targets=()

if [[ $# -eq 0 ]]; then
  targets+=("$ROOT/tex/main.tex")
else
  while [[ $# -gt 0 ]]; do
    if [[ -d "$1" ]]; then
      while IFS= read -r -d '' f; do
        targets+=("$f")
      done < <(find "$1" -type f -name '*.tex' -print0)
    else
      targets+=("$1")
    fi
    shift
  done
fi

for f in "${targets[@]}"; do
  if [[ ! -f "$f" ]]; then
    echo "Skipping missing file: $f" >&2
    continue
  fi
  latexindent -w -s -m -l="$CONFIG" --overwriteIfDifferent --outputdir=/dev/null "$f"
done
