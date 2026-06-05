#!/usr/bin/env python3
"""Check current-events citation and source-ledger consistency.

This intentionally focuses on ``tex/current_events.bib`` because those records
are high-drift current facts and should stay tied to the study-memory source
inventory.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
from pathlib import Path
import re
import sys


ENTRY_RE = re.compile(r"@\w+\s*\{\s*([^,\s]+)\s*,(.*?)(?=^\s*@|\Z)", re.M | re.S)
URL_RE = re.compile(r"\burl\s*=\s*\{([^{}]+)\}", re.I)
CITE_RE = re.compile(
    r"\\(?:(?:auto|text|foot|paren)?cite|srcCite|tabCite)(?:\[[^\]]*\]){0,2}\{([^{}]+)\}"
)


@dataclass(frozen=True)
class BibEntry:
    key: str
    url: str | None


def parse_bib(path: Path) -> list[BibEntry]:
    text = path.read_text(encoding="utf-8")
    entries: list[BibEntry] = []
    for match in ENTRY_RE.finditer(text):
        key = match.group(1).strip()
        body = match.group(2)
        url_match = URL_RE.search(body)
        entries.append(BibEntry(key=key, url=url_match.group(1).strip() if url_match else None))
    return entries


def parse_current_event_cites(root: Path, keys: set[str]) -> set[str]:
    cited: set[str] = set()
    for path in sorted((root / "tex" / "chapters").glob("*.tex")):
        text = path.read_text(encoding="utf-8")
        for match in CITE_RE.finditer(text):
            for key in match.group(1).split(","):
                key = key.strip()
                if key in keys:
                    cited.add(key)
    return cited


def check(root: Path) -> list[str]:
    current_events_bib = root / "tex" / "current_events.bib"
    sources_md = root / "docs" / "study_memory" / "sources.md"
    errors: list[str] = []

    if not current_events_bib.exists():
        return ["missing tex/current_events.bib"]
    if not sources_md.exists():
        return ["missing docs/study_memory/sources.md"]

    entries = parse_bib(current_events_bib)
    if not entries:
        errors.append("tex/current_events.bib contains no BibTeX entries")
        return errors

    by_key: dict[str, BibEntry] = {}
    for entry in entries:
        if entry.key in by_key:
            errors.append(f"tex/current_events.bib: duplicate key {entry.key!r}")
        by_key[entry.key] = entry
        if not entry.url:
            errors.append(f"tex/current_events.bib: {entry.key} has no url field")

    cited_current_event_keys = parse_current_event_cites(root, set(by_key))
    for key in sorted(set(by_key) - cited_current_event_keys):
        errors.append(f"tex/current_events.bib: key {key!r} is not cited by a chapter")

    sources_text = sources_md.read_text(encoding="utf-8")
    for entry in entries:
        if entry.url and entry.url not in sources_text:
            errors.append(
                f"docs/study_memory/sources.md: missing source-ledger URL for current-events key {entry.key!r}: {entry.url}"
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
    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    root = args.root.resolve()
    errors = check(root)
    if errors:
        print("Current-events source-ledger check failed:", file=sys.stderr)
        for error in errors:
            print(f"  - {error}", file=sys.stderr)
        return 1
    print("Current-events source-ledger check passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
