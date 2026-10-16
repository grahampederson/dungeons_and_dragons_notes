# Wiki Log

Append-only. One entry per Ingest / Query / Lint operation (see `AGENTS.md`).
Never edit or reorder past entries — only append new ones at the bottom.

## 2026-09-12 — Schema
Added `index.md` and `log.md` and adopted the Ingest/Query/Lint operations
described in `AGENTS.md`. Backfilled `index.md` with the two existing
entries (`naia-stillwater`, `tavian-runewick`); no content changes made to
either entry. Noted but did not act on: `Character/Jaecron/` has no
corresponding `wiki/characters/` entry yet.

## 2026-09-12 — Lint
Checked `naia-stillwater.md` and `tavian-runewick.md` against their source
files and against each other. Findings:
- **Stale/wrong dates.** Both entries carried "Last updated" dates
  (2023-10-01/02) that predate the actual repo history (both were written
  2026-08-30) — looked like a leftover placeholder rather than a real
  update time. Corrected both to today.
- **Missing cross-links (fixed).** Related sections linked to `[[Coen
  Ashgrove]]`, `[[Master Ithren]]`, `[[Sera Voss]]`, `[[Elira Runewick]]`,
  `[[Professor Mirabel Runewick]]`, `[[Professor Corvin Drell]]` — none of
  these pages existed, and the link text didn't match the lowercase-hyphen
  slug convention anyway, so they wouldn't have resolved even once created.
  Created stub entries for all six from the same source files the citing
  PC entry already draws from (`Naia_Stillwater.md`,
  `My backstory hurts - Graham.md`, `Tavian_Runewick.md`), and rewrote the
  links in both PC entries as `[[slug|Display Name]]`.
- **Flagged, not created:** `Rune Thing™` (mentioned in
  `tavian-runewick.md`) — source material explicitly leaves it undefined
  ("make it whatever fits the campaign"), so a page would have to invent
  details. Left as plain text with a note instead of a page.
- **Flagged, not created:** Professor Aldren Runewick (Tav's father,
  `Tavian_Runewick.md`) — mentioned by name several times but always
  jointly with Mirabel, with no individually-distinct characterization in
  source. Didn't create a thin page; revisit if a session note gives him
  more material, or create a minimal stub if a human wants one anyway.
- No contradictions or orphan pages found among the entries that existed
  before this pass.

## 2026-09-12 — Ingest
Source: `Character/Jaecron/Jaecron Daughtry.md` (new — no prior wiki entry
existed). Created `jaecron-daughtry.md` (PC) plus five NPC entries the
backstory introduces: `mae-vanderbuilt`, `alister-vanderbuilt`,
`grandpa-daughtry`, `mama-daughtry`, `pa-daughtry`. `mae-vanderbuilt.md`
and `pa-daughtry.md` are thin — source gives little beyond relationship
and one or two traits; flagging for expansion if more source material
appears (session notes, follow-up backstory docs). Updated `index.md`
with all six new entries under Characters (split into Player characters /
NPCs for readability, per no objection in `AGENTS.md` to sub-grouping
within a category).

## 2026-09-12 — Schema
Added `wiki/families.md` to the schema (per `AGENTS.md`) to make blood
family/household/affiliation lineage visible without opening every entry
— the flat `index.md` wasn't the right place for that. Backfilled it from
all 13 existing character entries: Runewick family, Daughtry family,
Vanderbuilt family, Cistern Monastery (affiliation, not blood), and an
"Unaffiliated" bucket for Corvin Drell (no stated family in source).
Carried forward the two open items already noted above: Aldren Runewick
has no page yet (listed in the Runewick group as a name only), and
Rune Thing™ is still deliberately unpaged. `index.md` now points to
`families.md` for relationship structure instead of duplicating it.

## 2026-10-15 — Ingest
Source: `Character/Rowan Mercer/Rowan Mercer.md` (new — no prior wiki
entry existed; confirmed via `git log -- Character/` that this was the
only new/changed source file since the last ingest, and that
`Campaigns/` and `DM/` are still empty, no session notes yet). Created
`rowan-mercer.md` (PC) plus three NPC entries and one new place: `mara-mercer`,
`garrick-vale`, `calder-holt`, and the wiki's first Places entry,
`bellweather.md` (Rowan's hometown). `garrick-vale.md` and `calder-holt.md`
are thin — source gives little beyond relationship and one or two traits;
flagging for expansion if more source material appears. Added the Mercer
family group to `families.md` (Mara, Rowan, and Edric Mercer as a name-only
member — same treatment as Aldren Runewick: mentioned only jointly with his
spouse, no individual characterization in source, so no page yet). Added
Garrick Vale and Calder Holt to the "Unaffiliated" bucket in `families.md`
(mentors/friends, no stated blood/household tie). Updated `index.md` with
all five new entries (Rowan Mercer under Player characters; Mara Mercer,
Garrick Vale, Calder Holt under NPCs; Bellweather under the now-populated
Places section).

## 2026-10-15 — Schema (minor)
Added an optional "## Art Reference" section (after Related) to
`naia-stillwater.md`, `tavian-runewick.md`, and `jaecron-daughtry.md`,
storing the Stable Diffusion prompts generated for each in this session so
they stay tied to the character they depict instead of living only in
chat history. These are clearly marked as generated/not campaign source
material, separate from each entry's `Source(s)` field. Flagged within
each: Naia's hair/eyes/height, Tavian's hair/eye/skin color, and
Jaecron's race/class entirely are unspecified in source — prompts were
written race/detail-neutral rather than inventing canon. Revisit and
tighten once any of these get settled at the table.

Added the same section to `rowan-mercer.md` as well — his source material
is unusually specific about physical appearance (build, brown hair,
stubble, exact gear), so that prompt could be written concrete rather
than left open like the others.

## 2026-10-15 — Query
Asked how Naia's Monk's Focus mechanic (Flurry of Blows, Patient/Focused
Patient Defense, Step of the Wind) could be played thematically in
combat. Answered from her character sheet mechanics plus her established
personality/backstory — connected the "Focus Point spent vs. not spent"
split to her core unresolved tension (trained discipline vs. the raw,
untrained thing that actually saved Coen during the flood, per Ithren's
"that wasn't your training, that was you" line). That connection wasn't
written down anywhere before, so filed it back into `naia-stillwater.md`
as a new "Combat flavor note" in Details, with concrete physical tells
(skin ripples, breathing rhythm) for narrating a Focus spend at the
table.
