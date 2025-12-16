# Minimum LaTeX toolchain (binaries + packages)

This repo builds with LuaLaTeX via `latexmk` (see `latexmkrc`).

## Minimum required binaries

- `lualatex`
- `latexmk`
- `biber`
- `makeglossaries`
- `pygmentize` (for `minted`)

## Minimum apt packages (Ubuntu/Debian)

This is a practical minimum set that supports the current document (tables, minted, biber/biblatex, glossaries, fonts):

```sh
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
  biber latexmk make perl python3 python3-pygments \
  fontconfig fonts-firacode fonts-fira-sans fonts-fira-mono \
  texlive-bibtex-extra texlive-pictures \
  texlive-luatex texlive-latex-extra texlive-extra-utils \
  texlive-fonts-recommended texlive-fonts-extra \
  texlive-lang-english texlive-science
```

## Example files

See `.devcontainer/examples/` for a minimal devcontainer variant using apt-based TeX Live.
