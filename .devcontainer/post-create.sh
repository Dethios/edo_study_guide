#!/usr/bin/env bash
set -euo pipefail

WORKSPACE_DIR="${WORKSPACE_FOLDER:-$(pwd)}"

# OS-level deps
sudo apt-get update
sudo apt-get install -y \
  python3 \
  python3-pip \
  python3-venv \
  python3-pygments \
  chktex \
  ghostscript \
  fonts-firacode \
  fonts-cascadia-code \
  libyaml-tiny-perl \
  libfile-homedir-perl \
  libunicode-linebreak-perl
sudo apt-get clean

# TeX Live via tlmgr – no sudo
if command -v tlmgr >/dev/null 2>&1; then
  tlmgr update --self
  tlmgr install \
    latexmk latexindent texliveonfly biber biblatex csquotes siunitx \
    booktabs caption ragged2e enumitem tabularray tblr-extras tcolorbox \
    marginnote ifoddpage lastpage scrlayer-scrpage float chngcntr \
    minted listings pgf smartdiagram standalone subfiles xstring \
    glossaries-extra babel-english datetime2 hyperref xurl xr-hyper \
    bookmark shellesc adjustbox grffile fontspec unicode-math xcolor \
    setspace kvoptions iftex etoolbox fira xcharter xcharter-math \
    libertinus-otf stix2-otf luaotfload lualatex-math

  luaotfload-tool --update
  fc-cache -fv
else
  echo "WARNING: tlmgr not found; skipping TeX Live setup."
fi

# VS Code settings sync
SETTINGS_SOURCE="${WORKSPACE_DIR}/.vscode/settings.json"
if [[ -f "${SETTINGS_SOURCE}" ]]; then
  for target in \
    /home/vscode/.vscode-server/data/Machine/settings.json \
    /home/vscode/.vscode-remote/data/Machine/settings.json
  do
    sudo mkdir -p "$(dirname "${target}")"
    sudo cp "${SETTINGS_SOURCE}" "${target}"
  done
  sudo chown -R vscode:vscode /home/vscode/.vscode-server /home/vscode/.vscode-remote 2>/dev/null || true
fi
