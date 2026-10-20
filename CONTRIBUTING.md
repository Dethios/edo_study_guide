# Contributing

Thanks for your interest in improving the EDO acquisition study guide.

## Workflow

1. Read [AGENTS.md](AGENTS.md). Inspect status/diffs and preserve existing work; create a branch when appropriate.
2. Define the bounded change and locate canonical coverage. For current organizational/policy claims, record dated
   authoritative sources and reconcile applicability/supersession before editing. Visually inspect relevant image-only
   source slides. Keep history, provenance and published output intact for documentation-only tasks.
3. Follow [README.md](README.md) for the installed-toolchain build and checks relevant to the touched files. TeX/figure
   changes need a representative build and inspection of affected rendered pages. Agent-only edits need metadata,
   references and syntax/discovery checks; do not rebuild the study guide solely for instruction prose.
4. Check `git diff --check` and `rumdl check <modified Markdown paths>`. Review the final diff for unrelated changes and
   generated artifacts. Do not run scrub/clean merely to start with an empty workspace.
5. Update `CHANGELOG.md` under Unreleased for notable changes. In a PR, summarize behavior, sources/dates, tests,
   visual coverage and remaining warnings or unavailable checks. Commit/push only when authorized for agent tasks.

## Style and formatting

Keep LaTeX sources in `tex/`. Preserve LuaLaTeX/latexmk, minted/Pygments and source-macro conventions in `AGENTS.md`.
Use `./scripts/latexindent-docker.sh` on scoped files when Docker is available. Keep ASCII unless existing content
requires otherwise; wrap Markdown at 120 characters using `.rumdl.toml`.

## Contributions and derivatives

Please propose improvements or derivative material through a pull request for review and incorporation into the guide.

## Releases and security

Release PDFs use GitHub Releases. The release helper stages all changes, commits, tags, pushes and uploads the tracked
PDF; the workflow publishes without building. Neither is a validation command. Agents need explicit publication
authorization. See [SECURITY.md](SECURITY.md) for reporting sensitive issues.
