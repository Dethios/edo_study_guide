#!/usr/bin/env bash
# latexmk-auto.sh — One-shot or PVC build with optional auto package install.
# Works best with TUG TeX Live + tlmgr on WSL.
# ---------------------------------------------------------------------------
# USAGE:
#   latexmk-auto.sh [options] <file.tex>
#
# OPTIONS:
#   --engine {lualatex|xelatex|pdflatex}   Set engine (default: lualatex)
#   --pvc                                  Run in preview-continuous mode
#   --shell-escape                         Enable -shell-escape
#   --jobs N                               Pass -jobs=N to latexmk
#   --no-preinstall                        Skip texliveonfly preinstall pass
#   --no-retry                             Don’t retry after tlmgr resolution
#   --bib {biber|bibtex}                   Force biber or bibtex (auto by default)
#   --outdir DIR                           Output dir (default: out)
#   --auxdir DIR                           Aux dir (default: build)
#   -v|--verbose                           Chatty logs
#
# EXAMPLES:
#   latexmk-auto.sh main.tex
#   latexmk-auto.sh --engine xelatex --shell-escape main.tex
#   latexmk-auto.sh --pvc --jobs 4 main.tex
# ---------------------------------------------------------------------------

set -euo pipefail

log() { echo "[latexmk-auto] $*"; }
vecho() { [[ "${VERBOSE:-0}" == "1" ]] && echo "[latexmk-auto] $*"; }

ENGINE="lualatex"
PVC="0"
SHELL_ESCAPE="1"
JOBS=""
PREINSTALL="1"
RETRY="1"
BIB_MODE="biberap"   # auto|biber|bibtex
OUTDIR="out"
AUXDIR="build"
VERBOSE="0"

# --- Parse args ---
ARGS=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    --engine) ENGINE="${2:-}"; shift 2;;
    --pvc) PVC="1"; shift;;
    --shell-escape) SHELL_ESCAPE="1"; shift;;
    --jobs) JOBS="${2:-}"; shift 2;;
    --no-preinstall) PREINSTALL="0"; shift;;
    --no-retry) RETRY="0"; shift;;
    --bib) BIB_MODE="${2:-}"; shift 2;;
    --outdir) OUTDIR="${2:-}"; shift 2;;
    --auxdir) AUXDIR="${2:-}"; shift 2;;
    -v|--verbose) VERBOSE="1"; shift;;
    -h|--help)
      sed -n '1,80p' "$0"; exit 0;;
    *) ARGS+=("$1"); shift;;
  esac
done

if [[ ${#ARGS[@]} -ne 1 ]]; then
  echo "Usage: $(basename "$0") [options] <file.tex>"; exit 2
fi

TEXFILE="${ARGS[0]}"
[[ -f "$TEXFILE" ]] || { echo "File not found: $TEXFILE"; exit 2; }

# --- Normalize engine flags for latexmk ---
case "$ENGINE" in
  lualatex) ENGINE_SWITCH="-lualatex";;
  xelatex)  ENGINE_SWITCH="-xelatex";;
  pdflatex) ENGINE_SWITCH="-pdf";;  # pdflatex is default when using -pdf
  *) echo "Unsupported engine: $ENGINE"; exit 2;;
esac

# --- Check tlmgr and latexmk availability ---
command -v latexmk >/dev/null 2>&1 || { echo "latexmk not found in PATH."; exit 1; }
command -v tlmgr   >/dev/null 2>&1 || { echo "tlmgr not found in PATH."; exit 1; }

# --- Ensure texliveonfly (preinstall helper) if requested ---
if [[ "$PREINSTALL" == "1" ]]; then
  if ! command -v texliveonfly >/dev/null 2>&1; then
    log "Installing texliveonfly (once) to enable preinstall pass..."
    sudo tlmgr install texliveonfly >/dev/null
  fi
fi

# --- Decide bibliography tool if not forced ---
BIB_SWITCHES=()
if [[ "$BIB_MODE" == "auto" ]]; then
  if grep -qE '\\usepackage(\[[^]]*\])?{biblatex}' "$TEXFILE" 2>/dev/null; then
    BIB_SWITCHES+=("-bibtex=no" "-usebiber")
  else
    # Assume natbib/bibtex workflow if .aux/.bib exist without biblatex
    if compgen -G "*.bib" >/dev/null; then
      BIB_SWITCHES+=("-bibtex")
    fi
  fi
