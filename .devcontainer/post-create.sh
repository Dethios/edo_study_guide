#!/usr/bin/env bash
set -euo pipefail

echo "=== Post-create: EDO Study Guide devcontainer setup ==="

# Sanity check: TeX binaries are on PATH
if command -v lualatex > /dev/null 2>&1; then
  echo "TeX found:"
  lualatex --version | head -n 1
else
  echo "WARNING: lualatex not found in PATH."
fi

# Sanity check: latexmk + biber
if command -v latexmk > /dev/null 2>&1; then
  echo "latexmk found:"
  latexmk --version | head -n 1
else
  echo "WARNING: latexmk not found in PATH."
fi

if command -v biber > /dev/null 2>&1; then
  echo "biber found:"
  biber --version | head -n 1
else
  echo "WARNING: biber not found in PATH."
fi

# minted: ensure pygmentize is available (recommended)
if command -v pygmentize > /dev/null 2>&1; then
  echo "pygmentize found:"
  pygmentize -V
else
  echo "WARNING: pygmentize not found (minted will fail/fallback)."
  if command -v sudo > /dev/null 2>&1 && command -v apt-get > /dev/null 2>&1; then
    echo "Installing python3-pygments via apt..."
    sudo apt-get update
    sudo apt-get install -y python3-pygments
  fi
fi

# Font sanity check: Fira Sans + Fira Code
if command -v fc-list > /dev/null 2>&1; then
  if fc-list | grep -qi "Fira Sans"; then
    echo "Fira Sans detected by fontconfig."
  else
    echo "NOTE: Fira Sans not detected by fontconfig."
  fi

  if fc-list | grep -qi "Fira Code"; then
    echo "Fira Code detected by fontconfig."
  else
    echo "NOTE: Fira Code not detected by fontconfig."
  fi
fi

echo "Post-create complete."
