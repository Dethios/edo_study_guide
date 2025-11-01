# Keep PDF in repo; put aux where LaTeX/biber agree
$out_dir = 'out';
$aux_dir = 'build';

# Tell latexmk this is a LuaLaTeX workflow
$pdf_mode = 4;

# Enable shell-escape, synctex, etc.
$force_mode   = 1;
$shell_escape = 1;
$synctex      = 1;
$interaction  = 'nonstopmode';
$pvc_timeout  = 600;

# --- Modified pdflatex command ---
$pdflatex = 'lualatex -file-line-error %O %S';

# Glossaries
add_cus_dep('glo','gls',0,'makeglossaries');
sub makeglossaries { system("makeglossaries \"$_[0]\""); }

# Force biber to read/write the aux dir
$bibtex = "biber --input-directory=\"$aux_dir\" --output-directory=\"$aux_dir\" %O %B";
$biber = "biber --input-directory=\"$aux_dir\" --output-directory=\"$aux_dir\" %O %B";