elif [[ "$BIB_MODE" == "biber" ]]; then
  BIB_SWITCHES+=("-bibtex=no" "-usebiber")
elif [[ "$BIB_MODE" == "bibtex" ]]; then
  BIB_SWITCHES+=("-bibtex")
fi

# --- Build latexmk common args ---
LMK_ARGS=(
  "-pdf"                       # produce PDF
  "$ENGINE_SWITCH"
  "-synctex=1"
  "-interaction=nonstopmode"
  "-file-line-error"
  "-halt-on-error"
  "-outdir=$OUTDIR"
  "-auxdir=$AUXDIR"
)
[[ -n "$JOBS" ]] && LMK_ARGS+=("-jobs=$JOBS")
[[ "$SHELL_ESCAPE" == "1" ]] && LMK_ARGS+=("-shell-escape")
LMK_ARGS+=("${BIB_SWITCHES[@]}")

mkdir -p "$OUTDIR" "$AUXDIR"

# --- Optional preinstall pass with texliveonfly ---
preinstall() {
  if [[ "$PREINSTALL" == "1" ]]; then
    if command -v texliveonfly >/dev/null 2>&1; then
      vecho "Running texliveonfly preinstall pass..."
      local compiler="$ENGINE"
      # latexmk-like args trimmed to what texliveonfly accepts
      local extra="-interaction=nonstopmode -halt-on-error -file-line-error"
      texliveonfly --compiler="$compiler" --arguments="$extra" "$TEXFILE" || true
    fi
  fi
}

# --- Parse log for missing files and install via tlmgr ---
install_missing_from_log() {
  local logf="$1"
  [[ -f "$logf" ]] || return 0

  # Collect missing .sty/.cls/.ldf/.def files
  mapfile -t FILES < <(grep -Eo "File \`[^']+\.(sty|cls|ldf|def)\' not found" "$logf" \
    | sed -E "s/.*\`(.*)\' not found/\1/" | sort -u)

  [[ ${#FILES[@]} -eq 0 ]] && return 0

  log "Resolving missing files via tlmgr: ${FILES[*]}"

  local pkgs_to_install=()
  for f in "${FILES[@]}"; do
    # tlmgr search which package contains the file
    local pkg
    pkg=$(tlmgr search --global --file "/$f" 2>/dev/null | awk -F: '/^texlive\..*/{next} /^[^ ]+:/ {print $1; exit}')
    if [[ -z "$pkg" ]]; then
      pkg=$(tlmgr search --global --file "/$f" 2>/dev/null | awk -F: 'NR==1{print $1}')
    fi
    if [[ -n "$pkg" ]]; then
      pkgs_to_install+=("$pkg")
      vecho "Mapped $f -> $pkg"
    else
      log "Could not map $f to a TeX Live package (may be provided by your class/template)."
    fi
  done

  if [[ ${#pkgs_to_install[@]} -gt 0 ]]; then
    # Unique list
    mapfile -t pkgs_to_install < <(printf "%s\n" "${pkgs_to_install[@]}" | sort -u)
    log "Installing: ${pkgs_to_install[*]}"
    sudo tlmgr install "${pkgs_to_install[@]}" || true
    sudo mktexlsr >/dev/null || true
  fi
}

# --- Run latexmk once or in PVC ---
run_latexmk() {
  if [[ "$PVC" == "1" ]]; then
    latexmk -pvc "${LMK_ARGS[@]}" "$TEXFILE"
  else
    latexmk "${LMK_ARGS[@]}" "$TEXFILE"
  fi
}

# --- Main flow ---
preinstall

set +e
run_latexmk
STATUS=$?
set -e

if [[ "$STATUS" -ne 0 && "$RETRY" == "1" && "$PVC" == "0" ]]; then
  # Try to resolve missing packages and retry once
  LOG_BASENAME="$(basename "${TEXFILE%.tex}").log"
  LOG_PATH="$OUTDIR/$LOG_BASENAME"
  [[ -f "$LOG_PATH" ]] || LOG_PATH="$LOG_BASENAME"  # fallback if outdir not used by engine early

  install_missing_from_log "$LOG_PATH"

  log "Retrying build once after installing packages..."
  set +e
  run_latexmk
  STATUS=$?
  set -e
fi

if [[ "$STATUS" -eq 0 ]]; then
  log "Build succeeded. PDF is in: $OUTDIR"
else
  log "Build failed. Check logs in: $OUTDIR"
fi

exit "$STATUS"
