# Repository Guidelines

## Project Structure & Module Organization

This repository builds the Navy Engineering Duty Officer acquisition study
guide. Default to concise board-prep tutoring; use deeper mastery explanations
when requested.

- `tex/`: LaTeX sources, chapters, templates, TikZ, styles, and bibliography.
- `tex/main.tex`: main build target.
- `tex/acronyms.def`: acronym source of truth.
- `tex/edo.bib`, `tex/current_events.bib`, `tex/was_refs.bib`: bibliographies.
- `scripts/`: build, Docker build, release, scrub, formatting, count, and
  validation helpers.
- `scripts/tests/`: focused shell tests for repo helper scripts.
- `artifacts/out/`: PDF output; `main.pdf` is tracked, while other generated
  output remains ignored.
- `artifacts/build/`, `artifacts/tikz/`: aux files and TikZ cache; keep
  generated contents out of Git except placeholders.
- `docs/reference/` and `docs/archive/`: source material and historical notes.
- `docs/study_memory/`: shared source/correction evidence and ignored local tutor state.
  See its README for the tracked allowlist; personal training records must stay untracked.
- `project_export.json`: durable project memory/status snapshot.

## Build, Test, and Development Commands

Before building, ensure no other LaTeX build is running; Latex Workshop may
build on save.

- `./scripts/docker-build.sh tex/main.tex`: preferred full PDF build.
- `./scripts/docker-build.sh --clean tex/main.tex`: clean retry for stale
  artifacts.
- `./scripts/build.sh tex/main.tex`: local fallback.
- `make check-acronyms`: validate acronym keys and macro placement.
- `make audit-active-citation-sources`: report weak source metadata for
  citekeys active in the latest PDF build control file.
- `make audit-cited-bib-sources`: report cited BibTeX `http(s)` URLs that
  are not exact-match represented in the study-memory source ledger.
- `make check-current-events-sources`: validate current-events BibTeX entries
  against TeX usage and the study-memory source ledger.
- `make check-guide-change-sources`: validate applied guide-change external
  source URLs against the study-memory source ledger.
- `make check-tikz-cache`: validate TikZ externalization paths.
- `make check-tex-structure`: validate standalone wrappers, glossaries, and
  structural guards.
- `make check-study-memory`: validate study-memory Markdown and JSONL state.
- `scripts/tests/test-check-acronyms.sh`: regression test the acronym checker.
- `rg "TODO|undefined citation|Missing character" tex artifacts/build`: focused
  content/build warning scan.

## Coding Style & Naming Conventions

Use ASCII unless an existing file requires otherwise. Use `\autocite{}` inside
sentences before punctuation. Use lowercase `\ac{}` keys in prose; avoid acronym
macros in headings and tables unless the surrounding file already requires it.
Prefer `longtblr` for tables and `description` for term/definition lists. Use
`docs/reference/legacy/` for legacy material; do not recreate `Other/`.
Use `./scripts/latexindent-docker.sh <file>` when formatting LaTeX and Docker
is available. Markdown files must be wrapped at 120 characters and conform to
the rules configured in `.rumdl.toml`.

## Testing Guidelines

Run the Docker build for source changes and report remaining warnings,
especially overfull boxes, missing citations, or shell-escape issues. Run
`make check-acronyms` when touching `tex/acronyms.def` or acronym usage.
Run `make check-tikz-cache` when touching TikZ externalization paths or cache
configuration. Run `make check-tex-structure` after wrapper, standalone
glossary, Summary / Quick Review, or chapter-flow edits. Run
`make check-study-memory` after study-memory, audit-log, source-ledger, weak-area,
or guide-change updates; this target also runs the current-events and applied
guide-change source-ledger checks. Run `make audit-active-citation-sources` after
rebuilding the PDF when auditing stale or source-limited active citation
metadata. Run `make audit-cited-bib-sources` after editing `tex/edo.bib`,
chapter citations, or source-inventory rows to report remaining exact-URL ledger
gaps, run `make check-current-events-sources` directly after editing
`tex/current_events.bib` or current-events source rows, and run
`make check-guide-change-sources` directly after source-basis or source-inventory
edits. Always run `rumdl check` on any modified Markdown files after making
edits, or use `rumdl fmt <file>` to automatically format them.

