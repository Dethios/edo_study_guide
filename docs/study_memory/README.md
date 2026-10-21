# Study Evidence and Local Tutor State

This directory separates shared guide evidence from local operational tutoring records.
Git tracks only this README, `schemas.md`, `sources.md`, `study_guide_audit.md`, and `guide_changes.jsonl`.
All other contents, including new subdirectories, are ignored by default. Imported
`docs/EDO_Study_Guide_Chat_Session_Package_*/` directories are also ignored.

## Shared guide evidence

- `sources.md`: source inventory with authority, exact URL/path, edition, and actual check date.
- `study_guide_audit.md`: source-backed guide findings and correction rationale.
- `guide_changes.jsonl`: guide-change provenance, including applied changes and their validation.
- `schemas.md`: record formats; examples contain no learner data.

Local question evidence can include newly verified official sources without changing the shared inventory.
Promote source evidence to the shared inventory only as part of authorized guide maintenance.

Keep learner identities, responses, scores, question history, weak areas, and session summaries out of shared evidence,
`project_export.json`, changelogs, commits, and pull requests. Record only the impersonal claim, source, location,
correction, confidence, and checks when a tutoring finding becomes an authorized guide edit.
An inventory/check date documents a past check; it does not establish current doctrine.

## Local operational records

Create these lazily when a study session needs them; a fresh clone has no prior learner history:

- `memory_index.md`: current learner/session pointer, priorities, and next actions.
- `sessions.jsonl`: session summaries and coverage.
- `question_bank.jsonl`: questions, hidden model answers, explanations, tags, and evidence.
- `learning_log.jsonl`: answer summaries and grading outcomes.
- `weak_areas.md` and `weak_areas.jsonl`: current review plan and dated observations.
- Other generated decks, exports, extracted text, and scratch artifacts stay under an ignored subdirectory here.

At session start, read the index and only relevant recent records. Confirm the learner before reusing another
person's history; use a separate ignored subdirectory for a different learner. Do not invent missing prior results.
Before writing, check `git check-ignore --no-index <path>` and `git ls-files -- <path>`: the path must be ignored and
untracked. Never force-add operational files. The main tutor writes records; read-only workers return proposed deltas.
If writes are unavailable, continue tutoring with in-chat state and disclose that persistence was unavailable.

Append the question with a stable ID before grading. After each answer, append its outcome and update the weak-area
plan. At session end, append a session summary and update the index. Keep answer summaries minimal; do not copy full
transcripts or sensitive information. Resume an unanswered question rather than recording a new attempt. JSONL history
is append-only; append later observations to change status, and treat the latest observation for an ID as current.

Removing a path from Git's index preserves the local file but does not remove earlier commits. A clean clone will not
recover private state, and Git ignore rules do not provide backup or access control. Do not rewrite Git history as
part of ordinary tutoring maintenance.

## Validation

Run `make check-study-memory` after state or evidence updates. It validates shared evidence, validates local records
when present, and rejects tracked operational files. Absent local files are valid on a fresh clone. Existing local
records retain their schemas in `schemas.md`; creating empty JSONL files and an index referencing `sessions.jsonl` and
`weak_areas.md` is sufficient to start.

For Windows without a shell, run `python scripts/check-study-memory.py`. Without Make, run
`sh scripts/check-study-memory.sh`, then run
`scripts/check-current-events-sources.py` and `scripts/check-guide-change-sources.py` with an existing Python
interpreter. LaTeX edits still require the repository's normal acronym, structure, citation, and PDF build checks.
