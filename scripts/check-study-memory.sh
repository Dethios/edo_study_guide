#!/bin/sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
MEMORY_DIR="$ROOT_DIR/docs/study_memory"

if command -v uv >/dev/null 2>&1; then
  PYTHON_RUNNER="uv run python"
elif command -v python3 >/dev/null 2>&1; then
  PYTHON_RUNNER="python3"
else
  echo "error: need uv or python3 to validate study memory" >&2
  exit 1
fi

$PYTHON_RUNNER - "$ROOT_DIR" <<'PY'
import json
import re
import sys
from pathlib import Path

root = Path(sys.argv[1])
memory_dir = root / "docs" / "study_memory"

jsonl_specs = {
    "sessions.jsonl": {
        "type": "session",
        "required": {
            "type",
            "session_id",
            "date",
            "mode",
            "objectives",
            "topics",
            "source_basis",
            "questions_covered",
            "misses",
            "weak_areas_added",
            "guide_updates_identified",
            "next_actions",
            "source_package",
        },
    },
    "weak_areas.jsonl": {
        "type": "weak_area",
        "required": {
            "type",
            "id",
            "date",
            "topic",
            "subtopic",
            "evidence",
            "miss_type",
            "severity",
            "next_review_date",
            "status",
            "source_session_id",
        },
    },
    "guide_changes.jsonl": {
        "type": "guide_change",
        "required": {
            "type",
            "id",
            "date_identified",
            "study_guide_claim",
            "location",
            "status",
            "verdict",
            "corrected_answer",
            "source_basis",
            "confidence",
            "notes",
        },
    },
    "question_bank.jsonl": {
        "type": "question",
        "required": {
            "type",
            "id",
            "topic",
            "source_section",
            "difficulty",
            "tested_skill",
            "question",
            "answer",
            "explanation",
            "source_basis",
            "created_from_session_id",
        },
    },
    "learning_log.jsonl": {
        "type": "learning_event",
        "required": {
            "type",
            "date",
            "session_id",
            "question_id",
            "user_answer_summary",
            "result",
            "miss_type",
            "weak_area_id",
            "next_review_date",
        },
    },
}

expected_files = {
    "README.md",
    "memory_index.md",
    "sessions.jsonl",
    "weak_areas.md",
    "weak_areas.jsonl",
    "study_guide_audit.md",
    "guide_changes.jsonl",
    "sources.md",
    "question_bank.jsonl",
    "learning_log.jsonl",
    "schemas.md",
}

errors = []

for name in sorted(expected_files):
    path = memory_dir / name
    if not path.exists():
        errors.append(f"missing required file: docs/study_memory/{name}")

for name, spec in jsonl_specs.items():
    path = memory_dir / name
    if not path.exists():
        continue
    with path.open("r", encoding="utf-8") as handle:
        for line_no, line in enumerate(handle, 1):
            stripped = line.strip()
            if not stripped:
                continue
            try:
                record = json.loads(stripped)
            except json.JSONDecodeError as exc:
                errors.append(f"{path.relative_to(root)}:{line_no}: invalid JSON: {exc}")
                continue
            missing = sorted(spec["required"] - set(record))
            if missing:
                errors.append(
                    f"{path.relative_to(root)}:{line_no}: missing required fields: {', '.join(missing)}"
                )
            if record.get("type") != spec["type"]:
                errors.append(
                    f"{path.relative_to(root)}:{line_no}: expected type {spec['type']!r}, got {record.get('type')!r}"
                )
            if name == "guide_changes.jsonl" and record.get("status") == "applied":
                if not record.get("source_basis"):
                    errors.append(
                        f"{path.relative_to(root)}:{line_no}: applied guide changes require source_basis"
                    )
                if not record.get("confidence"):
                    errors.append(
                        f"{path.relative_to(root)}:{line_no}: applied guide changes require confidence"
                    )
                if not record.get("location"):
                    errors.append(
                        f"{path.relative_to(root)}:{line_no}: applied guide changes require location"
                    )

link_pattern = re.compile(r"(?<!!)\[[^\]]+\]\(([^)]+)\)")
for markdown_name in ("README.md", "memory_index.md", "weak_areas.md", "study_guide_audit.md", "sources.md", "schemas.md"):
    path = memory_dir / markdown_name
    if not path.exists():
        continue
    text = path.read_text(encoding="utf-8")
    for match in link_pattern.finditer(text):
        target = match.group(1).strip()
        if (
            "://" in target
            or target.startswith("#")
            or target.startswith("mailto:")
            or target.startswith("/")
        ):
            continue
        target_path = (path.parent / target.split("#", 1)[0]).resolve()
        try:
            target_path.relative_to(root)
        except ValueError:
            errors.append(f"{path.relative_to(root)}: link leaves repository: {target}")
            continue
        if not target_path.exists():
            errors.append(f"{path.relative_to(root)}: broken local link: {target}")

index = memory_dir / "memory_index.md"
if index.exists():
    index_text = index.read_text(encoding="utf-8")
    for required in ("sessions.jsonl", "weak_areas.md", "guide_changes.jsonl", "sources.md"):
        if required not in index_text:
            errors.append(f"{index.relative_to(root)}: missing reference to {required}")

if errors:
    print("Study memory validation failed:", file=sys.stderr)
    for error in errors:
        print(f"- {error}", file=sys.stderr)
    sys.exit(1)

print("Study memory validation passed.")
PY