## Commit & Pull Request Guidelines

Recent history uses concise imperative subjects such as `Add ACAT III cost
thresholds and MDA assignment detail` and `Correct EDO flag roster grades`.
Update `CHANGELOG.md` for notable documentation, build, release, or public
workflow changes.

Do not run `scripts/release.sh` unless explicitly asked; it stages all changes,
commits, tags, pushes, and publishes the PDF with `gh`.

Pull requests should summarize affected chapters/scripts, sources checked,
validation run, residual warnings, and generated artifacts excluded.

## Security, Sources & Agent Instructions

Preserve OPSEC, CUI, procurement-integrity, and source boundaries. Verify
date-sensitive doctrine against current primary sources and stamp doctrine
deliverables `Current as of YYYY-MM-DD`. Source hierarchy is statute,
regulation, policy, local guidance, then courseware or secondary explanation.
Read `project_export.json` only for long-running status, project memory, or
instruction synchronization.

## Study-guide review and tutoring mode

Default this project to source-grounded study support. Treat study-guide
auditing, answer-key correction, and source reconciliation as high-reasoning
work.

Use this operating split:

- Use high reasoning for normal study-guide review, answer correction,
  explanation, and weakness diagnosis.
- Use xhigh reasoning or Plan mode before changing answer keys, resolving
  conflicting sources, updating outdated material, or auditing high-stakes
  topics.
- Use medium reasoning only for routine flashcards, simple recall drills,
  formatting, or bookkeeping.

For every correction:

1. Quote or paraphrase the original study-guide claim.
2. Identify the authoritative source used to verify it.
3. Mark the claim as `Correct`, `Incorrect`, `Outdated`, `Ambiguous`, or
   `Needs source`.
4. Provide the corrected answer.
5. Explain the correction briefly.
6. Record confidence as `High`, `Medium`, or `Low`.
7. Never change an answer key without citing the source basis.

Maintain shared source inventory, correction audit, and guide-change provenance in
`docs/study_memory/sources.md`, `study_guide_audit.md`, and `guide_changes.jsonl`.
Keep these impersonal: no learner identities, answers, scores, questions asked, or weakness history.

All operational tutor state is ignored by Git: `memory_index.md`, `sessions.jsonl`, `question_bank.jsonl`,
`learning_log.jsonl`, `weak_areas.md`, `weak_areas.jsonl`, and future generated artifacts under `docs/study_memory/`.
Imported `docs/EDO_Study_Guide_Chat_Session_Package_*/` directories are also local only.
Initialize missing local state lazily using `docs/study_memory/schemas.md`; main owns persistence and read-only
workers return proposed deltas. Verify ignored and untracked status before writing; never force-add learner records.
Do not copy personal training state into `project_export.json`, shared audits, changelogs, or pull requests.

Start with the relevant guide section, then the mapped coursebook objective/pages using the coverage manifest and
edition inventory in `docs/reference/`. Inspect actual source text; use official online authority for current or
conflicting claims. Cite guide location, coursebook module/page/edition, and official provision/date as applicable.
Ordinary tutoring does not authorize guide edits. Record candidates locally until maintenance is authorized.

When generating questions:

- Prefer active recall and scenario-based questions over passive recognition.
- Keep exactly one active board-style drill question at a time unless the user
  asks for a batch.
- Prepare the answer and rubric privately; reveal the correct answer and explanation only after
  the learner responds, unless immediate answers are requested.
- Tag each question by topic, source section, difficulty, and tested skill.

When grading answers:

- Identify whether the miss was factual recall, concept confusion,
  source-version issue, wording ambiguity, or careless error.
- Update the ignored local weak-area tracker; do not penalize the learner for an ambiguous question or stale source.
- Recommend the next drill based on the miss pattern.
