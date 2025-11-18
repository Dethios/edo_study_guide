if command -v tlmgr >/dev/null 2>&1; then
  TLMGR_BIN="$(command -v tlmgr)"

  # Use live CTAN repo appropriate for TL2025
  sudo "${TLMGR_BIN}" option repository https://mirror.ctan.org/systems/texlive/tlnet
  sudo "${TLMGR_BIN}" update --self

  sudo "${TLMGR_BIN}" install \
    latexmk \
    latexindent \
    texliveonfly \
    biber \
    biblatex \
    csquotes \
    siunitx \
    booktabs \
    caption \
    ragged2e \
    enumitem \
    tabularray \
    tcolorbox \
    marginnote \
    ifoddpage \
    lastpage \
    float \
    chngcntr \
    minted \
    listings \
    pgf \
    smartdiagram \
    standalone \
    subfiles \
    xstring \
    glossaries-extra \
    babel-english \
    datetime2 \
    hyperref \
    xurl \
    xr-hyper \
    bookmark \
    shellesc \
    adjustbox \
    grffile \
    fontspec \
    unicode-math \
    xcolor \
    setspace \
    kvoptions \
    iftex \
    etoolbox \
    fira \
    xcharter \
    xcharter-math \
    libertinus-otf \
    stix2-otf \
    luaotfload \
    lualatex-math

  luaotfload-tool --update
  fc-cache -fv
else
  echo "WARNING: tlmgr not found; skipping TeX Live setup."
fi
