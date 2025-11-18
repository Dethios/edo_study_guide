FROM ghcr.io/willfantom/devcontainer-latex:latest-small

# Install TeX Live 2025 as root
USER root

# Copy profile into image (from repo-root build context)
COPY .devcontainer/texlive.profile /tmp/texlive.profile

# Install minimal tools needed for the TL installer
RUN apt-get update \
    && apt-get install -y wget perl \
    && rm -rf /var/lib/apt/lists/*

# Install TeX Live 2025 noninteractively using the profile
RUN mkdir -p /tmp/install-tl \
    && cd /tmp/install-tl \
    && wget -qO- https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
       | tar xz --strip-components=1 \
    && ./install-tl -profile=/tmp/texlive.profile \
    && rm -rf /tmp/install-tl /tmp/texlive.profile

# Prefer TL2025 binaries; optional: remove TL2023 to save space
ENV PATH=/usr/local/texlive/2025/bin/x86_64-linux:$PATH

# OPTIONAL: prune old TeX Live tree from base image to keep size saner
RUN rm -rf /usr/local/texlive/2023 || true \
    && mktexlsr

# Back to vscode user for Codespaces
USER vscode
