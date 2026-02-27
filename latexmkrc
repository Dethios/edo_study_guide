# Root latexmkrc wrapper so `latexmk ... tex/main.tex` works from repo root.
do './tex/latexmkrc';

# latexmkrc - enable shell-escape for TikZ externalization (trusted builds)
$lualatex = 'lualatex -shell-escape -interaction=nonstopmode %O %S';
$pdflatex = 'pdflatex -shell-escape -interaction=nonstopmode %O %S';

# This repository uses LuaLaTeX as the primary engine.
$pdf_mode = 4;
$pdflatex = $lualatex;
