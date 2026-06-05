#!/usr/bin/env python3
"""Check applied guide-change source URLs against the source ledger.

Imported historical records predate the stricter source-ledger policy, so the
default cutoff focuses on the active end-to-end audit records.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
import re
import sys
from typing import Any


URL_RE = re.compile(r"https?://[^;\s`]+")
TRAILING_PUNCTUATION = ".,)]}"


def extract_urls(value: str) -> list[str]:
    urls: list[str] = []
    for match in URL_RE.finditer(value):
        urls.append(match.group(0).rstrip(TRAILING_PUNCTUATION))
    return urls


def load_jsonl(path: Path) -> list[tuple[int, dict[str, Any]]]:
    records: list[tuple[int, dict[str, Any]]] = []
    with path.open("r", encoding="utf-8") as handle:
        for line_no, line in enumerate(handle, 1):
            stripped = line.strip()
            if not stripped:
                continue
            records.append((line_no, json.loads(stripped)))
    return records


def source_value(source: Any) -> str:
    if isinstance(source, dict):
        return str(source.get("url_or_path", ""))
    return str(source)


def check(root: Path, since: str) -> list[str]:
    guide_changes = root / "docs" / "study_memory" / "guide_changes.jsonl"
    sources_md = root / "docs" / "study_memory" / "sources.md"
    errors: list[str] = []

    if not guide_changes.exists():
        return ["missing docs/study_memory/guide_changes.jsonl"]
    if not sources_md.exists():
        return ["missing docs/study_memory/sources.md"]

    sources_text = sources_md.read_text(encoding="utf-8")
    for line_no, record in load_jsonl(guide_changes):
        if record.get("status") != "applied":
            continue
        date_identified = str(record.get("date_identified", ""))
        if date_identified and date_identified < since:
            continue
        for index, source in enumerate(record.get("source_basis") or [], 1):
            for url in extract_urls(source_value(source)):
                if url not in sources_text:
                    errors.append(
                        "docs/study_memory/guide_changes.jsonl:"
                        f"{line_no}: source_basis[{index}] URL missing from "
                        f"docs/study_memory/sources.md: {url}"
                    )

    return errors


def parse_args(argv: list[str]) -> argparse.Namespace:
    default_root = Path(__file__).resolve().parent.parent
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--root",
        type=Path,
        default=default_root,
        help="study-guide repository root (default: parent of this script)",
    )
    parser.add_argument(
        "--since",
        default="2026-06-05",
        help="check applied guide-change records on or after this ISO date",
    )
    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    errors = check(args.root.resolve(), args.since)
    if errors:
        print("Guide-change source-ledger check failed:", file=sys.stderr)
        for error in errors:
            print(f"  - {error}", file=sys.stderr)
        return 1
    print("Guide-change source-ledger check passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
