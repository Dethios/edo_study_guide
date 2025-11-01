# Define an array of paths to add
$newPaths = @(
  "H:\Latex\strawberry-perl\c\bin",
  "H:\Latex\MikTex\texmfs\install\miktex\bin\x64",
  "C:\TEMP\biber_cache"
)

$currentUserPath = [System.Environment]::GetEnvironmentVariable('Path', 'User')
$pathsToAdd = @()

foreach ($path in $newPaths) {
  # Check if the path is already present
  if ($currentUserPath -notlike "*$path*") {
    $pathsToAdd += $path
    Write-Host "'$path' will be added to the user PATH."
  }
  else {
    Write-Host "'$path' is already in the user PATH."
  }
}

# If any paths need to be added, update the environment variable
if ($pathsToAdd.Count -gt 0) {
  $newPathValue = "$currentUserPath;" + ($pathsToAdd -join ';')
  [System.Environment]::SetEnvironmentVariable('Path', $newPathValue, 'User')
  Write-Host "Updated user PATH environment variable."
}
else {
  Write-Host "No new paths were added."
}
