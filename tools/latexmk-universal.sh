#!/usr/bin/env bash
set -euo pipefail

# --- Config ---
: "${TEX_COMPILER:=lualatex}"   # pdflatex|xelatex|lualatex, etc.

arch="$(uname -m)"

# --- Locate texliveonfly for this arch ---
case "$arch" in
  x86_64)        TEXLIVEONFLY="/usr/local/texlive/2025/bin/x86_64-linux/texliveonfly" ;;
  aarch64|arm64) TEXLIVEONFLY="/usr/local/texlive/2025/bin/aarch64-linux/texliveonfly" ;;
  *)             TEXLIVEONFLY="$(command -v texliveonfly || true)" ;;
esac

if [[ -z "${TEXLIVEONFLY:-}" || ! -x "${TEXLIVEONFLY:-/nonexistent}" ]]; then
  echo "ERROR: texliveonfly not found for arch '$arch'. Looked for: ${TEXLIVEONFLY:-<unset>}" >&2
  exit 127
fi

# --- Collect .tex targets from args; default to ./main.tex if none provided ---
tex_targets=()
for arg in "$@"; do
  if [[ "$arg" == *.tex && -e "$arg" ]]; then
    tex_targets+=("$arg")
  fi
done

if [[ ${#tex_targets[@]} -eq 0 ]]; then
  if [[ -e "main.tex" ]]; then
    tex_targets=("main.tex")
  else
    echo "Usage: $(basename "$0") [file1.tex file2.tex ...]" >&2
    echo "Hint: no files given and ./main.tex not found." >&2
    exit 2
  fi
fi

# --- Run texliveonfly once per target (quietly) to auto-install missing packages ---
for f in "${tex_targets[@]}"; do
  echo ">> texliveonfly preflight: '$f' (compiler=${TEX_COMPILER})"
  # -c selects engine; -q quiets chatter; '--' passes through to engine if needed later
  "$TEXLIVEONFLY" -c "$TEX_COMPILER" -q -- "$f"
done
