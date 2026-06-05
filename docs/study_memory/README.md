# EDO Study Memory

This directory is the persistent, repo-tracked memory for EDO study sessions,
weak areas, source-backed corrections, generated questions, and study-guide
update candidates.

The memory system is intentionally hybrid:

- Markdown files hold readable current state and review notes.
- JSONL files hold append-only records for validation, search, and later
  automation.
- Any doctrine-sensitive guide change or answer-key correction requires a
  strict source basis before it can be marked applied.

## Start Of Session

Before tutoring, auditing, or correcting the guide:

1. Read `memory_index.md` for current state, next actions, and open items.
2. Read the active sections of `weak_areas.md`.
3. Read the latest relevant lines in `sessions.jsonl`,
   `learning_log.jsonl`, and `guide_changes.jsonl`.
4. For study-guide corrections, verify the source basis before changing guide
   content.

## End Of Session

After every substantive study session:

1. Append one `session` record to `sessions.jsonl`.
2. Update `memory_index.md` with the latest session, active priorities, and
   next review plan.
3. Update `weak_areas.md` and append weak-area observations to
   `weak_areas.jsonl`.
4. Append graded-answer outcomes to `learning_log.jsonl` when answers were
   evaluated.
5. Append generated board-style questions to `question_bank.jsonl` only when
   they include answer, explanation, tags, difficulty, and source basis.

## Correction Rules

For any answer-key correction, doctrine update, or study-guide change
candidate:

1. Quote or paraphrase the original claim.
2. Identify the authoritative source used to verify it.
3. Mark the claim as `Correct`, `Incorrect`, `Outdated`, `Ambiguous`, or
   `Needs source`.
4. Provide the corrected answer.
5. Explain the correction briefly.
6. Record confidence as `High`, `Medium`, or `Low`.
7. Do not mark a guide change as `applied` unless the corresponding
   study-guide file was actually edited and validated.

Use this source hierarchy: statute, regulation, policy, local guidance,
courseware, then secondary explanation.

## Validation

Run this after memory edits:

```sh
make check-study-memory
```

If the Makefile target is unavailable in a partial checkout, run:

```sh
sh scripts/check-study-memory.sh
```

For LaTeX source edits, continue to run the normal guide validation such as
`make check-acronyms`, `make check-current-events-sources`,
`make check-guide-change-sources`, `git diff --check`, and the Docker PDF build.

`make check-study-memory` also enforces the JSONL schemas, enum values,
`source_basis` object shape, portable future provenance paths, and stable
question-bank `source_section` references.
