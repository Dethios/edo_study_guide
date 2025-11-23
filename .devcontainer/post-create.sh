#!/usr/bin/env bash
set -euo pipefail

echo "=== Post-create: EDO Study Guide devcontainer setup ==="

# Sanity check: TeX Live 2025 is on PATH
if command -v pdflatex > /dev/null 2>&1; then
  echo "TeX found:"
  pdflatex --version | head -n 1
else
  echo "WARNING: pdflatex not found in PATH."
fi

# Sanity check: tlmgr is available
if command -v tlmgr > /dev/null 2>&1; then
  echo "tlmgr version:"
  tlmgr --version | head -n 1
else
  echo "WARNING: tlmgr not found; TeX Live management unavailable."
fi

# Optional: confirm Fira Code is visible to fontconfig
if command -v fc-list > /dev/null 2>&1; then
  if fc-list | grep -qi "Fira Code"; then
    echo "Fira Code font detected by fontconfig."
  else
    echo "NOTE: Fira Code not detected by fontconfi)."
    echo Installing Fira Code....
    # Install Fira Code system font via apt
    RUN apt-get update \
      && apt-get install -y fonts-firacode \
      && rm -rf /var/lib/apt/lists/* \
      && fc-cache -f -v
  fi
fi

echo "Post-create complete."
