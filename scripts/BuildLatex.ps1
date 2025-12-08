# Clean & (re)create build/output folders
$outDir = "out"
$auxDir = "build"
$mainFile = "src/main.tex"
$jobName = "EDO_Study_Guide"
$dateStamp = Get-Date -Format 'yyyyMMdd'

latexmk -C -outdir=$outDir -auxdir=$auxDir $mainFile
Remove-Item -Recurse -Force $outDir, $auxDir -ErrorAction SilentlyContinue
@($outDir, $auxDir) | ForEach-Object { New-Item -ItemType Directory -Force -Name $_ | Out-Null }

$latexmkArgs = @(
  "-lualatex"
  "-f"
  "-interaction=nonstopmode"
  "-file-line-error"
  "-synctex=1"
  "-quiet"
  "-shell-escape"
  "-outdir=$outDir"
  "-auxdir=$auxDir"
  "-jobname = $jobName-$dateStamp"
  $mainFile
)

# LaTeX pass (creates .aux/.bcf, etc.). latexmk will run again with biber as needed
latexmk @latexmkArgs
