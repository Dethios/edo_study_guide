# Contributing

Thanks for your interest in improving the EDO Acquisition Tutor study guide.

## Quick start

1. Fork and clone the repository.
2. Create a feature branch.
3. Make your changes.
4. Run a build:
   - `./scripts/build.sh` (WSL/Linux/macOS)
   - `./scripts/build.ps1` (Windows)
5. Scrub temp artifacts:
   - `./scripts/scrub.sh` or `./scripts/scrub.ps1`
6. Update `CHANGELOG.md` under the Unreleased section.
7. Submit a pull request.

## Style and formatting

- Keep LaTeX sources in `tex/`.
- Use `latexindent` via `./scripts/format.sh` or `./scripts/format.ps1`.
- Keep ASCII and house style in LaTeX content.

## Contributions and derivatives

If you create improvements or derivative material, please open a pull request
so changes can be reviewed and incorporated into the main guide.

## Releases

Release PDFs are published through GitHub Releases only. Run a build first so
`artifacts/out/main.pdf` exists. The release scripts copy the PDF into the gitignored
`release/` directory, commit any staged changes, tag the commit, push, and
upload the asset via the GitHub CLI.

## Security

For security issues, see `SECURITY.md`.
