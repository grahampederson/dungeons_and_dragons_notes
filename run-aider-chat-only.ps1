$files = Get-ChildItem -Path Character, campaign -Recurse -Filter *.md -File
aider --model ollama/qwen2.5-coder:7b $files.FullName