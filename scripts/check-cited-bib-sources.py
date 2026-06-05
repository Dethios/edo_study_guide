#!/usr/bin/env python3
"""Audit cited BibTeX URL coverage in the study-memory source ledger.

The guide contains many legacy and coursebook bibliography records that do not
need live URLs. This check focuses on cited BibTeX entries that do have
``http(s)`` URLs and requires those URLs to appear in ``docs/study_memory/sources.md``.
By default it reports gaps without failing; pass ``--strict`` when the exact-URL
backlog is ready to become a validation gate.
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
BIB_PATHS = ("tex/edo.bib", "tex/current_events.bib")


@dataclass(frozen=True)
class BibEntry:
    key: str
    url: str | None
    source: Path


def normalize_url(url: str) -> str:
    return url.strip().replace(r"\%", "%").replace(r"\&", "&")


def parse_bib(path: Path) -> list[BibEntry]:
    text = path.read_text(encoding="utf-8")
    entries: list[BibEntry] = []
    for match in ENTRY_RE.finditer(text):
        key = match.group(1).strip()
        body = match.group(2)
        url_match = URL_RE.search(body)
        entries.append(
            BibEntry(
                key=key,
                url=normalize_url(url_match.group(1)) if url_match else None,
                source=path,
            )
        )
    return entries


def parse_cites(root: Path) -> set[str]:
    cited: set[str] = set()
    for path in sorted((root / "tex" / "chapters").glob("*.tex")):
        text = path.read_text(encoding="utf-8")
        for match in CITE_RE.finditer(text):
            cited.update(key.strip() for key in match.group(1).split(",") if key.strip())
    return cited


def check(root: Path) -> list[str]:
    sources_md = root / "docs" / "study_memory" / "sources.md"
    errors: list[str] = []

    if not sources_md.exists():
        return ["missing docs/study_memory/sources.md"]

    entries: dict[str, BibEntry] = {}
    for relative_path in BIB_PATHS:
        bib_path = root / relative_path
        if not bib_path.exists():
            errors.append(f"missing {relative_path}")
            continue
        for entry in parse_bib(bib_path):
            if entry.key in entries:
                errors.append(
                    f"{relative_path}: duplicate BibTeX key {entry.key!r}; first seen in {entries[entry.key].source.relative_to(root)}"
                )
                continue
            entries[entry.key] = entry

    cited = parse_cites(root)
    for key in sorted(cited - set(entries)):
        errors.append(f"chapter citation references unknown BibTeX key {key!r}")

    sources_text = sources_md.read_text(encoding="utf-8")
    for key in sorted(cited & set(entries)):
        entry = entries[key]
        if not entry.url or not entry.url.startswith(("http://", "https://")):
            continue
        if entry.url not in sources_text:
            errors.append(
                f"docs/study_memory/sources.md: missing source-ledger URL for cited key {key!r}: {entry.url}"
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
        "--strict",
        action="store_true",
        help="return a failing exit code when cited http(s) URLs are missing from sources.md",
    )
    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    errors = check(args.root.resolve())
    if errors:
        print(f"Cited BibTeX source-ledger audit found {len(errors)} gap(s):", file=sys.stderr)
        for error in errors:
            print(f"  - {error}", file=sys.stderr)
        if args.strict:
            return 1
        return 0
    print("Cited BibTeX source-ledger audit found no exact-URL gaps.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
