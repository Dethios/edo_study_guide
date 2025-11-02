#!/usr/bin/env bash
set -euo pipefail

arch="$(uname -m)"
case "$arch" in
  x86_64)  texbin="/usr/local/texlive/2025/bin/x86_64-linux/latexmk" ;;
  aarch64|arm64) texbin="/usr/local/texlive/2025/bin/aarch64-linux/latexmk" ;;
  *) texbin="$(command -v latexmk || true)" ;;
esac

if [[ -x "$texbin" ]]; then
  exec "$texbin" "$@"
else
  echo "latexmk not found for arch '$arch'. Checked: $texbin" >&2
  exit 127
fi
