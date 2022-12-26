# Set the destination directory on the desktop
$dest = "$env:USERPROFILE\Desktop\jakoby-payloads"

# Create the destination directory if it doesn't already exist
if (-not (Test-Path $dest)) {
  New-Item -ItemType Directory -Path $dest | Out-Null
}

# Get all text files in the current directory and its subdirectories
$textFiles = Get-ChildItem -Path . -Recurse -Include "*.txt" -File

# Copy the text files to the destination directory
foreach ($textFile in $textFiles) {
  Copy-Item -Path $textFile.FullName -Destination $dest
}