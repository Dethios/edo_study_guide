#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DOC_FILE="${1:-tex/main.tex}"

if [[ ! -f "$DOC_FILE" ]]; then
    if [[ -f "$ROOT_DIR/$DOC_FILE" ]]; then
        DOC_FILE="$ROOT_DIR/$DOC_FILE"
    elif [[ -f "$ROOT_DIR/tex/$DOC_FILE" ]]; then
        DOC_FILE="$ROOT_DIR/tex/$DOC_FILE"
    else
        echo "[docker-build] error: TeX root file not found: $DOC_FILE" >&2
        exit 2
    fi
fi

cd "$ROOT_DIR"

mkdir -p build out

# Ensure TeX and biber can resolve repo-local class/style/bib inputs.
export TEXINPUTS="$ROOT_DIR/tex:${TEXINPUTS:-}"
export BIBINPUTS="$ROOT_DIR/tex:${BIBINPUTS:-}"
export BSTINPUTS="$ROOT_DIR/tex:${BSTINPUTS:-}"

# biber is invoked with --input-directory=build by project latexmkrc.
# Stage bib files into build/ so local bib resources resolve reliably.
shopt -s nullglob
for bib_file in "$ROOT_DIR"/tex/*.bib; do
    ln -sf "../tex/$(basename "$bib_file")" "$ROOT_DIR/build/$(basename "$bib_file")"
done
shopt -u nullglob

echo "[docker-build] enabling MiKTeX on-the-fly install..."
initexmf --set-config-value "[MPM]AutoInstall=1"
initexmf --update-fndb

echo "[docker-build] updating MiKTeX package database..."
miktex packages update-package-database

echo "[docker-build] updating installed MiKTeX packages..."
if ! miktex packages update; then
    echo "[docker-build] warning: package update failed; continuing build." >&2
fi

if [[ -f "$ROOT_DIR/miktex-packages.txt" ]]; then
    echo "[docker-build] requiring repo package set..."
    miktex packages require --package-id-file "$ROOT_DIR/miktex-packages.txt"
fi

resolve_biber_package_id() {
    local package_ids
    local candidate

    package_ids="$(miktex packages list --template "{id}" 2>/dev/null || true)"
    candidate="$(printf '%s\n' "$package_ids" | grep -E '^biber-linux-' | head -n 1 || true)"

    if [[ -z "$candidate" ]]; then
        candidate="$(printf '%s\n' "$package_ids" | grep -E '^biber-' | head -n 1 || true)"
    fi

    printf '%s' "$candidate"
}

echo "[docker-build] resolving biber package ID for container architecture ($(uname -m))..."
BIBER_PACKAGE_ID="$(resolve_biber_package_id)"
if [[ -n "$BIBER_PACKAGE_ID" ]]; then
    echo "[docker-build] requiring biber package: $BIBER_PACKAGE_ID"
    miktex packages require "$BIBER_PACKAGE_ID"
else
    echo "[docker-build] warning: no biber package ID found in this MiKTeX feed; relying on on-the-fly install." >&2
fi

echo "[docker-build] running latexmk for $DOC_FILE"
latexmk \
    -lualatex \
    -quiet \
    -interaction=nonstopmode \
    -file-line-error \
    -f \
    -shell-escape \
    -outdir=out \
    -auxdir=build \
    "$DOC_FILE"
