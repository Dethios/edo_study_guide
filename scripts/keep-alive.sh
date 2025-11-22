#!/usr/bin/env bash
set -euo pipefail

INTERVAL_SECONDS="${1:-240}"

if ! [[ "$INTERVAL_SECONDS" =~ ^[0-9]+$ ]] || [ "$INTERVAL_SECONDS" -le 0 ]; then
  echo "Usage: $0 [interval_seconds]" >&2
  exit 1
fi

OS_NAME="$(uname -s)"

fallback_nudge() {
  printf '\r' > /dev/tty 2>/dev/null || printf '\r'
}

nudge() {
  case "$OS_NAME" in
    Darwin)
      if command -v caffeinate >/dev/null 2>&1; then
        caffeinate -u -t 1
      elif command -v osascript >/dev/null 2>&1; then
        osascript -e 'tell application "System Events" to key code 56' >/dev/null
      else
        fallback_nudge
      fi
      ;;
    Linux)
      if command -v xdotool >/dev/null 2>&1; then
        xdotool mousemove_relative --sync 1 1
        xdotool mousemove_relative --sync -- -1 -1
      else
        fallback_nudge
      fi
      ;;
    *)
      fallback_nudge
      ;;
  esac
}

trap 'echo "Stopping keep-alive."; exit 0' INT TERM

echo "Keep-alive running. Interval: ${INTERVAL_SECONDS}s. OS: ${OS_NAME}. Ctrl+C to stop."

while true; do
  nudge
  sleep "$INTERVAL_SECONDS"
done
