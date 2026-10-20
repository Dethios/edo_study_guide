# EDO Acquisition Study Guide

This repository builds a Navy Engineering Duty Officer (EDO) acquisition study
guide. The LaTeX sources live in `tex/`, with generated build products under
`artifacts/` at the repo root.

Read `AGENTS.md` before content or workflow edits. It contains the current
source-recency, citation, acronym, and validation rules for this project.

## Repository Layout

- `tex/`: LaTeX sources, chapters, templates, assets, TikZ, and bibliographies.
- `tex/assets/coursebook/`: coursebook PDFs; `tex/assets/reference-docs/`: other mirrored evidence and notes.
- `artifacts/out/`: PDF output; `main.pdf` is tracked, while other generated
  outputs are ignored.
- `artifacts/build/`: LaTeX aux files, ignored except `.gitkeep`.
- `artifacts/tikz/`: TikZ externalization cache, ignored except `.gitkeep`.
- `release/`: dated PDF artifacts, ignored by Git and published via releases.
- `scripts/`: build, release, scrub, formatting, count, and validation helpers.
- `scripts/tests/`: focused regression tests for helper scripts.
- `docs/reference/`: imported manuals, style assets, and supporting material.
- `docs/archive/`: historical setup and migration notes.
- `.agents/skills/`: focused tutoring, research/PDF, maintenance and review procedures.
- `.codex/`: local-client defaults/roles, legacy provisioning helpers and dated runtime verification.
- `project_export.json`: project memory and status snapshot.

## Build and Validation

Run commands from the repository root. Native builds need LuaLaTeX, latexmk, Biber, Pygments, the repository's TeX
packages and fonts. PDF review needs Poppler (`pdfinfo`, `pdftotext`, `pdftoppm`) or equivalent viewers; Markdown checks
need `rumdl`. See [.codex/README.md](.codex/README.md) for Cloud setup and known legacy installer limits. Do not assume
Docker is usable simply because its executable is installed. Avoid concurrent editor/agent builds.

Native build (the normal path in a provisioned Cloud environment):

```bash
./scripts/build.sh tex/main.tex
```

Preferred local Docker build using an accessible daemon and already-pulled `texlive/texlive` image:

```bash
./scripts/docker-build.sh tex/main.tex
```

Clean target output/auxiliary files only (diagnose first; this deletes output and exits without rebuilding):

```bash
./scripts/docker-build.sh --clean tex/main.tex
```

Direct `docker run` equivalent:

```bash
docker run --rm --init \
  --user "$(id -u):$(id -g)" \
  -e HOME=/tmp \
  -v "$PWD:/workdir" \
  -w /workdir \
  texlive/texlive:latest \
  ./scripts/build.sh
```

The Docker helper accepts the same trailing file argument as `scripts/build.sh`,
for example `./scripts/docker-build.sh tex/main.tex` or
`./scripts/docker-build.sh tex/chapters/27_CIVPERS.tex`.

After a justified clean, run the normal build again. Use the wrappers to preserve engine, search paths, writable caches
and shell-escape conventions. The Docker wrapper falls back to native only if Docker is absent; an inaccessible daemon
or missing image is an error. `--help` on `scripts/build.sh` lists output/auxiliary-directory options.

TikZ cache invalidation:

```shell
make force-rebuild-tikz
```

TikZ cache path validation:

```shell
make check-tikz-cache
```

Acronym hygiene validation:

```shell
make check-acronyms
```

The acronym check verifies that `tex/acronyms.def` has unique keys, acronym
macros reference defined keys, and acronym macros do not appear inside
table-like environments or optional `\item[...]` labels.

Current-events source-ledger validation:

```shell
make check-current-events-sources
```

The current-events check verifies that `tex/current_events.bib` entries are
cited by the guide and that their URLs also appear in
`docs/study_memory/sources.md`.

Cited BibTeX source-ledger audit:

```shell
make audit-cited-bib-sources
```

The cited-BibTeX audit reports chapter-cited entries in `tex/edo.bib` and
`tex/current_events.bib` whose `http(s)` URLs do not exact-match a row in
`docs/study_memory/sources.md`. It is report-only by default because some legacy
entries are intentionally represented by source landing pages or consolidated
ledger rows; use `scripts/check-cited-bib-sources.py --strict` only after those
gaps are burned down.

