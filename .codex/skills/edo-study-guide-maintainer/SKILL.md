---
name: edo-study-guide-maintainer
description: Use for authorized corrections or additions to canonical EDO guide sections after the source basis and target are established.
internal: true
---

# EDO Study Guide Maintainer

Edit only within the user's authorized maintenance scope. A tutoring discovery alone is a candidate, not permission
to edit. Use the actual repository root, read `AGENTS.md`, and search existing coverage before changing a section.

## Source and change contract

- Read the owning guide section and mapped coursebook module/objective using
  `docs/reference/coursebook-coverage-manifest.yaml` and `2026-10-coursebook-inventory.json` in that directory.
  Inspect the actual relevant PDF pages, including diagrams/tables when necessary.
- For current or conflicting doctrine, use `../edo-doctrine-verifier/SKILL.md`. Record the original claim,
  authoritative source with exact provision/version/date, verdict, corrected answer, rationale, and confidence.
  Unresolved evidence blocks an answer-key change; report the gap and candidate text instead.
- Update the canonical chapter/appendix rather than adding parallel study notes. Preserve valid course-era context
  where it explains a transition; label it clearly. Do not infer module-wide coverage from one corrected objective.
- Use existing acronym keys, ASCII unless needed, and `\autocite{}` inside sentences before punctuation.
  Add/update bibliography and exact source-ledger rows when the evidence changes. Advance check dates only after
  actual verification. Update the coverage manifest when objective coverage changes.
- Shared `sources.md`, `study_guide_audit.md`, and `guide_changes.jsonl` under `docs/study_memory/` contain impersonal
  guide provenance only. Learner answers, scores, question history, and weakness notes belong in ignored local state.
  Record applied status only after the corresponding source edit and required validation succeed; otherwise leave
  the candidate proposed/blocked with the reason. Do not force-add operational records.

## Verification and return

Run required repository checks for touched surfaces, including `make check-study-memory`, appropriate source-ledger
checks, acronym/structure checks when relevant, and the Docker PDF build for LaTeX source changes (local fallback if
Docker is unavailable). Run `rumdl check` on modified Markdown and `git diff --check`.
Report changed paths, source provisions checked, commands/results, remaining warnings, and any skipped/blocked checks.
Stop when the bounded patch and checks finish or after two failed recovery approaches. Do not release, commit, push,
or expand the edit scope unless authorized.
