# Clean & (re)create build/output folders
latexmk -C
Remove-Item -Recurse -Force out, build -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force -Name out, build | Out-Null

# Variables
$bld = "build"
$main = "EDO_Qual_Study_Guide"

# First LaTeX pass (creates .aux/.bcf, etc.)
latexmk -lualatex -g -f -interaction=nonstopmode -cd -shell-escape $main

# Biber pass
biber --input-directory "$bld" --output-directory "$bld" $main

# Final LaTeX pass to incorporate .bbl
latexmk -lualatex -g -f -interaction=nonstopmode -cd -shell-escape $main
