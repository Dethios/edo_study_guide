# latexmk-pvc.ps1
# Description: Runs latexmk with LuaLaTeX. Can be run in a continuous preview mode or as a single build.
# Usage: .\latexmk-pvc.ps1 <MainTeXFile> [-Mode <Build|Watch>]

param(
    [Parameter(Mandatory = $true)]
    [string]$Doc,

    [ValidateSet("Build", "Watch")]
    [string]$Mode = "Watch"
)

# Ensure the document has the .tex extension
if (-not $Doc.EndsWith(".tex")) {
    $Doc = "$Doc.tex"
}

# Check if the file exists
if (-not (Test-Path $Doc)) {
    Write-Error "File not found: $Doc"
    exit 1
}

# Define arguments for latexmk
$latexmkArgs = @(
    "-lualatex",
    "-pdf",
    "-outdir=out",
    "-auxdir=build",
    "-f",
    "-shell-escape",
    "-interaction=nonstopmode",
    "-synctex=1",
    "-file-line-error",
    $Doc
)

# Add pvc flag if in Watch mode
if ($Mode -eq "Watch") {
    $latexmkArgs += "-pvc"
}

# Run latexindent
Write-Host "Formatting $Doc with latexindent..."
Write-Host "Arguments: -w -l -m -s -y=`"preserveBlankLines:2,backupExtension:''`"" -ForegroundColor Cyan
latexindent -w -l -m -s -y="preserveBlankLines:2,backupExtension:''" $Doc

# Run latexmk
Write-Host "Running latexmk in $Mode mode..."
Write-Host "Arguments: $($latexmkArgs -join ' ')" -ForegroundColor Cyan
latexmk @latexmkArgs