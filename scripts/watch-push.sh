#!/usr/bin/env bash
set -euo pipefail
ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"

# Watch everything except build artifacts
IGNORE='(^|/)(out|build|\.git)(/|$)'
EVENTS="modify,create,delete,move"

echo "👀 Watching $ROOT (ignoring out/, build/). Ctrl+C to stop."
while inotifywait -r -e $EVENTS --exclude "$IGNORE" "$ROOT" >/dev/null 2>&1; do
  ./scripts/push.sh "Auto-commit (watch): $(date -u +'%H:%M:%S UTC')"
done
