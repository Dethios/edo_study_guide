#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

SOURCE_PDF="$ROOT/out/main.pdf"
if [[ ! -f "$SOURCE_PDF" ]]; then
  echo "Source PDF not found at $SOURCE_PDF" >&2
  exit 1
fi

RELEASE_DIR="$ROOT/release"
mkdir -p "$RELEASE_DIR"

today="$(date +%Y%m%d)"
DEST_PDF="$RELEASE_DIR/EDO_Study_Guide_dtd_${today}.pdf"

cp "$SOURCE_PDF" "$DEST_PDF"
echo "Copied $SOURCE_PDF to $DEST_PDF"
