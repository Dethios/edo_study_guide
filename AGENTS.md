# Repository Guidelines

## Project Structure & Module Organization

This repository builds the Navy Engineering Duty Officer acquisition study
guide. Default to concise board-prep tutoring; use deeper mastery explanations
when requested.

- `tex/`: LaTeX sources, chapters, templates, TikZ, styles, and bibliography.
- `tex/main.tex`: main build target.
- `tex/acronyms.def`: acronym source of truth.
- `tex/edo.bib`, `tex/current_events.bib`, `tex/was_refs.bib`: bibliographies.
- `scripts/`: build, Docker build, release, scrub, format, and count helpers.
- `artifacts/out/`, `artifacts/build/`, `artifacts/tikz/`: generated output,
  aux files, and TikZ cache; do not track generated contents.
- `docs/reference/` and `docs/archive/`: source material and historical notes.
- `project_export.json`: durable project memory/status snapshot.

## Build, Test, and Development Commands

Before building, ensure no other LaTeX build is running; Latex Workshop may
build on save.

- `./scripts/docker-build.sh tex/main.tex`: preferred full PDF build.
- `./scripts/docker-build.sh --clean tex/main.tex`: clean retry for stale
  artifacts.
- `./scripts/build.sh tex/main.tex`: local fallback.
- `make check-acronyms`: validate acronym keys and macro placement.
- `make check-tikz-cache`: validate TikZ externalization paths.
- `rg "TODO|undefined citation|Missing character" tex artifacts/build`: focused
  content/build warning scan.

## Coding Style & Naming Conventions

Use ASCII unless an existing file requires otherwise. Use `\autocite{}` inside
sentences before punctuation. Use lowercase `\ac{}` keys in prose; avoid acronym
macros in headings and tables unless the surrounding file already requires it.
Prefer `longtblr` for tables and `description` for term/definition lists. Use
`docs/reference/legacy/` for legacy material; do not recreate `Other/`.

## Testing Guidelines

Run the Docker build for source changes and report remaining warnings,
especially overfull boxes, missing citations, or shell-escape issues. Run
`make check-acronyms` when touching `tex/acronyms.def` or acronym usage.

## Commit & Pull Request Guidelines

Recent history uses concise imperative subjects such as `Add ACAT III cost
thresholds and MDA assignment detail` and `Correct EDO flag roster grades`.
Update `CHANGELOG.md` for notable documentation, build, release, or public
workflow changes.

Pull requests should summarize affected chapters/scripts, sources checked,
validation run, residual warnings, and generated artifacts excluded.

## Security, Sources & Agent Instructions

Preserve OPSEC, CUI, procurement-integrity, and source boundaries. Verify
date-sensitive doctrine against current primary sources and stamp doctrine
deliverables `Current as of YYYY-MM-DD`. Source hierarchy is statute,
regulation, policy, local guidance, then courseware or secondary explanation.
Read `project_export.json` only for long-running status, project memory, or
instruction synchronization.
