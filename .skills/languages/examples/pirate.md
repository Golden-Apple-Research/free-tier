# Pirate English — Register Reference & Enrichment Instructions

**Read this file completely before touchin' a single line o' pirate prose.**

Register: **English as spoken on the high seas** — full pirate speak, not just
a few "Arr!" sprinkles. The technical meaning stays 100% accurate; the flavor
is additive. This is the `content/en/` locale.

---

## 1. Identity rules

1. Base is correct technical English; pirate dialect is applied on top:
   `me` (my), `ye` (you), `fer` (for), `o'` (of), `an'` (and), `be` (is/are),
   `yer` (your), `-in'` (-ing), `what` (who/which), `aye` (yes), `nay` (no).
2. **Technical precision always wins.** Quota numbers, service names, command
   names, plan names (Free Plan, Always Free, Hobby, Pro), product identifiers
   stay exact. If flavor would blur meaning, belay the flavor.
3. Code blocks, links, tables' quota columns: byte-identical (comments inside
   code may carry pirate flavor).
4. Growth welcome: prose sections may grow ~15–30% per pass. Never shrink
   information.

## 2. Slang glossary (use with variety, not monotony)

| Category | Terms |
|---|---|
| Money | doubloons, pieces o' eight, ducats, gold, coin |
| Free stuff | booty, loot, plunder, swag, prize, bounty, treasure chest |
| People | me hearty, matey, bucko, sea dog, old salt, scallywag, landlubber, powder monkey |
| Enemies/danger | the kraken (surprise bill), scurvy dog, hornswoggler, bilge rat |
| Actions | hornswoggle (cheat), keelhaul, walk the plank, batten down the hatches, run a rig, splice the mainbrace, weigh anchor, set sail |
| Places | Davy Jones' locker (where deleted data sleeps), the briny deep, dry dock, crow's nest, cargo hold, ship's log |
| Exclamations | Arrr! / Rrr! / Yarr!, Shiver me timbers!, Avast!, Blimey!, Belay that!, Ahoy! |
| Ships | ghost ship (vanishing resource), flagship, galleon, sloop, man-o'-war |
| Drink | grog (the Free Plan), fine rum (the paid stuff) |

## 3. Core themes (rotate; never hammer one theme)

1. **The Creed — "Take all, give naught back!"** — the free tier as the
   privateer's code: sail in, load the hold, pay nothin'. Use at most a
   handful o' times across the fleet.
2. **Profittin' from the Crown** — AWS, Azure an' GCP be the three great
   *royal navies* (the Crown). We privateers sail with letters o' marque
   (their own Terms o' Service!) an' legally plunder His Majesty's
   warehouses. A free-tier user is a *privateer*, not a common thief — the
   Crown itself invited us.
3. **Peg-leg lore** — the wooden leg as runnin' gag: every peg leg in these
   waters were paid fer by some billing surprise ("this leg? DynamoDB
   on-demand throughput, 2019"). `timber toe`, `peg leg`, `the leg what
   the kraken took`.
4. **Buccaneer tales (anecdotes)** — short *Cap'n's log* or *old salt's
   tale* blockquotes: legendary heists (Blackbeard's 750 hours, Anne
   Bonny's cron job, the Saga o' the Forgotten Idle Instance), famous
   last words before surprise bills, parrot-assisted debuggin'.
5. **Dead men tell no tales** — deleted accounts leave no invoices.
   *No prey, no pay* — without the free tier there be no voyage at all.
6. **Parrot on the shoulder** — the parrot as first mate / rubber duck:
   `me parrot squawked the answer before the docs did`.

## 4. Anecdote format

Blockquote, 2–4 lines, italic marker, always tied to the section's topic —
never pure decoration, always a moral about billing/gotchas/auth:

> *Old salt's tale:* Anne Bonny once left an idle EC2 instance ridin' at
> anchor fer three moons. The kraken came fer her doubloons at month's end.
> Batten down the hatches: set a billing alarm, or lose a leg like she did.

Rules: max 2 anecdotes per file; no links inside anecdotes; no code inside;
facts stay obviously fictional-legendary (no invented real-world claims
about providers' behavior that contradict the docs).

## 5. Where flavor goes (and where it doesn't)

**Yes:** intro paragraphs, section intros, list lead-ins, gotcha
preambles, table *description* columns (light touch), transitions,
warnings (as pirate metaphor), closing lines.

**No:** quota columns, price figures, dates, service/product identifiers,
API names, Terraform resource names, link targets, code, frontmatter keys.
Keep tables scannable — flavor in tables goes at the end o' a description
cell, never in front o' the facts.

## 6. Verification checklist

```
# Links unchanged vs baseline snapshot (count + targets)
# Code fences unchanged (hash comparison)
# Quota numbers unchanged: diff the numeric tokens per file vs baseline
# Slang density sanity: each theme ≤ ~8 hits fleet-wide, no copy-paste anecdotes
# Meaning preserved: spot-check each gotcha/limit still states the same fact
```

Then sync + build, an' splice the mainbrace.

**Fair winds, followin' seas, an' may the Crown's coffers never run dry. Arrr!**
