#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

ENGINE="lualatex"
WATCH=0
CLEAN=0
SHELL_ESCAPE=1
JOBS=""
OUTDIR="artifacts/out"
AUXDIR="artifacts/build"
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
  --no-shell-escape                     Disable shell-escape
  --jobs N                              Parallel jobs for latexmk
  --outdir DIR                          Output directory (default: artifacts/out)
  --auxdir DIR                          Aux directory (default: artifacts/build)
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

pick_writable_dir() {
    local preferred="$1"
    local fallback_leaf="$2"
    local tmp_root="${TMPDIR:-/tmp}"
    local fallback="$tmp_root/edo_study_guide/$fallback_leaf"
    local probe

    mkdir -p "$preferred" 2>/dev/null || true
    probe="$preferred/.write-test-$$"
    if : > "$probe" 2>/dev/null; then
        rm -f "$probe"
        printf '%s\n' "$preferred"
        return 0
    fi

    mkdir -p "$fallback"
    probe="$fallback/.write-test-$$"
    : > "$probe"
    rm -f "$probe"
    printf '%s\n' "$fallback"
}

if [[ "$OUTDIR" = /* ]]; then
    OUTDIR_ABS="$OUTDIR"
else
    OUTDIR_ABS="$ROOT/$OUTDIR"
fi
if [[ "$AUXDIR" = /* ]]; then
    AUXDIR_ABS="$AUXDIR"
else
    AUXDIR_ABS="$ROOT/$AUXDIR"
fi
OUTDIR_ABS="$(pick_writable_dir "$OUTDIR_ABS" out)"
AUXDIR_ABS="$(pick_writable_dir "$AUXDIR_ABS" build)"
mkdir -p "$OUTDIR_ABS" "$AUXDIR_ABS"

# Ensure luaotfload/fontspec cache paths are writable (helps sandboxed runs).
export TEXMFVAR="$(pick_writable_dir "$AUXDIR_ABS/texmf-var/codex" texmf-var)"
export TEXMFCACHE="$(pick_writable_dir "$AUXDIR_ABS/texmf-cache/codex" texmf-cache)"
mkdir -p "$TEXMFVAR" "$TEXMFCACHE"

DEFAULT_TIKZ_CACHE="$ROOT/artifacts/tikz"
if [[ -z "${MODERNTECH_TIKZ_EXTERNAL_PRIMARY:-}" ]]; then
    export MODERNTECH_TIKZ_EXTERNAL_PRIMARY="$DEFAULT_TIKZ_CACHE"
fi
if [[ -z "${MODERNTECH_TIKZ_EXTERNAL_FALLBACK:-}" ]]; then
    export MODERNTECH_TIKZ_EXTERNAL_FALLBACK="$DEFAULT_TIKZ_CACHE"
fi
mkdir -p "$MODERNTECH_TIKZ_EXTERNAL_PRIMARY"
if [[ "$MODERNTECH_TIKZ_EXTERNAL_FALLBACK" != "$MODERNTECH_TIKZ_EXTERNAL_PRIMARY" ]]; then
    mkdir -p "$MODERNTECH_TIKZ_EXTERNAL_FALLBACK"
fi

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
    latexmk -C -r "$ROOT/tex/latexmkrc" -outdir="$OUTDIR_ABS" -auxdir="$AUXDIR_ABS" "$TEXFILE"
    status=$?
    set -e
    if [[ "$SCRUB" == "1" ]]; then
        run_scrub
    fi
    exit "$status"
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

# Determine jobname: for subfiles, use the basename for clearer output naming
JOBNAME=""
if [[ "$TEXFILE" == */chapters/*.tex || "$TEXFILE" == *chapter*.tex ]]; then
    JOBNAME=$(basename "$TEXFILE" .tex)
    echo "[build] subfile build detected, jobname: $JOBNAME" >&2
fi

LMK_ARGS=(
    "-r" "$ROOT/tex/latexmkrc"
    "-pdf"
    "-synctex=1"
    "-interaction=nonstopmode"
    "-file-line-error"
    "-outdir=$OUTDIR_ABS"
    "-auxdir=$AUXDIR_ABS"
    "-f"
)
[[ -n "$ENGINE_SWITCH" ]] && LMK_ARGS+=("$ENGINE_SWITCH")
[[ "$SHELL_ESCAPE" == "1" ]] && LMK_ARGS+=("-shell-escape")
[[ -n "$JOBS" ]] && LMK_ARGS+=("-jobs=$JOBS")
[[ "$QUIET" == "1" ]] && LMK_ARGS+=("-quiet")
[[ "$WATCH" == "1" ]] && LMK_ARGS+=("-pvc")
[[ -n "$JOBNAME" ]] && LMK_ARGS+=("-jobname=$JOBNAME")

set +e
latexmk "${LMK_ARGS[@]}" "$TEXFILE"
status=$?
set -e

if [[ "$SCRUB" == "1" ]]; then
    run_scrub
fi

exit "$status"
