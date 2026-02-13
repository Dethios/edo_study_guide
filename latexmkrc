# Root latexmkrc wrapper so `latexmk ... tex/main.tex` works from repo root.
do './tex/latexmkrc';

# latexmkrc - enable shell-escape for TikZ externalization (trusted builds)
$lualatex = 'lualatex --cnf-line=openout_any=a -shell-escape -halt-on-error -interaction=nonstopmode %O %S';
$pdflatex = 'pdflatex --cnf-line=openout_any=a -shell-escape -halt-on-error -interaction=nonstopmode %O %S';

# This repository uses LuaLaTeX as the primary engine.
$pdf_mode = 4;
$pdflatex = $lualatex;
