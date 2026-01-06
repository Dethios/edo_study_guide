# EDO Acquisition Tutor (Study Guide)

This repository builds the Navy Engineering Duty Officer (EDO) Acquisition Tutor
study guide. The LaTeX sources live in `tex/`, while build outputs and aux files
live in `out/` and `build/` at the repo root.

## Repo layout
- `tex/` - LaTeX sources (chapters, templates, assets, TikZ)
- `out/` - PDF output (gitignored)
- `build/` - LaTeX aux files (gitignored)
- `release/` - dated PDF artifacts (gitignored; published via GitHub Releases)
- `scripts/` - build/format/release helpers (bash + PowerShell)

## Build

Bash (WSL/Linux/macOS):
```
./scripts/build.sh
```

PowerShell (Windows):
```
./scripts/build.ps1
```

Direct latexmk:
```
latexmk -shell-escape tex/main.tex
```

## Format

Bash:
```
./scripts/format.sh tex/main.tex
```

PowerShell:
```
./scripts/format.ps1 tex/main.tex
```

## Scrub temp artifacts

Bash:
```
./scripts/scrub.sh
```

PowerShell:
```
./scripts/scrub.ps1
```

## Release (GitHub Releases only)

Release PDFs are not tracked in Git. The release script copies `out/main.pdf`
into `release/` (still gitignored), tags the commit as `release-YYYYMMDD`, and
uploads the PDF as a GitHub Release asset using the GitHub CLI.

Bash:
```
./scripts/release.sh
```

PowerShell:
```
./scripts/release.ps1
```

The release script builds changelog-style notes using `CHANGELOG.md` when the
matching tag section exists. If not, it falls back to recent git log entries.

## AI context bundle

To generate an `ai_context.zip` bundle with diffs, log excerpts, and selected
files, run:
```
./scripts/ai-context.sh
```

## License

Document content (study guide text/figures/LaTeX under `tex/`) is licensed
under CC BY-NC 4.0 (see `LICENSE`). Code/scripts are licensed under the MIT
License (see `LICENSE-CODE`).
