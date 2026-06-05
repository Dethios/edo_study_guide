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
from collections import Counter
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

enum_specs = {
    ("weak_areas.jsonl", "miss_type"): {
        "application",
        "careless_error",
        "concept_confusion",
        "factual_recall",
        "source_version",
        "unknown",
        "wording_ambiguity",
    },
    ("weak_areas.jsonl", "severity"): {"low", "medium", "high"},
    ("weak_areas.jsonl", "status"): {"active", "improving", "resolved"},
    ("guide_changes.jsonl", "status"): {"proposed", "applied", "rejected", "blocked"},
    ("guide_changes.jsonl", "verdict"): {
        "Applied",
        "Correct",
        "Incorrect",
        "Outdated",
        "Ambiguous",
        "Needs source",
    },
    ("guide_changes.jsonl", "confidence"): {"High", "Medium", "Low"},
    ("question_bank.jsonl", "difficulty"): {"basic", "intermediate", "board_ready"},
    ("question_bank.jsonl", "tested_skill"): {"recall", "application", "comparison", "scenario"},
    ("learning_log.jsonl", "result"): {"correct", "partial", "incorrect", "skipped"},
    ("learning_log.jsonl", "miss_type"): {
        "application",
        "careless_error",
        "concept_confusion",
        "factual_recall",
        "none",
        "source_version",
        "wording_ambiguity",
    },
}

source_fields = {"title", "authority_level", "url_or_path", "version_or_date", "date_checked"}
future_quality_cutoff = "2026-06-05"
absolute_local_pattern = re.compile(r"(?:(?<=^)|(?<=[;,\s]))(?:/[A-Za-z0-9_.-]+/|[A-Za-z]:[\\/]|\\\\)")
legacy_question_sections = {"May 30 lookup deck", "May 30 study_state.md drill queue"}


def load_source_inventory():
    path = memory_dir / "sources.md"
    if not path.exists():
        return {}, {}

    rows = []
    for line in path.read_text(encoding="utf-8").splitlines():
        if not line.startswith("|") or "---" in line or line.startswith("| Title"):
            continue
        cells = [cell.strip() for cell in line.strip().strip("|").split("|")]
        if len(cells) < 5:
            continue
        title, authority_level, url_or_path, version_or_date, date_checked = cells[:5]
        rows.append(
            {
                "title": title,
                "authority_level": authority_level,
                "url_or_path": url_or_path.strip("`"),
                "version_or_date": version_or_date,
                "date_checked": date_checked,
            }
        )

    by_url = {row["url_or_path"]: row for row in rows}
    title_counts = Counter(row["title"] for row in rows)
    by_unique_title = {row["title"]: row for row in rows if title_counts[row["title"]] == 1}
    return by_url, by_unique_title


source_inventory_by_url, source_inventory_by_unique_title = load_source_inventory()


def record_date(name, record):
    if name == "guide_changes.jsonl":
        return str(record.get("date_identified", ""))
    if name in {"sessions.jsonl", "weak_areas.jsonl", "learning_log.jsonl"}:
        return str(record.get("date", ""))
    if name == "question_bank.jsonl":
        match = re.match(r"q-(\d{4})(\d{2})(\d{2})-", str(record.get("id", "")))
        if match:
            return "-".join(match.groups())
    return ""


def is_future_quality_record(name, record):
    date = record_date(name, record)
    return bool(date) and date >= future_quality_cutoff


def check_enum(path, line_no, name, record):
    for (spec_name, field), allowed_values in enum_specs.items():
        if name != spec_name or field not in record:
            continue
        value = record.get(field)
        if value not in allowed_values:
            allowed = ", ".join(sorted(allowed_values))
            errors.append(
                f"{path.relative_to(root)}:{line_no}: invalid {field} {value!r}; allowed values: {allowed}"
            )


def check_source_basis(path, line_no, record):
    if "source_basis" not in record:
        return
    source_basis = record.get("source_basis")
    if not isinstance(source_basis, list):
        errors.append(f"{path.relative_to(root)}:{line_no}: source_basis must be an array")
        return
    for index, source in enumerate(source_basis, 1):
        if not isinstance(source, dict):
            errors.append(f"{path.relative_to(root)}:{line_no}: source_basis[{index}] must be an object")
            continue
        missing = sorted(source_fields - set(source))
        if missing:
            errors.append(
                f"{path.relative_to(root)}:{line_no}: source_basis[{index}] missing fields: {', '.join(missing)}"
            )


def check_portable_provenance(path, line_no, name, record):
    if not is_future_quality_record(name, record):
        return
    local_paths = []
    if isinstance(record.get("source_package"), str):
        local_paths.append(("source_package", record["source_package"]))
    for index, source in enumerate(record.get("source_basis") or [], 1):
        if isinstance(source, dict):
            local_paths.append((f"source_basis[{index}].url_or_path", str(source.get("url_or_path", ""))))
    for field, value in local_paths:
        if "://" in value:
            continue
        if absolute_local_pattern.search(value):
            errors.append(
                f"{path.relative_to(root)}:{line_no}: {field} should be repo-relative or a URL, not an absolute local path: {value}"
            )


def check_question_source_section(path, line_no, record):
    section = str(record.get("source_section", "")).strip()
    if not section:
        errors.append(f"{path.relative_to(root)}:{line_no}: source_section must not be empty")
        return
    if section in legacy_question_sections:
        if is_future_quality_record("question_bank.jsonl", record):
            errors.append(
                f"{path.relative_to(root)}:{line_no}: future question source_section must use a stable repo path, session ID, or source reference"
            )
        return
    parts = [part.strip() for part in section.split(";") if part.strip()]
    stable = all(
        part.startswith(("tex/", "docs/"))
        or re.match(r"^(?:session|source|guide_change|question):[A-Za-z0-9_.:/-]+$", part)
        for part in parts
    )
    if not stable:
        errors.append(
            f"{path.relative_to(root)}:{line_no}: source_section should use repo paths or stable references, got {section!r}"
        )


def check_question_source_inventory(path, line_no, record):
    source_basis = record.get("source_basis")
    if not isinstance(source_basis, list):
        return
    for index, source in enumerate(source_basis, 1):
        if not isinstance(source, dict):
            continue
        title = str(source.get("title", ""))
        url_or_path = str(source.get("url_or_path", ""))
        canonical = source_inventory_by_url.get(url_or_path) or source_inventory_by_unique_title.get(title)
        if not canonical:
            errors.append(
                f"{path.relative_to(root)}:{line_no}: source_basis[{index}] is not present in sources.md: {title}"
            )
            continue
        for field, expected in canonical.items():
            actual = str(source.get(field, ""))
            if actual != expected:
                errors.append(
                    f"{path.relative_to(root)}:{line_no}: source_basis[{index}].{field} should match sources.md "
                    f"({expected!r}), got {actual!r}"
                )


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
            check_enum(path, line_no, name, record)
            check_source_basis(path, line_no, record)
            check_portable_provenance(path, line_no, name, record)
            if name == "question_bank.jsonl":
                check_question_source_section(path, line_no, record)
                check_question_source_inventory(path, line_no, record)
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
