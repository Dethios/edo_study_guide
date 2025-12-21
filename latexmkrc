# Keep PDF in repo; put aux where LaTeX/biber agree.
use Cwd qw(abs_path);
use File::Basename qw(dirname);
my $root_dir = abs_path(dirname(__FILE__));
$out_dir = "$root_dir/out";
$aux_dir = "$root_dir/build";
# Stay in repo root so out/build resolve consistently when compiling tex/main.tex.
$do_cd = 0;

# Ensure LuaLaTeX has a writable cache dir for luaotfload/fontspec (important in
# sandboxed environments where $HOME may not be writeable).
use File::Path qw(make_path);
$ENV{'TEXMFVAR'}   = "$aux_dir/texmf-var";
$ENV{'TEXMFCACHE'} = "$aux_dir/texmf-cache";
make_path($ENV{'TEXMFVAR'});
make_path($ENV{'TEXMFCACHE'});

# Ensure LaTeX can see tex/ sources even when latexmk is run from elsewhere.
# Keep search paths shallow to avoid picking up stale aux files.
my $texinputs_sep = ($^O =~ /mswin32|cygwin|msys/i) ? ';' : ':';
$ENV{'TEXINPUTS'} = "$root_dir/tex$texinputs_sep" . ($ENV{'TEXINPUTS'} // '');
$ENV{'BIBINPUTS'} = "$root_dir/tex$texinputs_sep" . ($ENV{'BIBINPUTS'} // '');
$ENV{'BSTINPUTS'} = "$root_dir/tex$texinputs_sep" . ($ENV{'BSTINPUTS'} // '');

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
