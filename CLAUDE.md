# CLAUDE.md

This repo is a D&D campaign's shared notes: player-written character material,
session notes, and a generated wiki that ties it all together. Your main job
here is **wiki maintenance** — keeping `/wiki` an accurate, up-to-date,
cross-linked summary of everything else in the repo.

Treat the wiki as a persistent, compounding artifact, not a cache you
regenerate from source each time — cross-references and resolved
contradictions should stay resolved, so later work builds on what's already
there instead of re-deriving it. Three layers: raw sources (`Character/`,
`campaign/` — read-only), the wiki (`/wiki` — what you maintain), and the
schema (`AGENTS.md` — the conventions below apply to).

The full wiki-maintenance rules (structure, entry template, the Ingest /
Query / Lint operations, content rules) live in
[`AGENTS.md`](./AGENTS.md) — read it and follow it. Those rules were
written for the aider/Ollama workflow described in `README.md`, but they
apply equally to you; treat `AGENTS.md` as the single source of truth for
wiki conventions so both tools stay in sync. Do not fork a separate set of
rules here — if the process needs to change, update `AGENTS.md` and this
file will still be correct.

## Current repo layout (as of this writing)

- `Character/<Name>/*.md` — one folder per PC, containing backstory docs,
  character sheets, and similar source material. **Read-only input** — never
  edit these.
- `wiki/index.md` — content catalog of every wiki entry, by category. Keep
  it current whenever you add an entry or change a status.
- `wiki/log.md` — append-only history of Ingest/Query/Lint operations.
  Append, never rewrite past entries.
- `wiki/families.md` — groups characters by blood family, household, or
  affiliation (e.g. the Cistern Monastery), so lineage/relationships are
  visible at a glance instead of only inside each entry's Related section.
- `wiki/characters/<slug>.md` — your output for each character, per the
  template and process in `AGENTS.md`.
- `wiki/places/`, `wiki/quests/` — not created yet; add them (per
  `AGENTS.md`) the first time a place or quest actually shows up in source
  material. Don't pre-create empty structure.
- No `campaign/` or session-notes folder exists yet. When one is added
  (`AGENTS.md` expects something like `/campaign/sessions/`), that becomes
  your other primary input alongside `Character/`.
- `.obsidian/` — Obsidian workspace config, not content. Leave it alone.
- `run-aider*.ps1`, `update-wiki-characters.ps1` — Windows/aider tooling for
  running the same wiki-maintenance job with a local Ollama model. Not
  something you need to run, just context for why `AGENTS.md` is phrased the
  way it is.

## Working notes specific to you

- Before updating the wiki (Ingest), check `git log`/`git diff` on
  `Character/` (and `campaign/` once it exists) to see what's actually new
  or changed — don't reprocess untouched source files.
- Filenames under `Character/` use `Name_Name` with underscores and spaces
  inconsistently (e.g. `Character/Naia_Stillwater/Naia Stillwater.md`); wiki
  slugs are always lowercase-hyphenated regardless of the source filename's
  casing (`naia-stillwater.md`).
- When a source file gives conflicting or ambiguous info, follow
  `AGENTS.md`'s rule: update the entry and note the change rather than
  silently erasing prior content — don't ask the player to disambiguate
  unless it's genuinely unclear which fact is current.
- If someone asks a question about the campaign (who's this NPC, what's the
  status of a quest, how do two characters relate), that's a Query: answer
  from `/wiki` with citations to the entries you used, and file back any
  new synthesis rather than just saying it once and losing it.
- Every Ingest or Query that changes or adds something should update
  `index.md` and get a line in `log.md`. Run a Lint pass when asked, or
  proactively if you notice something looks stale/orphaned/contradictory
  while doing other work.
- When ingesting a character with a stated family/household/affiliation
  tie, add or update their group in `families.md` too — don't leave that
  as an index-only or Related-section-only fact.
- Only touch files inside `/wiki`. Everything else in this repo is input,
  not output.
