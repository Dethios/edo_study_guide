#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

OUTPUT=""
LOG_FILE=""
LOG_LINES=300
INCLUDE_DIFF=1
INCLUDE_STAGED=1
INCLUDE_LOG=1
KEEP_STAGE=0
LIST_FILE=""
FILES=()

usage() {
  cat <<'EOF'
Usage: scripts/ai-context.sh [options] [file ...]

Build an ai_context.zip bundle with diffs, log excerpt, and selected files.

Options:
  -o, --output PATH       Output zip path (default: scratch/ai_context.zip)
  --log PATH              Log file to excerpt (default: artifacts/build/main.log or newest build/out log)
  --log-lines N           Number of log lines to include (default: 300)
  --no-diff               Skip git working tree diff
  --no-staged             Skip git staged diff
  --no-log                Skip log excerpt
  -f, --file PATH         File to include (repeatable)
  --list PATH             Text file with file paths to include (one per line, # comments ok)
  --keep-stage            Keep the staging folder in scratch/ for inspection
  -h, --help              Show this help
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -o|--output)
      OUTPUT="${2:-}"
      shift 2
      ;;
    --log)
      LOG_FILE="${2:-}"
      shift 2
      ;;
    --log-lines)
      LOG_LINES="${2:-}"
      shift 2
      ;;
    --no-diff)
      INCLUDE_DIFF=0
      shift
      ;;
    --no-staged)
      INCLUDE_STAGED=0
      shift
      ;;
    --no-log)
      INCLUDE_LOG=0
      shift
      ;;
    -f|--file)
      FILES+=("${2:-}")
      shift 2
      ;;
    --list)
      LIST_FILE="${2:-}"
      shift 2
      ;;
    --keep-stage)
      KEEP_STAGE=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      FILES+=("$1")
      shift
      ;;
  esac
done

if [[ -z "$OUTPUT" ]]; then
  OUTPUT="$ROOT/scratch/ai_context.zip"
