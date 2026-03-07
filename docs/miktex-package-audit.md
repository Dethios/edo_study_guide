# MiKTeX Package Audit

Current as of 2026-03-03.

## Scope and method

- Scanned source files: `*.tex`, `*.ltx`, `*.sty`, `*.cls`, `*.bib`.
- Extracted tokens from:
  - `\usepackage{...}`
  - `\RequirePackage{...}`
  - `\documentclass{...}`
  - `\usetikzlibrary{...}`
  - `\usemintedstyle{...}`
  - `\addbibresource{...}` and `\bibliography{...}`
- Verified MiKTeX package IDs with `miktex packages info` in `miktex/miktex:essential`.

## Discovered LaTeX tokens

- `\usepackage`:
  - `biblatex`, `shellesc`, `smartdiagram`, `../moderntech-colors`
- `\RequirePackage`:
  - `adjustbox`, `array`, `babel`, `biblatex`, `bookmark`, `booktabs`, `caption`, `chngcntr`, `csquotes`, `datetime2`, `enumitem`, `etoolbox`, `float`, `fontspec`, `glossaries-extra`, `graphicx`, `grffile`, `hyperref`, `ifoddpage`, `iftex`, `kvoptions`, `lastpage`, `listings`, `marginnote`, `microtype`, `minted`, `moderntech`, `moderntech-base`, `moderntech-colors`, `ragged2e`, `scrlayer-scrpage`, `setspace`, `siunitx`, `smartdiagram`, `standalone`, `subfiles`, `tabularray`, `tblr-extras`, `tcolorbox`, `tikz`, `unicode-math`, `xcolor`, `xparse`, `xr-hyper`, `xstring`, `xurl`
- `\documentclass`:
  - `moderntech`, `subfiles`, `standalone`
- `\usetikzlibrary`:
  - `arrows.meta`, `backgrounds`, `calc`, `external`, `fit`, `positioning`, `shapes`, `shapes.geometric`
- `\addbibresource`/`\bibliography`:
  - `edo.bib`, `was_refs.bib`, `current_events.bib`, `\moderntech@bibresource`

## Mapping to MiKTeX package IDs

### Direct mappings

- `adjustbox -> adjustbox`
- `babel -> babel`
- `biblatex -> biblatex`
- `style=ieee (biblatex option) -> biblatex-ieee`
- `bookmark -> bookmark`
- `booktabs -> booktabs`
- `caption -> caption`
- `chngcntr -> chngcntr`
- `csquotes -> csquotes`
- `datetime2 -> datetime2`
- `enumitem -> enumitem`
- `etoolbox -> etoolbox`
- `float -> float`
- `fontspec -> fontspec`
- `glossaries-extra -> glossaries-extra`
- `grffile -> grffile`
- `hyperref -> hyperref`
- `ifoddpage -> ifoddpage`
- `iftex -> iftex`
- `kvoptions -> kvoptions`
- `lastpage -> lastpage`
- `listings -> listings`
- `marginnote -> marginnote`
- `microtype -> microtype`
- `minted -> minted`
- `ragged2e -> ragged2e`
- `setspace -> setspace`
- `siunitx -> siunitx`
- `smartdiagram -> smartdiagram`
- `standalone -> standalone`
- `subfiles -> subfiles`
- `tabularray -> tabularray`
- `tblr-extras -> tblr-extras`
- `tcolorbox -> tcolorbox`
- `unicode-math -> unicode-math`
- `xcolor -> xcolor`
- `xkeyval -> xkeyval` (transitive dependency observed during validation via `datetime2`)
- `xstring -> xstring`
- `xurl -> xurl`

### Normalized/bundle mappings

- `tikz` and all `\usetikzlibrary{...}` tokens -> `pgf`
- `scrlayer-scrpage` and KOMA class (`scrbook` via `moderntech.cls`) -> `koma-script`
- `graphicx -> graphics`
- `array -> latex-tools`
- `shellesc -> latex-tools`
- `xparse -> l3packages`
- `xr-hyper -> hyperref` (provided with hyperref in this image)

### Tooling-derived mappings (from repo config)

- `latexmk` required by build scripts/recipes -> `latexmk`
- `backend=biber` in `tex/main.tex` and `biber` command in `tex/latexmkrc` -> architecture-specific `biber-*` package resolved at runtime by `scripts/docker-build.sh`:
  - lookup command: `miktex packages list --template "{id}" | grep -E '^biber(-linux-)?'`
  - selected package: first matching `biber-linux-*` ID, fallback to first `biber-*` ID
- `latexindent` referenced in VS Code settings -> `latexindent`
- `chktex` referenced in VS Code settings -> `chktex`

## Not mapped to MiKTeX (local/project artifacts)

- `moderntech`, `moderntech-base`, `moderntech-colors`, `../moderntech-colors`, `\moderntech@bibresource`
- These are repo-local class/style/macros and are not MiKTeX packages.

## Uncertain mappings and resolution path

- `biber` is architecture-specific in MiKTeX package IDs (`biber-linux-x86_64`, `biber-linux-aarch64`, etc.).
- Resolution in this repo is runtime detection in `scripts/docker-build.sh`, not a fixed ID in `miktex-packages.txt`.
- If `xr-hyper` is not found separately in a future image, keep `hyperref` mapping (current image provides `xr-hyper` through that package set).
