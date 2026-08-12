This readme is to setup a few things
* A place to store our notes / files (github)
* A tool to modify our files (markdown files - Obsidian)
* An LLM (Ollama)
* A RAG agent (AnythingLLM)
	* This allows us to 'seed' conversations with a *shitload of documents*
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
#### Ollama custom models

For Players - `ollama create player-model -f ./Modelfile`
For DM - `ollama create dm-loremaster -f ./DM/Modelfile`

Then you can run the custom model - `ollama run dm-loremaster` or `ollama run player-model`

### AnythingLLM

Download AnythingLLM -- https://anythingllm.com/

Create Workspace
Select settings  on the workspace - Agent Configuration, select Ollama - player-model

Select the download icon on the workspace, add the github files, click save and embed (just drag and drop, you'll need to do this every update I think)

You have to start new threads when you embed files, so this flow might be shitty?
