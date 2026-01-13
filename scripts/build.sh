#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

ENGINE="lualatex"
WATCH=0
CLEAN=0
PREFLIGHT=0
SHELL_ESCAPE=1
JOBS=""
OUTDIR="out"
AUXDIR="build"
QUIET=0
TEXFILE=""
SCRUB=1

usage() {
  cat <<'EOF'
Usage: scripts/build.sh [options] [file.tex]

Options:
  --engine {lualatex|xelatex|pdflatex}  LaTeX engine (default: lualatex)
  -w, --watch                           Run latexmk in -pvc mode
  --clean                               Clean aux/output for the target and exit
  --preflight                           Run texliveonfly preflight if available
  --no-shell-escape                     Disable shell-escape
  --jobs N                              Parallel jobs for latexmk
  --outdir DIR                          Output directory (default: out)
  --auxdir DIR                          Aux directory (default: build)
  --quiet                               Quiet latexmk output
  --no-scrub                            Skip post-build scrub of temp/lock files
  -h, --help                            Show this help
EOF
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        --engine)
            ENGINE="${2:-}"
            shift 2
            ;;
        -w|--watch)
            WATCH=1
            shift
            ;;
        --clean)
            CLEAN=1
            shift
            ;;
        --preflight)
            PREFLIGHT=1
            shift
            ;;
        --no-shell-escape)
            SHELL_ESCAPE=0
            shift
            ;;
        --jobs)
            JOBS="${2:-}"
            shift 2
            ;;
        --outdir)
            OUTDIR="${2:-}"
            shift 2
            ;;
        --auxdir)
            AUXDIR="${2:-}"
            shift 2
            ;;
        --quiet)
            QUIET=1
            shift
            ;;
        --no-scrub)
            SCRUB=0
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *.tex)
            TEXFILE="$1"
            shift
            ;;
        *)
            usage
            exit 2
            ;;
    esac
done

if [[ -z "$TEXFILE" ]]; then
    if [[ -f "$ROOT/tex/main.tex" ]]; then
        TEXFILE="$ROOT/tex/main.tex"
    elif [[ -f "$ROOT/main.tex" ]]; then
        TEXFILE="$ROOT/main.tex"
    else
        echo "No main.tex found (expected tex/main.tex)." >&2
        exit 2
    fi
else
    if [[ ! -f "$TEXFILE" ]]; then
        if [[ -f "$ROOT/$TEXFILE" ]]; then
            TEXFILE="$ROOT/$TEXFILE"
        elif [[ -f "$ROOT/tex/$TEXFILE" ]]; then
            TEXFILE="$ROOT/tex/$TEXFILE"
        else
            echo "File not found: $TEXFILE" >&2
            exit 2
        fi
    fi
fi

cd "$ROOT"

mkdir -p "$OUTDIR" "$AUXDIR"
# Ensure TeX can locate class/style/bib files when latexmk runs from repo root.
export TEXINPUTS="$ROOT/tex:${TEXINPUTS:-}"
export BIBINPUTS="$ROOT/tex:${BIBINPUTS:-}"
export BSTINPUTS="$ROOT/tex:${BSTINPUTS:-}"

run_scrub() {
    local scrub="$ROOT/scripts/scrub.sh"
        if [[ -x "$scrub" ]]; then
            "$scrub" || true
        fi
}

if [[ "$CLEAN" == "1" ]]; then
    set +e
    latexmk -C -outdir="$OUTDIR" -auxdir="$AUXDIR" "$TEXFILE"
    status=$?
    set -e
    if [[ "$SCRUB" == "1" ]]; then
        run_scrub
    fi
    exit "$status"
fi

if [[ "$PREFLIGHT" == "1" ]]; then
    if command -v texliveonfly >/dev/null 2>&1; then
        texliveonfly --compiler="$ENGINE" \
        --arguments="-interaction=nonstopmode -halt-on-error -file-line-error" \
        "$TEXFILE" || true
    else
        echo "texliveonfly not found; skipping preflight." >&2
    fi
fi

case "$ENGINE" in
    lualatex) ENGINE_SWITCH="-lualatex" ;;
    xelatex) ENGINE_SWITCH="-xelatex" ;;
    pdflatex) ENGINE_SWITCH="" ;;
    *)
        echo "Unsupported engine: $ENGINE" >&2
        exit 2
        ;;
esac

LMK_ARGS=(
    "-r" "$ROOT/tex/latexmkrc"
    "-pdf"
    "-synctex=1"
    "-interaction=nonstopmode"
    "-file-line-error"
    "-outdir=$OUTDIR"
    "-auxdir=$AUXDIR"
    "-f"
)
[[ -n "$ENGINE_SWITCH" ]] && LMK_ARGS+=("$ENGINE_SWITCH")
[[ "$SHELL_ESCAPE" == "1" ]] && LMK_ARGS+=("-shell-escape")
[[ -n "$JOBS" ]] && LMK_ARGS+=("-jobs=$JOBS")
[[ "$QUIET" == "1" ]] && LMK_ARGS+=("-quiet")
[[ "$WATCH" == "1" ]] && LMK_ARGS+=("-pvc")

set +e
latexmk "${LMK_ARGS[@]}" "$TEXFILE"
status=$?
set -e

if [[ "$SCRUB" == "1" ]]; then
    run_scrub
fi

exit "$status"
