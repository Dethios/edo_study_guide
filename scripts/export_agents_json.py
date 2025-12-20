#!/usr/bin/env python3
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Iterable


SCHEMA_VERSION = "edo-agents-export@1"


@dataclass
class ListItem:
    text: str
    checked: bool | None = None
    children: list["ListItem"] | None = None

    def to_dict(self) -> dict[str, Any]:
        return {
            "text": self.text,
            "checked": self.checked,
            "children": [child.to_dict() for child in (self.children or [])],
        }


def _sha256_text(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def _utc_now_iso() -> str:
    return datetime.now(tz=timezone.utc).replace(microsecond=0).isoformat()


HEADING_RE = re.compile(r"^(?P<hashes>#{1,6})\s+(?P<text>.+?)\s*$")
CHECKBOX_ITEM_RE = re.compile(r"^(?P<indent>\s*)-\s+\[(?P<state>[ xX])\]\s+(?P<text>.+?)\s*$")
BULLET_ITEM_RE = re.compile(r"^(?P<indent>\s*)-\s+(?P<text>.+?)\s*$")


def _parse_markdown_sections(lines: list[str]) -> tuple[str | None, list[dict[str, Any]]]:
    title: str | None = None
    sections: list[dict[str, Any]] = []
    current: dict[str, Any] | None = None

    for raw_line in lines:
        line = raw_line.rstrip("\n")
        match = HEADING_RE.match(line)
        if match:
            level = len(match.group("hashes"))
            heading_text = match.group("text")
            if level == 1 and title is None:
                title = heading_text
            if level == 2:
                if current is not None:
                    sections.append(current)
                current = {"heading": heading_text, "level": level, "lines": []}
            continue

        if current is not None:
            current["lines"].append(line)

    if current is not None:
        sections.append(current)

    return title, sections


def _parse_markdown_list(lines: list[str]) -> list[ListItem]:
    roots: list[ListItem] = []
    contexts: list[dict[str, Any]] = [{"indent": 0, "items": roots, "last_item": None}]

    indents: list[int] = []
    for line in lines:
        checkbox = CHECKBOX_ITEM_RE.match(line)
        if checkbox:
            indents.append(len(checkbox.group("indent")))
            continue
        bullet = BULLET_ITEM_RE.match(line)
        if bullet:
            indents.append(len(bullet.group("indent")))

    base_indent = min(indents) if indents else 0

    for line in lines:
        if not line.strip():
            continue

        checkbox = CHECKBOX_ITEM_RE.match(line)
        if checkbox:
            indent = max(0, len(checkbox.group("indent")) - base_indent)
            checked = checkbox.group("state").lower() == "x"
            text = checkbox.group("text").strip()
            item = ListItem(text=text, checked=checked, children=[])
        else:
            bullet = BULLET_ITEM_RE.match(line)
            if not bullet:
                continue
            indent = max(0, len(bullet.group("indent")) - base_indent)
            text = bullet.group("text").strip()
            item = ListItem(text=text, checked=None, children=[])

        if indent > contexts[-1]["indent"]:
            parent = contexts[-1]["last_item"]
            if parent is None:
                indent = contexts[-1]["indent"]
            else:
                if parent.children is None:
                    parent.children = []
                contexts.append({"indent": indent, "items": parent.children, "last_item": None})
        else:
            while contexts and indent < contexts[-1]["indent"]:
                contexts.pop()
            if indent > contexts[-1]["indent"]:
                parent = contexts[-1]["last_item"]
                if parent is not None:
                    if parent.children is None:
                        parent.children = []
                    contexts.append({"indent": indent, "items": parent.children, "last_item": None})

        contexts[-1]["items"].append(item)
        contexts[-1]["last_item"] = item

    return roots


def _flatten_text(items: Iterable[ListItem]) -> list[str]:
    flattened: list[str] = []
    for item in items:
        flattened.append(item.text)
        if item.children:
            flattened.extend(_flatten_text(item.children))
    return flattened


KEY_VALUE_RE = re.compile(r"^(?P<key>[^:]+):\s*(?P<value>.*)$")


def _key_values_from_items(items: Iterable[ListItem]) -> dict[str, str]:
    extracted: dict[str, str] = {}
    for item in items:
        match = KEY_VALUE_RE.match(item.text)
        if not match:
            continue
        key = match.group("key").strip()
        value = match.group("value").strip()
        if key:
            extracted[key] = value
    return extracted


def _task_stats(items: Iterable[ListItem]) -> dict[str, int]:
    total = 0
    checked = 0
    for item in items:
        if item.checked is None:
            continue
        total += 1
        if item.checked:
            checked += 1
    return {"total": total, "checked": checked, "open": total - checked}


SESSION_UPDATES_RE = re.compile(r"^Session updates\s+\((?P<date>\d{4}-\d{2}-\d{2})\)\s*$")


def parse_agents_markdown(markdown_text: str, *, source_path: str) -> dict[str, Any]:
    lines = markdown_text.splitlines()
    title, sections = _parse_markdown_sections(lines)

    exported_sections: list[dict[str, Any]] = []
    task_lists: dict[str, Any] = {}
    session_updates: list[dict[str, Any]] = []
    open_tasks: list[dict[str, str]] = []
    derived: dict[str, Any] = {}

    for section in sections:
        items = _parse_markdown_list(section["lines"])
        has_any_checkbox = any(item.checked is not None for item in items)
        all_checkboxes = bool(items) and all(item.checked is not None for item in items)

        exported = {
            "heading": section["heading"],
            "level": section["level"],
            "kind": "checklist" if all_checkboxes else "bullets" if items else "text",
            "items": [item.to_dict() for item in items],
        }
        exported_sections.append(exported)

        if section["heading"] == "Read first":
            derived["read_first"] = [item.text for item in items]
        elif section["heading"] == "Mission and doctrine (high-level)":
            derived["mission_and_doctrine"] = {
                "items": [item.text for item in items],
                "fields": _key_values_from_items(items),
            }
        elif section["heading"] == "Workflow for every task":
            workflow_items = [item.to_dict() for item in items]
            workflow_start: str | None = None
            workflow_finish: list[str] = []
            workflow_post_finish: list[str] = []
            for item in items:
                match = KEY_VALUE_RE.match(item.text)
                if match and match.group("key").strip().lower() == "start":
                    workflow_start = match.group("value").strip()
                    continue
                if match and match.group("key").strip().lower() == "finish":
                    workflow_finish = [child.text for child in (item.children or [])]
                    continue
                workflow_post_finish.append(item.text)

            derived["workflow"] = {
                "items": workflow_items,
                "start": workflow_start,
                "finish": workflow_finish,
                "post_finish_steps": workflow_post_finish,
            }

        session_match = SESSION_UPDATES_RE.match(section["heading"])
        if session_match:
            session_updates.append(
                {
                    "date": session_match.group("date"),
                    "items": _flatten_text(items),
                }
            )

        if all_checkboxes:
            stats = _task_stats(items)
            task_lists[section["heading"]] = {"items": [item.to_dict() for item in items], "stats": stats}
            for task in items:
                if not task.checked:
                    open_tasks.append({"list": section["heading"], "text": task.text})
        elif has_any_checkbox:
            task_lists[section["heading"]] = {
                "items": [item.to_dict() for item in items],
                "stats": _task_stats(items),
            }

    overall_total = 0
    overall_checked = 0
    for task_list in task_lists.values():
        stats = task_list.get("stats") or {}
        overall_total += int(stats.get("total", 0))
        overall_checked += int(stats.get("checked", 0))

    return {
        "schema_version": SCHEMA_VERSION,
        "generated_at": _utc_now_iso(),
        "source": {
            "path": source_path,
            "sha256": _sha256_text(markdown_text),
            "line_count": len(lines),
        },
        "title": title,
        "derived": derived,
        "sections": exported_sections,
        "task_lists": task_lists,
        "session_updates": session_updates,
        "open_tasks": open_tasks,
        "task_stats": {
            "overall": {"total": overall_total, "checked": overall_checked, "open": overall_total - overall_checked}
        },
    }


def _find_agents_md_files(root: Path) -> list[Path]:
    return sorted(root.rglob("AGENTS.md"))


def _default_output_path(agents_md_path: Path) -> Path:
    return agents_md_path.with_suffix(".json")


def main() -> int:
    parser = argparse.ArgumentParser(description="Export AGENTS.md files into structured JSON.")
    parser.add_argument(
        "--root",
        default=".",
        help="Repository root to scan for AGENTS.md (default: .)",
    )
    parser.add_argument(
        "--output-dir",
        default=None,
        help="If set, write JSON files under this directory mirroring paths from --root.",
    )
    parser.add_argument(
        "--stdout",
        action="store_true",
        help="Print JSON for a single file to stdout (requires --file).",
    )
    parser.add_argument(
        "--file",
        default=None,
        help="Export only this AGENTS.md (path relative to --root or absolute).",
    )

    args = parser.parse_args()
    root = Path(args.root).resolve()

    if args.file:
        agents_files = [Path(args.file).resolve() if os.path.isabs(args.file) else (root / args.file).resolve()]
    else:
        agents_files = _find_agents_md_files(root)

    if not agents_files:
        print(f"No AGENTS.md files found under: {root}")
        return 1

    if args.stdout and len(agents_files) != 1:
        print("--stdout requires a single --file export.")
        return 1

    output_dir = Path(args.output_dir).resolve() if args.output_dir else None

    for agents_md in agents_files:
        markdown_text = agents_md.read_text(encoding="utf-8")
        relative_source = str(agents_md.relative_to(root)) if agents_md.is_relative_to(root) else str(agents_md)
        payload = parse_agents_markdown(markdown_text, source_path=relative_source)

        if args.stdout:
            print(json.dumps(payload, indent=2, sort_keys=False))
            continue

        if output_dir:
            rel = agents_md.relative_to(root)
            output_path = (output_dir / rel).with_suffix(".json")
        else:
            output_path = _default_output_path(agents_md)

        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(json.dumps(payload, indent=2, sort_keys=False) + "\n", encoding="utf-8")
        print(f"Wrote {output_path}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
