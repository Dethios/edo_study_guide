FROM ghcr.io/willfantom/devcontainer-latex:latest-small

# Install TeX Live 2025 as root
USER root

# Copy profile into image (from repo-root build context)
COPY .devcontainer/texlive.profile /tmp/texlive.profile

# Install minimal tools needed for the TL installer
RUN apt-get update && \
  apt-get install -y wget perl && \
  rm -rf /var/lib/apt/lists/*

# Install TeX Live 2025 noninteractively using the profile
RUN mkdir -p /tmp/install-tl && \
  cd /tmp/install-tl && \
  wget -qO- https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | \
    tar xz --strip-components=1 && \
  ./install-tl -profile=/tmp/texlive.profile && \
  rm -rf /tmp/install-tl /tmp/texlive.profile

# Prefer TL2025 binaries
ENV PATH=/usr/local/texlive/2025/bin/x86_64-linux:$PATH

# Configure tlmgr to use current CTAN repo and install required packages
RUN tlmgr option repository https://mirror.ctan.org/systems/texlive/tlnet && \
  tlmgr update --self && \
  tlmgr install \
    latexmk \
    latexindent \
    texliveonfly \
    biber \
    biblatex \
    biblatex-ieee \
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
    xr \
    bookmark \
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
    lualatex-math \
    FiraMono && \
  luaotfload-tool --update && \
  mktexlsr

# Install Fira Code system font via apt
RUN apt-get update && \
  apt-get install -y fonts-firacode && \
  rm -rf /var/lib/apt/lists/* && \
  fc-cache -f -v

# OPTIONAL: prune old TeX Live tree from base image to keep size saner
RUN rm -rf /usr/local/texlive/2023 || true && \
  mktexlsr

# Back to vscode user for Codespaces
USER vscode
