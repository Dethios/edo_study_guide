# EDO Acquisition Tutor

This repository builds the Navy Engineering Duty Officer (EDO) Acquisition Tutor
study guide. The LaTeX sources live in `tex/`, while build outputs and aux files
live under `artifacts/` at the repo root.

Read `AGENTS.md` before content or workflow edits. It contains the current
source-recency, citation, acronym, and validation rules for this project.

## Repository Layout

- `tex/`: LaTeX sources, chapters, templates, assets, TikZ, and bibliographies.
- `tex/assets/reference-docs/`: mirrored PDFs, notes, and source-support files.
- `artifacts/out/`: PDF output, ignored by Git.
- `artifacts/build/`: LaTeX aux files, ignored by Git.
- `artifacts/tikz/`: TikZ externalization cache, ignored by Git.
- `out/` and `build/`: compatibility symlinks to artifact directories.
- `release/`: dated PDF artifacts, ignored by Git and published via releases.
- `scripts/`: build, format, release, scrub, and helper scripts.
- `docs/reference/`: imported manuals, style assets, and supporting material.
- `docs/archive/`: historical setup and migration notes.
- `project_export.json`: project memory and status snapshot.

## Build and Validation

Bash (WSL/Linux/macOS):

```bash
./scripts/build.sh
```

Docker using the already-pulled `texlive/texlive` image:

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

PowerShell (Windows):

```powershell
./scripts/build.ps1
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

Bash:

```bash
./scripts/format.sh tex/main.tex
```

PowerShell:

```powershell
./scripts/format.ps1 tex/main.tex
```

## Scrub temp artifacts

Bash:

```bash
./scripts/scrub.sh
```

PowerShell:

```powershell
./scripts/scrub.ps1
```

## Release (GitHub Releases only)

Release PDFs are not tracked in Git. The release script expects `artifacts/out/main.pdf`
to exist, copies it into `release/` (still gitignored), commits any staged
changes, tags the commit as `release-YYYYMMDD`, pushes, and uploads the PDF as a
GitHub Release asset using the GitHub CLI.

Bash:

```bash
./scripts/release.sh
```

PowerShell:

```powershell
./scripts/release.ps1
```

The release script builds changelog-style notes using `CHANGELOG.md` when the
matching tag section exists. If not, it falls back to recent git log entries.

## AI context bundle

To generate an `ai_context.zip` bundle with diffs, log excerpts, and selected
files, run:

```bash
./scripts/ai-context.sh
```

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