elif [[ "$OUTPUT" != /* ]]; then
  OUTPUT="$ROOT/$OUTPUT"
fi

if [[ -n "$LIST_FILE" ]]; then
  if [[ -f "$LIST_FILE" ]]; then
    while IFS= read -r line || [[ -n "$line" ]]; do
      [[ -z "$line" ]] && continue
      [[ "$line" =~ ^[[:space:]]*# ]] && continue
      FILES+=("$line")
    done < "$LIST_FILE"
  else
    echo "List file not found: $LIST_FILE" >&2
  fi
fi

mkdir -p "$ROOT/scratch"
STAGE_DIR="$(mktemp -d "$ROOT/scratch/ai_context.XXXXXX")"
CONTEXT_DIR="$STAGE_DIR/context"
FILES_DIR="$CONTEXT_DIR/files"
NOTES_FILE="$CONTEXT_DIR/notes.txt"
mkdir -p "$FILES_DIR"

cleanup() {
  if [[ "$KEEP_STAGE" == "0" ]]; then
    rm -rf "$STAGE_DIR"
  fi
}
trap cleanup EXIT

if [[ "$INCLUDE_DIFF" == "1" || "$INCLUDE_STAGED" == "1" ]]; then
  if command -v git >/dev/null 2>&1 && git -C "$ROOT" rev-parse --git-dir >/dev/null 2>&1; then
    git -C "$ROOT" status --short > "$CONTEXT_DIR/git_status.txt" || true
    git -C "$ROOT" rev-parse HEAD > "$CONTEXT_DIR/git_head.txt" || true
    if [[ "$INCLUDE_DIFF" == "1" ]]; then
      git -C "$ROOT" diff --patch > "$CONTEXT_DIR/git_diff.patch" || true
    fi
    if [[ "$INCLUDE_STAGED" == "1" ]]; then
      git -C "$ROOT" diff --staged --patch > "$CONTEXT_DIR/git_diff_staged.patch" || true
    fi
  else
    echo "git not available or repo not detected." >> "$NOTES_FILE"
  fi
fi

if [[ "$INCLUDE_LOG" == "1" ]]; then
  if [[ -n "$LOG_FILE" ]]; then
    if [[ "$LOG_FILE" != /* ]]; then
      LOG_FILE="$ROOT/$LOG_FILE"
    fi
  else
    if [[ -f "$ROOT/artifacts/build/main.log" ]]; then
      LOG_FILE="$ROOT/artifacts/build/main.log"
    elif [[ -f "$ROOT/build/main.log" ]]; then
      LOG_FILE="$ROOT/build/main.log"
    elif [[ -f "$ROOT/artifacts/out/main.log" ]]; then
      LOG_FILE="$ROOT/artifacts/out/main.log"
    elif [[ -f "$ROOT/out/main.log" ]]; then
      LOG_FILE="$ROOT/out/main.log"
    else
      LOG_FILE="$(ls -t "$ROOT/artifacts/build"/*.log "$ROOT/build"/*.log "$ROOT/artifacts/out"/*.log "$ROOT/out"/*.log 2>/dev/null | head -n 1 || true)"
    fi
  fi

  if [[ -n "$LOG_FILE" && -f "$LOG_FILE" ]]; then
    tail -n "$LOG_LINES" "$LOG_FILE" > "$CONTEXT_DIR/log_tail.txt" || true
    echo "$LOG_FILE" > "$CONTEXT_DIR/log_source.txt"
  else
    echo "No log file found." > "$CONTEXT_DIR/log_tail.txt"
  fi
fi

missing=()
skipped=()
added=()

for path in "${FILES[@]}"; do
  [[ -z "$path" ]] && continue
  candidate="$path"
  if [[ "$candidate" != /* ]]; then
    candidate="$ROOT/$candidate"
  fi
  if [[ ! -e "$candidate" ]]; then
    missing+=("$path")
    continue
  fi
  if [[ -d "$candidate" ]]; then
    skipped+=("$path (directory)")
    continue
  fi
  abs_path="$(cd "$(dirname "$candidate")" && pwd)/$(basename "$candidate")"
  if [[ "$abs_path" == "$ROOT/"* ]]; then
    rel_path="${abs_path#$ROOT/}"
  else
    rel_path="external/$(basename "$abs_path")"
  fi
  dest="$FILES_DIR/$rel_path"
  mkdir -p "$(dirname "$dest")"
  cp "$abs_path" "$dest"
  added+=("$rel_path")
done

{
  echo "AI context bundle"
  echo "Created (UTC): $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
  echo "Repo root: $ROOT"
  echo "Output: $OUTPUT"
  echo "Log lines: $LOG_LINES"
  echo "Include diff: $INCLUDE_DIFF"
  echo "Include staged diff: $INCLUDE_STAGED"
  echo "Include log: $INCLUDE_LOG"
  echo ""
  echo "Files included:"
  if [[ ${#added[@]} -eq 0 ]]; then
    echo "  (none)"
  else
    for item in "${added[@]}"; do
      echo "  - $item"
    done
  fi
} > "$CONTEXT_DIR/manifest.txt"

if [[ ${#missing[@]} -gt 0 ]]; then
  {
    echo "Missing files:"
    for item in "${missing[@]}"; do
      echo "  - $item"
    done
  } >> "$NOTES_FILE"
fi

if [[ ${#skipped[@]} -gt 0 ]]; then
  {
    echo "Skipped entries:"
    for item in "${skipped[@]}"; do
      echo "  - $item"
    done
  } >> "$NOTES_FILE"
fi

mkdir -p "$(dirname "$OUTPUT")"

if command -v zip >/dev/null 2>&1; then
  (cd "$STAGE_DIR" && zip -r "$OUTPUT" . >/dev/null)
else
  python3 - "$STAGE_DIR" "$OUTPUT" <<'PY'
import os
import sys
import zipfile

stage = sys.argv[1]
output = sys.argv[2]

with zipfile.ZipFile(output, "w", zipfile.ZIP_DEFLATED) as zf:
    for root, _, files in os.walk(stage):
        for name in files:
            path = os.path.join(root, name)
            rel = os.path.relpath(path, stage)
            zf.write(path, rel)
PY
fi

echo "Wrote $OUTPUT"
