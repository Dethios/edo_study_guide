# EDO Acquisition Study Guide

This repository builds a Navy Engineering Duty Officer (EDO) acquisition study
guide. The LaTeX sources live in `tex/`, with generated build products under
`artifacts/` at the repo root.

Read `AGENTS.md` before content or workflow edits. It contains the current
source-recency, citation, acronym, and validation rules for this project.

## Repository Layout

- `tex/`: LaTeX sources, chapters, templates, assets, TikZ, and bibliographies.
- `tex/assets/reference-docs/`: mirrored PDFs, notes, and source-support files.
- `artifacts/out/`: PDF output; `main.pdf` is tracked, while other generated
  outputs are ignored.
- `artifacts/build/`: LaTeX aux files, ignored except `.gitkeep`.
- `artifacts/tikz/`: TikZ externalization cache, ignored except `.gitkeep`.
- `release/`: dated PDF artifacts, ignored by Git and published via releases.
- `scripts/`: build, release, scrub, formatting, count, and validation helpers.
- `scripts/tests/`: focused regression tests for helper scripts.
- `docs/reference/`: imported manuals, style assets, and supporting material.
- `docs/archive/`: historical setup and migration notes.
- `.codex/`: Codex Cloud setup/maintenance scripts and repo-local agent config.
- `project_export.json`: project memory and status snapshot.

## Build and Validation

Local build:

```bash
./scripts/build.sh tex/main.tex
```

Docker build using the already-pulled `texlive/texlive` image:

```bash
./scripts/docker-build.sh tex/main.tex
```

Clean Docker build:

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

Direct latexmk:

```shell
latexmk -r tex/latexmkrc -shell-escape -outdir=artifacts/out -auxdir=artifacts/build tex/main.tex
```

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
the GitHub CLI. Do not run it unless the working tree is ready to publish.

```bash
./scripts/release.sh
```

The release script builds changelog-style notes using `CHANGELOG.md` when the
matching tag section exists. If not, it falls back to recent git log entries.

## Deeper Documentation

- `AGENTS.md`: repo-specific guidance for Codex and other coding agents.
- `CONTRIBUTING.md`: contribution checklist.
- `.codex/README.md`: Codex Cloud setup and maintenance details.
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
