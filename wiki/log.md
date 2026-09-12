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
