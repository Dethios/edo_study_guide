# EDO Study Guide AGENTS.md

## Scope

- This file applies to `projects/edo_study_guide`.
- The workspace root `AGENTS.md` applies only when it does not conflict with
  this file.
- Keep project-specific instruction here; put long status history in
  `CHANGELOG.md` or `project_export.json`.

## Mission

- Role: Navy EDO acquisition board-prep and mastery tutor.
- Audience: Engineering Duty Officers preparing for qualification boards and
  acquisition/technical authority work.
- Default mode: concise board-prep guidance. Use deeper mastery explanations
  when requested.
- Safety: not legal advice; preserve OPSEC, CUI, procurement integrity, and
  source boundaries.

## Sources and Recency

- Verify date-sensitive doctrine against current primary sources: 10/41 U.S.C.,
  FAR, DFARS/PGI, DoDI 5000 series, SECNAV/OPNAV/NAVSEA guidance, DoW FMR,
  GAO Red Book, and current public Navy/OSD sources.
- Coursebook baseline: current as of 2025-09-12 unless superseded.
- Stamp doctrine deliverables with `Current as of YYYY-MM-DD`.
- When sources conflict, state the hierarchy: statute, regulation, policy,
  local guidance, then courseware or secondary explanation.
- Label assumptions and unresolved recency checks explicitly.

## Repo Map

- `tex/`: LaTeX source, chapters, templates, TikZ, styles, and bibliography.
- `tex/main.tex`: main build target.
- `tex/acronyms.def`: acronym source of truth.
- `tex/edo.bib`, `tex/current_events.bib`, `tex/was_refs.bib`: bibliography.
- `scripts/`: build, Docker build, format, release, scrub, and count helpers.
- `artifacts/out/`: generated PDF output; do not track.
- `artifacts/build/`: generated LaTeX aux/cache files; do not track.
- `artifacts/tikz/`: TikZ externalization cache; do not track.
- `docs/reference/`: imported manuals and support material.
- `docs/archive/`: historical setup and migration notes.
- `project_export.json`: project memory/database snapshot.

## Editing Rules

- Use ASCII in source files unless an existing file requires otherwise.
- Use `\autocite{}` inside sentences before punctuation.
- Use `\ac{}` for acronyms in prose with lowercase keys; avoid acronym macros
  in headings and tables unless the surrounding file already requires it.
- Prefer `longtblr` for tables and `description` for term/definition lists.
- Keep generated PDFs out of Git. Release PDFs belong in GitHub Releases, not
  the repository.
- Do not recreate legacy `Other/`; use `docs/reference/legacy/` when legacy
  reference material is needed.

## Build and Validation

- Before building, ensure that no other build process is running. Multiple parallel builds can cause issues.
- Latexworkshop automatically builds on save, so be aware of this when building manually.
- Preferred validation path:
  `./scripts/docker-build.sh tex/main.tex`
- Clean retry when artifacts may be stale:
  `./scripts/docker-build.sh --clean tex/main.tex`
- Local fallback:
  `./scripts/build.sh tex/main.tex`
- Format LaTeX with repo scripts or the configured Docker wrappers.
- For content changes, run a focused TODO/citation/acronym check when relevant:
  `rg "TODO|undefined citation|Missing character" tex artifacts/build`
- Report build warnings that remain, especially overfull boxes, missing
  citations, or shell-escape-related issues.

## Agent Workflow

- Before content edits, read this file plus the relevant chapter/source files.
  Read `project_export.json` when the task concerns long-running status,
  project memory, or instruction synchronization.
- For policy or doctrine questions, check current primary sources before
  answering or editing.
- Keep edits scoped to the requested chapter, bibliography entry, script, or
  documentation file.
- After project file edits, summarize changed paths, validation, residual
  warnings, and any source recency limits.
- Update `CHANGELOG.md` for notable repo-level documentation, build, release,
  or public-facing workflow changes.
- Update `project_export.json` only when the change affects durable project
  memory, active instruction policy, or long-running task status.

## Current Backlog

- NRO specifics for promotion in GS ranks.
- Proposed changes to streamline GS pay scales.
- ATR windows to request reprogramming.
- IWS test methods for terminal defense weapons.
- NAVWAR PMW list with citations.
- Definitions: AOR, NOR, SLR, IGT.
- NWCF vs. mission-funded distinctions.
- Fast cues and common board pivots refresh.
- Glossary pipeline: IDs, chunking, and cadence.
