#!/bin/sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
if command -v uv >/dev/null 2>&1; then
  exec uv run python "$ROOT_DIR/scripts/check-study-memory.py" "$ROOT_DIR"
elif command -v python3 >/dev/null 2>&1; then
  exec python3 "$ROOT_DIR/scripts/check-study-memory.py" "$ROOT_DIR"
else
  echo "error: need uv or python3 to validate study memory" >&2
  exit 1
fi
