# EDO Study Helper and Codex Environment

## Study helper

Use `.codex/skills/edo-tutor-orchestrator/SKILL.md` to route learning, drills, source verification, and authorized
guide maintenance. The main session owns user interaction and ignored local learner state. Four agent files under
`.codex/agents/` provide bounded tutor, drill, verification, and maintenance workers; they read the matching skill.
Model and effort are selected explicitly at dispatch under the applicable routing policy; these ordinary role files
omit pins. Fast and existing role sandbox/plugin restrictions are retained. New files/settings require a fresh
runtime load; parsing these files is not proof that a running chat adopted them.

Use guide sections plus the coursebook manifest/inventory in `docs/reference/`, inspect relevant source PDF pages,
and verify current/disputed claims against controlling official sources. See `docs/study_memory/README.md` for the
shared-evidence allowlist, ignored operational records, and validation. A new clone has no learner history.

The project config currently declares `approval_policy = "never"`, which conflicts with the supplied global policy.
This study-helper update preserves runtime security settings; resolve that separately with the configuration owner.

## Codex Environment Scripts

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
