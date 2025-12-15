#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

echo "=== Codex Cloud setup: EDO Study Guide LaTeX toolchain ==="

if ! command -v apt-get >/dev/null 2>&1; then
  echo "ERROR: apt-get not found; this setup script expects a Debian/Ubuntu base image."
  exit 1
fi

sudo_cmd=""
if [ "$(id -u)" -ne 0 ]; then
  if command -v sudo >/dev/null 2>&1; then
    sudo_cmd="sudo"
  else
    echo "ERROR: not running as root and sudo is not available."
    exit 1
  fi
fi

echo "Installing system packages (TeX Live + helpers)..."
$sudo_cmd apt-get update
$sudo_cmd apt-get install -y --no-install-recommends \
  biber \
  fontconfig \
  fonts-fira \
  fonts-firacode \
  latexmk \
  make \
  perl \
  python3 \
  python3-pygments \
  texlive-bibtex-extra \
  texlive-extra-utils \
  texlive-fonts-extra \
  texlive-fonts-recommended \
  texlive-lang-english \
  texlive-latex-extra \
  texlive-luatex \
  texlive-pictures \
  texlive-science

$sudo_cmd rm -rf /var/lib/apt/lists/* >/dev/null 2>&1 || true

if command -v python3 >/dev/null 2>&1 && ! command -v python >/dev/null 2>&1; then
  $sudo_cmd ln -sf "$(command -v python3)" /usr/local/bin/python || true
fi

if command -v fc-cache >/dev/null 2>&1; then
  fc-cache -f >/dev/null 2>&1 || true
fi

if command -v luaotfload-tool >/dev/null 2>&1; then
  luaotfload-tool --update >/dev/null 2>&1 || true
fi

echo "Installed versions (best-effort):"
command -v lualatex >/dev/null 2>&1 && lualatex --version | head -n 1 || true
command -v latexmk >/dev/null 2>&1 && latexmk --version | head -n 1 || true
command -v biber >/dev/null 2>&1 && biber --version | head -n 1 || true
command -v pygmentize >/dev/null 2>&1 && pygmentize -V || true

echo "Codex Cloud setup complete."
