# Clean & (re)create build/output folders
$outDir = "out"
$auxDir = "build"
$mainFile = "src/main.tex"
$jobName = "main"

latexmk -C -outdir=$outDir -auxdir=$auxDir $mainFile
Remove-Item -Recurse -Force $outDir, $auxDir -ErrorAction SilentlyContinue
@($outDir, $auxDir) | ForEach-Object { New-Item -ItemType Directory -Force -Name $_ | Out-Null }

$latexmkArgs = @(
  "-lualatex"
  "-g"
  "-f"
  "-interaction=nonstopmode"
  "-shell-escape"
  "-outdir=$outDir"
  "-auxdir=$auxDir"
  $mainFile
)

# First LaTeX pass (creates .aux/.bcf, etc.)
latexmk @latexmkArgs

# Biber pass
biber --input-directory "$auxDir" --output-directory "$auxDir" $jobName

# Final LaTeX pass to incorporate .bbl
latexmk @latexmkArgs
