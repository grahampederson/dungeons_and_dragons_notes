# update-wiki-characters.ps1
# Walks every character folder, feeds all its .md files to Aider,
# and creates/updates the matching wiki entry.

$characterFolders = Get-ChildItem -Path .\Character -Directory
New-Item -ItemType Directory -Force -Path .\wiki\characters | Out-Null

foreach ($folder in $characterFolders) {
    $sourceFiles = @(Get-ChildItem -Path $folder.FullName -Filter *.md -File)
    if ($sourceFiles.Count -eq 0) { continue }

    $slug = ($folder.Name -replace '_', '-').ToLower()
    $wikiFile = "wiki\characters\$slug.md"
    $sourceListText = ($sourceFiles.Name -join ", ")
    $fileArgs = @($sourceFiles.FullName) + $wikiFile

    $message = "Following the rules and template in AGENTS.md, read the source file(s) for this character: $sourceListText. Create or update ONLY the file $wikiFile with a summary according to the wiki entry template. Do NOT modify or create any file inside the Character folder. The only file you are allowed to write to is $wikiFile. Include a Summary and Details section, and list Source(s) as the exact file name(s) you read from. Only use information present in the source file(s), do not invent details."

    Write-Host "`n=== Processing $($folder.Name) ===" -ForegroundColor Cyan

    $beforeFiles = (Get-ChildItem $folder.FullName -Filter *.md).Name

    aider --model ollama/qwen2.5-coder:7b --yes --message $message $fileArgs

    $afterFiles = (Get-ChildItem $folder.FullName -Filter *.md).Name
    $newFiles = $afterFiles | Where-Object { $_ -notin $beforeFiles }
    if ($newFiles) {
        Write-Host "WARNING: Aider created unexpected file(s) in $($folder.Name): $newFiles" -ForegroundColor Red
    }
}

Write-Host "`nDone. Review changes with: git log --oneline -10" -ForegroundColor Green