# Codex Environment Scripts

Codex Cloud environments support a setup script, run once per cache build, and
an optional maintenance script, run when a cached container is resumed. This
repo is a LuaLaTeX and `latexmk` project, so Codex Cloud needs TeX Live and
helpers installed before it can run `latexmk`.

## Files

- `.codex/setup.sh`: installs TeX Live (apt) + required binaries/fonts for this repo.
- `.codex/maintenance.sh`: quick sanity checks + font database refresh for cached containers.

## TeX Live packages installed

The setup script installs the following TeX Live packages via apt:

- `texlive-bibtex-extra`: biber, biblatex
- `texlive-extra-utils`: latexmk, texlive-extra-utils
- `texlive-fonts-extra`: additional fonts
- `texlive-fonts-recommended`: standard fonts
- `texlive-generic-extra`: xstring, xurl, bookmark
- `texlive-humanities`: datetime2
- `texlive-koma-script`: scrbook, scrlayer-scrpage
- `texlive-lang-english`: English language support
- `texlive-latex-extra`: common LaTeX packages
- `texlive-luatex`: LuaLaTeX engine
- `texlive-math-extra`: unicode-math
- `texlive-pictures`: TikZ, graphics
- `texlive-science`: siunitx, other science packages

## Required binaries

The maintenance script checks for these required binaries:

- `lualatex`: LuaLaTeX compiler
- `latexmk`: build automation
- `biber`: bibliography processor
- `pygmentize`: code highlighting (python3-pygments)
- `make`: build tool

## Suggested Configuration

In `chatgpt.com/codex/settings/environments`:

- Setup script: paste the contents of `.codex/setup.sh`. This is recommended
  for automatic cache invalidation. If you instead run `bash .codex/setup.sh`,
  changing the repo script will not automatically reset the environment cache.
- Maintenance script: optionally paste `.codex/maintenance.sh`, or run
  `bash .codex/maintenance.sh`.

For ordinary local builds, prefer `./scripts/docker-build.sh tex/main.tex` from
the repository root.
