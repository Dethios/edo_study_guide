#!/usr/bin/env bash
set -euo pipefail

echo "=== Codex Cloud maintenance: EDO Study Guide LaTeX toolchain ==="

missing=0
for bin in lualatex latexmk biber pygmentize make; do
  if ! command -v "$bin" >/dev/null 2>&1; then
    echo "Missing required binary: $bin"
    missing=1
  fi
done

if [ "$missing" -eq 1 ]; then
  echo "Re-running setup..."
  bash .codex/setup.sh
fi

if command -v fc-cache >/dev/null 2>&1; then
  fc-cache -f >/dev/null 2>&1 || true
fi

if command -v luaotfload-tool >/dev/null 2>&1; then
  luaotfload-tool --update >/dev/null 2>&1 || true
fi

echo "Codex Cloud maintenance complete."
