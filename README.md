## Tools

### Obsidian

Download and install Obsidian - https://obsidian.md/ - it helps visualize the notes (markdown) and shows distance graphs between concepts. If this grows we'll like it a lot.

### Github

Download and install github - https://desktop.github.com/download/ 

This allows us to sync folders and files between all of us - we can store pictures, notes, and whatever the heck we want.

This will be how we contribute notes to the overall campaign.

### Ollama

Download and install Ollama - https://ollama.com/download/windows this will allow you to run models locally!
#### Ollama custom models

For Players - `ollama create player-model -f ./Modelfile`
For DM - `ollama create dm-loremaster -f ./DM/Modelfile`

Then you can run the custom model - `ollama run dm-loremaster` or `ollama run player-model`

#### Update For your Character

Command Prompt

```
(type Character\Naia_Stillwater\*.md & echo. & set /p ="") | ollama run player-model
```

Powershell

```
Get-Content .\Character\Naia_Stillwater\*.md | ollama run player-model
```

## Optional

If you'd rather use a more beautiful front end, look at BMO Chatbot, or Smart Connections in obsidian. If you type in `dm-loremaster` or `player-model` you can use those new models you created automagically. 