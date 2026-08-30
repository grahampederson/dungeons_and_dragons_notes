$files = Get-ChildItem -Path Character, campaign -Recurse -Filter *.md -File
aider $files.FullName