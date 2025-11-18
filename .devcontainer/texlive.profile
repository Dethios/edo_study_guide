# TeX Live 2025 noninteractive install profile
# tuned for LaTeX-heavy, LuaLaTeX, fonts, math, and tools you use

selected_scheme scheme-small

TEXDIR /usr/local/texlive/2025
TEXMFSYSCONFIG /usr/local/texlive/2025/texmf-config
TEXMFSYSVAR /usr/local/texlive/2025/texmf-var
TEXMFLOCAL /usr/local/texlive/texmf-local
TEXMFVAR ~/.texlive2025/texmf-var
TEXMFCONFIG ~/.texlive2025/texmf-config

binary_x86_64-linux 1

# Don’t mess with PATH at install time; we’ll set PATH in the Dockerfile
instopt_adjustpath 0
instopt_adjustrepo 0
instopt_letter 1
instopt_portable 0
instopt_write18_restricted 1

# Keep the image reasonable size: no docs/src
tlpdbopt_autobackup 0
tlpdbopt_desktop_integration 0
tlpdbopt_file_assocs 0
tlpdbopt_install_docfiles 0
tlpdbopt_install_srcfiles 0

# Core collections – LaTeX, LuaLaTeX, fonts, math, tools
collection-basic 1
collection-latex 1
collection-latexrecommended 1
collection-latexextra 1
collection-binextra 1
collection-fontsrecommended 1
collection-fontsextra 1
collection-mathscience 1
collection-luatex 1
collection-langenglish 1
