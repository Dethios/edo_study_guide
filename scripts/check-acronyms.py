#!/usr/bin/env python3
"""Check study-guide acronym hygiene.

Rules enforced:
- acronym keys in ``tex/acronyms.def`` must be unique;
- acronym macros used in LaTeX source must reference defined keys;
- acronym macros are not allowed inside table-like environments;
- acronym macros are not allowed inside optional ``\\item[...]`` labels.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
from pathlib import Path
import re
import sys

ACRONYM_MACRO_RE = re.compile(r"\\(?:ac|acs|acp|acsp)\{([^{}]+)\}")
TABLE_ENVS = ("longtblr", "talltblr", "tblr", "tabular", "tabularx", "longtable")


@dataclass(frozen=True)
class Issue:
    path: Path
    line: int
    message: str

    def format(self, root: Path) -> str:
        rel = self.path.relative_to(root) if self.path.is_relative_to(root) else self.path
        return f"{rel}:{self.line}: {self.message}"


def line_number(text: str, index: int) -> int:
    return text.count("\n", 0, index) + 1


def strip_comments_preserve_lines(text: str) -> str:
    cleaned: list[str] = []
    for line in text.splitlines(keepends=True):
        cut = len(line)
        for match in re.finditer("%", line):
            backslashes = 0
            idx = match.start() - 1
            while idx >= 0 and line[idx] == "\\":
                backslashes += 1
                idx -= 1
            if backslashes % 2 == 0:
                cut = match.start()
                break
        newline = "\n" if line.endswith("\n") else ""
        cleaned.append(line[:cut] + newline)
    return "".join(cleaned)


def parse_balanced(text: str, start: int, opener: str, closer: str) -> tuple[str, int]:
    if start >= len(text) or text[start] != opener:
        raise ValueError(f"expected {opener!r} at offset {start}")
    depth = 0
    body_start = start + 1
    idx = start
    while idx < len(text):
        char = text[idx]
        if char == opener:
            depth += 1
        elif char == closer:
            depth -= 1
            if depth == 0:
                return text[body_start:idx], idx + 1
        idx += 1
    raise ValueError(f"unclosed {opener!r} group")


def skip_space(text: str, index: int) -> int:
    while index < len(text) and text[index].isspace():
        index += 1
    return index


def parse_acronym_definitions(path: Path) -> tuple[dict[str, int], list[Issue]]:
    text = strip_comments_preserve_lines(path.read_text(encoding="utf-8"))
    definitions: dict[str, int] = {}
    issues: list[Issue] = []
    token = r"\newacronym"
    index = 0

    while True:
        start = text.find(token, index)
        if start < 0:
            break

        cursor = start + len(token)
        cursor = skip_space(text, cursor)
        if cursor < len(text) and text[cursor] == "[":
            _, cursor = parse_balanced(text, cursor, "[", "]")
            cursor = skip_space(text, cursor)
        if cursor >= len(text) or text[cursor] != "{":
            index = cursor
            continue

        key, cursor = parse_balanced(text, cursor, "{", "}")
        key = key.strip()
        current_line = line_number(text, start)
        if key in definitions:
            issues.append(
                Issue(
                    path,
                    current_line,
                    f"duplicate acronym key {key!r}; first defined at line {definitions[key]}",
                )
            )
        else:
            definitions[key] = current_line
        index = cursor

    return definitions, issues


def find_tex_files(root: Path) -> list[Path]:
    tex_root = root / "tex"
    if not tex_root.exists():
        return []
    return sorted(
        path
        for path in tex_root.rglob("*.tex")
        if path.name != "acronyms.def"
        and "/assets/" not in path.as_posix()
        and "/TikZ/" not in path.as_posix()
    )


def table_blocks(text: str) -> list[tuple[str, int, str]]:
    blocks: list[tuple[str, int, str]] = []
    for env in TABLE_ENVS:
        pattern = re.compile(rf"\\begin\{{{re.escape(env)}\}}(.*?)\\end\{{{re.escape(env)}\}}", re.S)
        for match in pattern.finditer(text):
            blocks.append((env, match.start(), match.group(1)))
    return blocks


def item_label_spans(text: str) -> list[tuple[int, str]]:
    spans: list[tuple[int, str]] = []
    token = r"\item["
    index = 0
    while True:
        start = text.find(token, index)
        if start < 0:
            break
        label_start = start + len(token) - 1
        try:
            label, end = parse_balanced(text, label_start, "[", "]")
        except ValueError:
            index = start + len(token)
            continue
        spans.append((start, label))
        index = end
    return spans


def scan_tex_file(path: Path, root: Path, definitions: dict[str, int]) -> list[Issue]:
    text = strip_comments_preserve_lines(path.read_text(encoding="utf-8"))
    issues: list[Issue] = []

    for match in ACRONYM_MACRO_RE.finditer(text):
        key = match.group(1)
        if key not in definitions:
            issues.append(
                Issue(path, line_number(text, match.start()), f"undefined acronym key {key!r}")
            )

    for env, start, body in table_blocks(text):
        for match in ACRONYM_MACRO_RE.finditer(body):
            issues.append(
                Issue(
                    path,
                    line_number(text, start + match.start()),
                    f"acronym macro inside table environment {env!r}: {match.group(0)}",
                )
            )

    for start, label in item_label_spans(text):
        for match in ACRONYM_MACRO_RE.finditer(label):
            issues.append(
                Issue(
                    path,
                    line_number(text, start + match.start()),
                    f"acronym macro inside item label: {match.group(0)}",
                )
            )

    return issues


def check_root(root: Path) -> list[Issue]:
    acronym_path = root / "tex/acronyms.def"
    if not acronym_path.exists():
        return [Issue(acronym_path, 1, "missing tex/acronyms.def")]

    definitions, issues = parse_acronym_definitions(acronym_path)
    for tex_file in find_tex_files(root):
        issues.extend(scan_tex_file(tex_file, root, definitions))
    return sorted(issues, key=lambda issue: (issue.path.as_posix(), issue.line, issue.message))


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
    issues = check_root(root)
    if issues:
        print("Acronym hygiene check failed:", file=sys.stderr)
        for issue in issues:
            print(f"  {issue.format(root)}", file=sys.stderr)
        return 1
    print("Acronym hygiene check passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
