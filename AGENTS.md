# Wiki Maintenance Agent Instructions

## Your job
Maintain a structured wiki in `/wiki` by ingesting source material from
`/Character/*` and `/campaign/*` (including session notes as they're added).

The wiki is not a cache of the source material — it's a persistent,
compounding artifact. Cross-references, relationship notes, and quest
status get resolved once and stay resolved, so the next ingest, query, or
lint pass isn't starting from scratch. You are doing incremental updates,
never full rebuilds.

There are three layers here: the raw sources (`Character/`, `campaign/` —
read-only), the wiki (`/wiki` — what you maintain), and this file (the
schema: structure, conventions, and the operations below).

## Wiki structure
Maintain three top-level entry categories, one file per entry, plus three
support files at the wiki root:

/wiki/index.md
/wiki/log.md
/wiki/families.md
/wiki/characters/<name>.md
/wiki/places/<name>.md
/wiki/quests/<name>.md

Use lowercase-hyphenated filenames (e.g. `naia-stillwater.md`, `the-sunken-keep.md`).

**`index.md`** is a content catalog, organized by category (Characters /
Places / Quests), one line per entry — name, one-line description, and
status where applicable (quests especially). Update it whenever an entry
is added or its status changes; it should always reflect what currently
exists in `/wiki`. This is a flat catalog, not the place to show how people
relate to each other — that's `families.md`.

**`log.md`** is an append-only, chronological record of what you did: one
entry per Ingest/Query/Lint operation, with a date and a short note of what
changed. Never edit or reorder past entries — only append.

**`families.md`** groups existing character entries by blood family,
household, or standing affiliation (a monastery, a guild, a mercenary
company — anything that clusters people the way a family would, even
without blood ties) so lineage and group membership are visible without
opening every page. It does not duplicate entry content — just name, role,
and a `[[slug|Display Name]]` link per person, grouped under a heading per
family/group:

```markdown
### <Family or Group Name>
**Type:** Blood family | Household | Mentorship / affiliation
- [[slug|Name]] — <role in the group, and how they connect to others in it>
```

Update `families.md` during Ingest whenever a new or updated character has
a stated blood/household/affiliation tie — new member into an existing
group, or a new group entirely. Don't force someone into a group on a
guess; leave them out until source material actually states the
connection.

Each entry file (character/place/quest) should follow this template:
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

## Operations

You have three modes of working with the wiki: **Ingest** (bring new source
material in), **Query** (answer a question using the wiki), and **Lint**
(check the wiki's own health). Default to Ingest whenever new/changed source
files exist; use Query when asked a question about the campaign; run Lint
periodically or when asked.

### Ingest (incremental update)
1. Before editing, check which source files are new or changed since the
   wiki was last updated (use git log/diff on `/Character` and `/campaign`
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
6. Update `index.md` for any entry you added or whose status changed;
   update `families.md` if the source states a blood/household/affiliation
   tie for a new or existing character; and append a line to `log.md`
   noting what was ingested and what changed.

### Query
When asked a question about the campaign (a character, a place, lore, plot,
relationships), search `/wiki` first — not the raw source — and answer with
citations to the specific entries you drew from. If the wiki doesn't have
enough to answer well, say so and pull from raw source as a fallback, noting
the gap. If answering surfaces a synthesis or connection that isn't yet
written down anywhere in the wiki, file it back into the relevant entry (or
`index.md`) rather than only stating it — that's how the wiki compounds.
Append a short line to `log.md` noting the query and whether anything was
filed back.

### Lint
Health-check the wiki itself rather than ingesting anything new:
- **Contradictions** — two entries disagree about the same fact,
  relationship, or event.
- **Stale entries** — an entry's "Last updated" predates changes to the
  source files it cites.
- **Orphan pages** — a wiki entry not linked from `index.md` or from any
  other entry's Related section.
- **Missing cross-links** — an entry mentions another character/place/quest
  by name without a `[[wikilink]]`, or references one with no page at all.
- **Data gaps** — e.g. a quest with no status, an entry missing a Related
  section that clearly should have one.
- **Family/affiliation drift** — a character entry states a
  blood/household/affiliation tie that isn't reflected in `families.md`
  (or vice versa), or a character with no known family/affiliation ties at
  all isn't obviously absent from `families.md` for a stated reason.

Fix mechanical issues directly (add a missing link, correct a stale date,
create a stub for a clearly-missing page). For real contradictions, flag
both sides rather than silently picking one — note it in the entry and in
`log.md` for a human to resolve. Append a summary of the pass to `log.md`.

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
- Do not modify anything in `/Character` or `/campaign` — those are
  source material, read-only inputs. All your writes go in `/wiki`.
- Do not touch `Modelfile` or any Ollama-related files.