Active citation source-metadata audit:

```shell
make audit-active-citation-sources
```

The active-citation audit reads `artifacts/build/main.bcf` from the latest PDF
build and reports active citekeys with URLs that have stale access dates, missing
access dates, or overly generic source URLs. It is report-only by default because
some sources are intentionally controlled-access or request-filtered; use
`scripts/audit-active-citation-sources.py --strict` only after those weak-source
items are ready to become a hard validation gate.

Applied guide-change source-ledger validation:

```shell
make check-guide-change-sources
```

The guide-change check verifies that applied `guide_changes.jsonl` records from
the active audit period cite external URLs that also appear in
`docs/study_memory/sources.md`.

## Verification and contribution

For TeX or figure changes, run a representative build and visually inspect affected rendered pages, adjacent pagination,
and affected TOC/cross-references. Review the actual build log for undefined citations/references, missing glyphs,
overfull boxes and shell-escape errors. Record warnings and pages viewed; compilation alone does not verify layout.
For coursebook review, render relevant image-only slides and diagrams even when text extraction is empty or unchanged.
See the [evidence skill](.agents/skills/edo-doctrine-verifier/SKILL.md) and
[maintenance skill](.agents/skills/edo-study-guide-maintainer/SKILL.md) for procedures.

Run checks that match the change:

```bash
make check-tex-structure
make check-tikz-cache
make check-study-memory
scripts/tests/test-check-acronyms.sh
rumdl check AGENTS.md README.md CONTRIBUTING.md .codex/README.md .agents/skills/
git diff --check
```

The source audits above are report-only; a zero exit does not mean there are no evidence gaps. `make check-study-memory`
also checks current-events and applied guide-change source coverage. Instruction-only edits need metadata, syntax,
reference and Markdown checks, without replacing the tracked PDF. Report unavailable tools instead of claiming a pass.
Follow [CONTRIBUTING.md](CONTRIBUTING.md) for the contribution checklist.

## Format

Use the Docker wrapper with normal `latexindent` arguments:

```bash
./scripts/latexindent-docker.sh -l tex/latexindent.yaml -w tex/main.tex
```

## Scrub temp artifacts

```bash
./scripts/scrub.sh
```

## Release (GitHub Releases only)

The current PDF lives at `artifacts/out/main.pdf` and is tracked. Dated release
PDF copies under `release/` are not tracked in Git.

The release script expects `artifacts/out/main.pdf` to exist, copies it into
`release/`, stages all changes, commits when needed, tags the commit as
`release-YYYYMMDD`, pushes, and uploads the PDF as a GitHub Release asset using
the GitHub CLI. Agents must not run it without explicit authorization to commit, push and publish.

```bash
./scripts/release.sh
```

The release script builds changelog-style notes using `CHANGELOG.md` when the
matching tag section exists. If not, it falls back to recent git log entries.

The GitHub release workflow publishes the checked-in PDF without compiling it. It runs on release tags or manual
dispatch; manual dispatch can create/push a tag. It is not build or agent-validation CI.

## Deeper Documentation

- `AGENTS.md`: repo-specific guidance for Codex and other coding agents.
- `CONTRIBUTING.md`: contribution checklist.
- [.codex/README.md](.codex/README.md): configured local defaults, hosted limitations, model strategy and dated official
  sources.
- [Agent workflow checkpoint](docs/agent-workflow-checkpoint.md): maintenance scope, changes and validation status.
- `docs/reference/README.md`: source-support material boundaries.
- `docs/archive/README.md`: archived notes that are not current workflow truth.

## License

Document content (study guide text/figures/LaTeX under `tex/`) is licensed
under CC BY-NC 4.0 (see `LICENSE`). Code/scripts are licensed under the MIT
License (see `LICENSE-CODE`).

## TikZ externalization security note

TikZ externalization requires `-shell-escape`. Use it only in trusted builds or
an isolated CI job. Keep lint/analysis jobs shell-escape-free.

TikZ externalization uses one canonical cache directory:

- `${project-root}/artifacts/tikz/`

When this project is used as a submodule, `project-root` is the
`edo_study_guide` checkout.
