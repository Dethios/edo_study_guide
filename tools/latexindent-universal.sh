#!/usr/bin/env bash
set -euo pipefail

arch="$(uname -m)"
case "$arch" in
  x86_64)  bin="/usr/local/texlive/2025/bin/x86_64-linux/latexindent" ;;
  aarch64|arm64) bin="/usr/local/texlive/2025/bin/aarch64-linux/latexindent" ;;
  *) bin="$(command -v latexindent || true)" ;;
esac

if [[ -x "$bin" ]]; then
  exec "$bin" "$@"
else
  echo "latexindent not found for arch '$arch'. Checked: $bin" >&2
  exit 127
fi
