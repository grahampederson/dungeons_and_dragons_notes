# Wiki Maintenance Agent Instructions

## Your job
Maintain a structured wiki in `/wiki` by ingesting source material from
`/characters/*` and `/campaign/*` (including session notes as they're added).
You are doing incremental updates, never full rebuilds — see "Incremental
update process" below.

## Wiki structure
Maintain three top-level categories, one file per entry:

/wiki/characters/<name>.md
/wiki/places/<name>.md
/wiki/quests/<name>.md

Use lowercase-hyphenated filenames (e.g. `naia-stillwater.md`, `the-sunken-keep.md`).

Each entry should follow this template:
```markdown
# <Name>

**Last updated:** <date>
**Source(s):** <session notes / files this entry draws from>

## Summary
<2-4 sentence overview>

## Details
<Organized notes — status, relationships, current goals/location, etc.,
whatever is relevant to this entry type>

## Related
- [[other-entry]] — <how they connect>
```

## Incremental update process
1. Before editing, check which source files are new or changed since the
   wiki was last updated (use git log/diff on `/characters` and `/campaign`
   — do not re-read or reprocess files that haven't changed).
2. For each new or changed source file, identify what characters, places,
   and quests it mentions.
3. For each one:
   - If a wiki entry already exists, **update it in place** — add new
     information, update status/relationships, don't duplicate what's
     already there. Update the "Last updated" and "Source(s)" fields.
   - If no entry exists yet, create one using the template above.
4. Never delete or overwrite existing wiki content unless it's been
   explicitly contradicted by newer source material — in that case, update
   the entry and note the change rather than silently erasing history.
5. Cross-link related entries using `[[wiki-link]]` syntax whenever an
   entry mentions another character, place, or quest.

## Session notes specifically
Session notes in `/campaign/sessions/` (or wherever they land) are your
primary incremental trigger. When a new session note appears:
- Extract every character, place, and quest mentioned or advanced.
- Update quest status (active/completed/failed) if the session resolved
  or progressed one.
- Update character entries with new events, relationships, or acquired
  items/abilities.
- Add new places/NPCs/quests introduced in that session as new entries.

## Content rules
1. Maintain a clear, organized, reference-style tone — this is a lookup
   wiki, not narrative prose.
2. Keep entries factual and grounded in the source material — don't
   invent details, connections, or lore not present in the files you're
   given.
3. Keep quest entries structured with clear status: Active / Completed /
   Failed / On Hold.
4. Keep D&D 5e mechanical details (stats, abilities, items) accurate to
   what's stated in source files — don't guess at mechanics not specified.

## What NOT to touch
- Do not modify anything in `/characters` or `/campaign` — those are
  source material, read-only inputs. All your writes go in `/wiki`.
- Do not touch `Modelfile` or any Ollama-related files.