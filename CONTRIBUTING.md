# Contributing

Thanks for your interest in improving the EDO acquisition study guide.

## Quick start

1. Fork and clone the repository.
2. Create a feature branch.
3. Make your changes.
4. Run a build:
   - `./scripts/docker-build.sh tex/main.tex` preferred
   - `./scripts/build.sh tex/main.tex` local fallback
5. Scrub temp artifacts:
   - `./scripts/scrub.sh`
6. Update `CHANGELOG.md` under the Unreleased section.
7. Submit a pull request.

## Style and formatting

- Keep LaTeX sources in `tex/`.
- Use `latexindent` via `./scripts/latexindent-docker.sh` when formatting files.
- Keep ASCII and house style in LaTeX content.

## Contributions and derivatives

If you create improvements or derivative material, please open a pull request
so changes can be reviewed and incorporated into the main guide.

## Releases

Release PDFs are published through GitHub Releases only. Run a build first so
`artifacts/out/main.pdf` exists. The release script copies the PDF into the
gitignored `release/` directory, stages all changes, commits when needed, tags
the commit, pushes, and uploads the asset via the GitHub CLI.

## Security

For security issues, see `SECURITY.md`.
