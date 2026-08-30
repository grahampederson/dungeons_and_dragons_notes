This readme is to setup a few things
* A place to store our notes / files (github)
* A tool to modify our files (markdown files - Obsidian)
* An LLM (Ollama)
* A RAG agent (Anything LLM)
	* This allows us to 'seed' conversations with a *shitload of documents*
* A Wiki agent (aider)
	* This should allow us to us AI to build out wiki entries and easier to manage folders / files for information about the campaign.
	
## Tools

### Github

Download and install github - https://desktop.github.com/download/ 

This allows us to sync folders and files between all of us - we can store pictures, notes, and whatever the heck we want.

This will be how we contribute notes to the overall campaign.
### Obsidian

Download and install Obsidian - https://obsidian.md/ - it helps visualize the notes (markdown) and shows distance graphs between concepts. If this grows we'll like it a lot.

Open the existing workspace (from github checkout)
### Ollama

Download and install Ollama - https://ollama.com/download/windows this will allow you to run models locally!

Set your model context length to 64k!

download the model we'll use - `ollama pull qwen3-coder`

`ollama list` - to ensure it exists

### Aider chat

#### Install Python (if you don't have it)
Check first: (everything is written for powershell)

`python --version`

If that errors, install it:

`winget install Python.Python.3.12`

Close and reopen your terminal after this so PATH picks it up, then confirm:

```powershell
python --version
pip --version
```

#### Install Aider using uv (the currently-recommended method — cleaner than raw pip)

```
python -m pip install uv
uv tool install --force --python python3.12 --with pip aider-chat@latest
```

This isolates Aider in its own environment via uv, sidestepping the dependency-conflict issues plain pip install aider-chat sometimes hits (worth doing right the first time rather than debugging pip conflicts later, given tonight).

#### Verify it's on PATH

`aider --version`

If "command not found" — same PATH story as Claude Code earlier — close and reopen the terminal first; if it persists, uv tool install typically places binaries at %USERPROFILE%\.local\bin, so:

powershell
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";$env:USERPROFILE\.local\bin", "User")

then a fresh terminal.

#### Point Aider at your local Ollama model

`setx OLLAMA_API_BASE "http://localhost:11434"`

New terminal, then:

RUN THIS FROM YOUR CHECKED OUT DIRECTORY!

Set your execution policy to run this script:

`Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`

or, if you're a wimp:
`powershell -ExecutionPolicy Bypass -File .\run-aider.ps1`

Run the aider tool:

`.\run-aider.ps1`

To run just the chat model (the 7B model sucks at tool chain calls, like writing files)

`.\run-aider-chat-only.ps1`

#### Quick sanity check

Once it launches, try:

`who is naia stillwater?`

### AnythingLLM

Download AnythingLLM -- https://anythingllm.com/

Create Workspace
Select settings  on the workspace - Agent Configuration, select Ollama - whatever model you like

You have to start new threads when you embed files, so this flow might be shitty?