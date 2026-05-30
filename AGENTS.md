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

Maintain these files when available:

- `sources.md`: source inventory, version/date, URL or file path, authority
  level.
- `study_guide_audit.md`: correction log.
- `question_bank.md` or `question_bank.jsonl`: generated questions, answers,
  explanations, tags, difficulty.
- `learning_log.jsonl`: user responses, correctness, missed concept, weak-area
  tag, next review date.
- `weak_areas.md`: running summary of recurring weak areas and recommended
  review actions.

When generating questions:

- Prefer active recall and scenario-based questions over passive recognition.
- Include the correct answer and explanation separately from the question unless
  the user asks for immediate answers.
- Tag each question by topic, source section, difficulty, and tested skill.

When grading answers:

- Identify whether the miss was factual recall, concept confusion,
  source-version issue, wording ambiguity, or careless error.
- Update the weak-area tracker.
- Recommend the next drill based on the miss pattern.
