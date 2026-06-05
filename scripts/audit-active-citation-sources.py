#!/usr/bin/env python3
"""Report weak source metadata for citations active in the latest PDF build.

The audit reads ``artifacts/build/main.bcf`` to focus on BibTeX keys that were
actually cited by the last build. It is report-only by default because some
active sources are intentionally source-limited, request-filtered, or represented
by controlled-access hosts. Pass ``--strict`` only when the weak-source backlog
is ready to become a validation gate.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
from datetime import date
from pathlib import Path
import re
import sys


ENTRY_RE = re.compile(r"@\w+\s*\{\s*([^,\s]+)\s*,(.*?)(?=^\s*@|\Z)", re.M | re.S)
URL_RE = re.compile(r"\burl\s*=\s*\{([^{}]+)\}", re.I)
URLDATE_RE = re.compile(r"\burldate\s*=\s*\{([^{}]+)\}", re.I)
BCF_CITEKEY_RE = re.compile(r"<bcf:citekey[^>]*>([^<]+)</bcf:citekey>")
BIB_PATHS = ("tex/edo.bib", "tex/current_events.bib", "tex/was_refs.bib")
GENERIC_URLS = {
    "https://uscode.house.gov",
    "https://www.acquisition.gov",
    "https://www.esd.whs.mil",
    "https://www.secnav.navy.mil/doni/default.aspx",
    "https://doctrine.navy.mil",
}


@dataclass(frozen=True)
class BibEntry:
    key: str
    url: str | None
    urldate: str | None
    source: Path


@dataclass(frozen=True)
class Finding:
    key: str
    url: str
    urldate: str
    source: Path
    reasons: tuple[str, ...]


def normalize_url(url: str) -> str:
    return url.strip().replace(r"\%", "%").replace(r"\&", "&")


def first_day_of_current_month() -> str:
    today = date.today()
    return f"{today.year:04d}-{today.month:02d}-01"


def parse_bib(path: Path) -> list[BibEntry]:
    text = path.read_text(encoding="utf-8")
    entries: list[BibEntry] = []
    for match in ENTRY_RE.finditer(text):
        key = match.group(1).strip()
        body = match.group(2)
        url_match = URL_RE.search(body)
        urldate_match = URLDATE_RE.search(body)
        entries.append(
            BibEntry(
                key=key,
                url=normalize_url(url_match.group(1)) if url_match else None,
                urldate=urldate_match.group(1).strip() if urldate_match else None,
                source=path,
            )
        )
    return entries


def parse_active_citekeys(path: Path) -> set[str]:
    text = path.read_text(encoding="utf-8", errors="ignore")
    return set(BCF_CITEKEY_RE.findall(text))


def load_entries(root: Path) -> tuple[dict[str, BibEntry], list[str]]:
    entries: dict[str, BibEntry] = {}
    errors: list[str] = []
    for relative_path in BIB_PATHS:
        bib_path = root / relative_path
        if not bib_path.exists():
            errors.append(f"missing {relative_path}")
            continue
        for entry in parse_bib(bib_path):
            if entry.key in entries:
                first_seen = entries[entry.key].source.relative_to(root)
                errors.append(f"{relative_path}: duplicate BibTeX key {entry.key!r}; first seen in {first_seen}")
                continue
            entries[entry.key] = entry
    return entries, errors


def weak_reasons(entry: BibEntry, min_urldate: str) -> tuple[str, ...]:
    if not entry.url:
        return ()

    reasons: list[str] = []
    url = entry.url
    urldate = entry.urldate or "NODATE"

    if url.rstrip("/") in GENERIC_URLS:
        reasons.append("generic-url")
    if "uscode.house.gov/" in url and "view.xhtml" not in url:
        reasons.append("generic-uscode")
    if urldate == "NODATE":
        reasons.append("missing-urldate")
    elif urldate < min_urldate:
        reasons.append("old-urldate")

    return tuple(reasons)


def check(root: Path, bcf_path: Path, min_urldate: str) -> tuple[list[Finding], list[str], int]:
    if not bcf_path.exists():
        relative_bcf = bcf_path.relative_to(root) if bcf_path.is_relative_to(root) else bcf_path
        return [], [f"missing {relative_bcf}; run a PDF build before this audit"], 0

    errors: list[str] = []
    active_keys = parse_active_citekeys(bcf_path)
    entries, load_errors = load_entries(root)
    errors.extend(load_errors)

    findings: list[Finding] = []
    for key in sorted(active_keys & set(entries)):
        entry = entries[key]
        reasons = weak_reasons(entry, min_urldate)
        if not reasons:
            continue
        findings.append(
            Finding(
                key=key,
                url=entry.url or "NOURL",
                urldate=entry.urldate or "NODATE",
                source=entry.source,
                reasons=reasons,
            )
        )

    for key in sorted(active_keys - set(entries)):
        errors.append(f"active citekey {key!r} is missing from configured BibTeX files")

    return findings, errors, len(active_keys)


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
        "--bcf",
        type=Path,
        default=Path("artifacts/build/main.bcf"),
        help="build-control file to inspect, relative to root unless absolute",
    )
    parser.add_argument(
        "--min-urldate",
        default=first_day_of_current_month(),
        help="minimum acceptable BibTeX urldate in YYYY-MM-DD format (default: first day of current month)",
    )
    parser.add_argument(
        "--strict",
        action="store_true",
        help="return a failing exit code when weak active source metadata is found",
    )
    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    root = args.root.resolve()
    bcf_path = args.bcf if args.bcf.is_absolute() else root / args.bcf
    findings, errors, active_count = check(root, bcf_path, args.min_urldate)

    if errors:
        print("Active-citation source metadata audit had setup issue(s):", file=sys.stderr)
        for error in errors:
            print(f"  - {error}", file=sys.stderr)
        if args.strict:
            return 1

    if findings:
        print(
            f"Active-citation source metadata audit found {len(findings)} weak item(s) "
            f"among {active_count} active citekey(s); min urldate is {args.min_urldate}:"
        )
        for finding in findings:
            source = finding.source.relative_to(root)
            print(
                f"  - {finding.key} | {','.join(finding.reasons)} | "
                f"urldate={finding.urldate} | source={source} | url={finding.url}"
            )
        return 1 if args.strict else 0

    print(
        f"Active-citation source metadata audit found no weak items among "
        f"{active_count} active citekey(s); min urldate is {args.min_urldate}."
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
