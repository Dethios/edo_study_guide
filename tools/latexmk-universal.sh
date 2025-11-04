#!/usr/bin/env bash
set -euo pipefail

# --- Config (customize as needed) ---
: "${ENGINE:=lualatex}"   # lualatex | xelatex | pdflatex
: "${OUTDIR:=out}"
: "${AUXDIR:=build}"

arch="$(uname -m)"

# Locate texliveonfly
case "$arch" in
  x86_64)        TEXLIVEONFLY="/usr/local/texlive/2025/bin/x86_64-linux/texliveonfly" ;;
  aarch64|arm64) TEXLIVEONFLY="/usr/local/texlive/2025/bin/aarch64-linux/texliveonfly" ;;
  *)             TEXLIVEONFLY="$(command -v texliveonfly || true)" ;;
esac

# Locate latexmk
case "$arch" in
  x86_64)        LATEXMK="/usr/local/texlive/2025/bin/x86_64-linux/latexmk" ;;
  aarch64|arm64) LATEXMK="/usr/local/texlive/2025/bin/aarch64-linux/latexmk" ;;
  *)             LATEXMK="$(command -v latexmk || true)" ;;
esac

[[ -x "${TEXLIVEONFLY:-}" ]] || { echo "ERROR: texliveonfly not found"; exit 127; }
[[ -x "${LATEXMK:-}"      ]] || { echo "ERROR: latexmk not found";      exit 127; }

# Engine flag for latexmk
engine_flag=""
case "$ENGINE" in
  lualatex) engine_flag="-lualatex" ;;
  xelatex)  engine_flag="-xelatex"  ;;
  pdflatex) engine_flag="" ;;  # latexmk -pdf defaults to pdflatex
  *) echo "ERROR: Unsupported ENGINE='$ENGINE' (use lualatex|xelatex|pdflatex)"; exit 2 ;;
esac

mkdir -p "$OUTDIR" "$AUXDIR"

# Create a one-shot shim with all args embedded (no extra argv to texliveonfly)
shim="$(mktemp -t texonfly-mk-XXXXXX.sh)"
cat >"$shim" <<EOF
#!/usr/bin/env bash
set -euo pipefail
TEXFILE="\$1"
exec "$LATEXMK" -pdf $engine_flag \
  -outdir="$OUTDIR" -auxdir="$AUXDIR" \
  -latexoption="-synctex=1" \
  -latexoption="-shell-escape" \
  -latexoption="-interaction=nonstopmode" \
  -latexoption="-file-line-error" \
  "\$TEXFILE"
EOF
chmod +x "$shim"

# Collect .tex targets; default to main.tex
tex_targets=()
for arg in "$@"; do
  [[ "$arg" == *.tex && -e "$arg" ]] && tex_targets+=("$arg")
done
if [[ ${#tex_targets[@]} -eq 0 ]]; then
  [[ -e main.tex ]] || { echo "Usage: $(basename "$0") [file1.tex ...]"; rm -f "$shim"; exit 2; }
  tex_targets=("main.tex")
fi

# Run: texliveonfly -c <shim> <file.tex>
for f in "${tex_targets[@]}"; do
  echo ">> texliveonfly preflight via latexmk: '$f'  (ENGINE=$ENGINE, OUTDIR=$OUTDIR, AUXDIR=$AUXDIR, synctex=1, shell-escape)"
  "$TEXLIVEONFLY" -c "$shim" "$f"
done

rm -f "$shim"
