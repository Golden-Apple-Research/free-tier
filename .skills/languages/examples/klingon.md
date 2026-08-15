# tlhIngan Hol — Klingon Reference & Translation Instructions

**Read this file completely before writing a single Klingon sentence.**

Register: **REAL grammatical tlhIngan Hol in a warrior's voice.** Never
English-with-flavor-words. Never invented vocabulary. English appears only as
loanwords for tech/brand terms. German never.

---

## 1. Identity rules

1. Every prose sentence is grammatical Klingon: OVS order, correct verb prefixes,
   canonical suffixes, attested vocabulary.
2. **Only attested words** (TKD / KLI / klingonska.org canon / tlhingan.org).
   If a word is not attested, either rephrase or use a loanword — never invent.
   See §10 (forbidden) and §11 (loanword policy).
3. Warrior tone: `Qapla'!`, `yIqIm!`, `batlh`, `quv`, `'Iw HIq`, `may'`, `jagh`,
   `SuvwI'` — used naturally, not sprinkled onto English syntax.
4. Docs stay scannable: tables stay tables, bold limits stay bold, numbers stay
   precise (see §5 for which numbers become words).

## 2. Orthography

- Latin transcription (Okranian). **Case matters**: `D`, `S`, `H`, `Q`, `gh`,
  `ng`, `tlh`, `ch` are distinct letters. `q` ≠ `Q`, `S` ≠ `s`.
- **The apostrophe `'` is a letter** (glottal stop): `Qu'` (mission) is not `Qu`.
  Never drop it, never "fix" it to a quote character in source files.
- Common pitfalls: `'e'` (topic) vs `'e'` (them) — context decides; `-Daq` is one
  suffix; `tlhob` (request/ask) vs `tlhobneS` — stay simple.

## 3. Core grammar

### 3.1 Word order: Object–Verb–Subject (OVS)

```
Huch nob provider.            provider gives credits
|object|verb|subject|

'Iw HIq tlhutlh SuvwI'.       The warrior drinks blood wine.
mev build.                    The build stops. (no object)
```

Loanword nouns slot in normally: `account taH, Huchmey standard` — the account
continues, standard charges.

### 3.2 Verb prefixes (subject → object)

| | no object | → it/them |
|---|---|---|
| I | jI- | vI- |
| you (sg) | bI- | Da- |
| we | ma- | wI- |
| you (pl) | Su- | bo- |
| they | ∅ / -lu' | lu- |
| it → me/you/us | — | mu- / Du- / nu- ; qa- = you→me |

Examples from the corpus: `credentials DaHev` (you receive the credentials),
`nobmey luleghlaH SuvwI'pu'` (warriors can see the gifts).

### 3.3 Indefinite/passive `-lu'` — USE OFTEN for docs

`X lo'lu'` (X is used), `chenmoHlu'` (is created), `QIHlu'` (is destroyed),
`ra'lu'` (is managed), `Hevlu'` (is received), `ngeHlu'` (is sent),
`noblu'` (is given), `integrate-lu'` (is integrated).

### 3.4 Verb suffixes used in this corpus

`-laH` (can) · `-be'` (not) · `-Ha'` (undo/wrongly) · `-Qo'` (don't! with
imperative) · `-taH` (ongoing) · `-pu'` (perfective) · `-choH` (change of state)
· `-qa'` (again) · `-chu'` (clearly/completely) · `-lu'` (indefinite) ·
`-moH` (cause) · `-vIp` (afraid to — used in `Version yIpin` jokes only) ·
Type 9: `-DI'` (when) · `-chugh` (if) · `-pa'` (before) · `-mo'` (because) ·
`-meH` (in order to) · `-bogh` (relative clause) · `-'a'` (question).

### 3.5 Noun suffixes

`-Daq` (at/on/in) · `-vo'` (from) · `-vaD` (for/beneficiary) · `-mey` (plural
things) / `-pu'` (plural beings) / `-'a'` (augmentative) · `-vam`/`-vetlh`
(this/that) · possessives `-wIj/-wI'` (my), `-lIj/-lI'` (your), `-Daj` (his/her/
its), `-maj` (our), `-chaj` (their).

Possessives translate "own": `budget-Daj` (its own budget), `hardware-lIj`
(your own hardware), `Google-clients-chaj` (their own Google clients).

### 3.6 Imperatives (yI- for you-sg)

`yIlo'` (use it!) · `yIlo'Qo'` (don't use it!) · `yIchenmoH` (create!) ·
`yIQIH` (destroy!) · `yIqet` (run it!) · `yIlaD` (read it!) · `yIwIv` (choose!)
· `yIqan` (guard!) · `yIlegh` (look!) · `yIqIm!` (pay attention! — warnings)
· `yIexport` / `yIpin` (pin the version!) · `yIqel` (consider).

### 3.7 Existence & predicates (the docs workhorses)

| Meaning | Pattern | Corpus example |
|---|---|---|
| there is X | `X tu'lu'` | `vaghvatlh builds/jar tu'lu'` |
| X doesn't exist | `X tu'lu'be'` | `ghom-collaboration tu'lu'be'` |
| X is required | `X 'ut` | `billing-account 'ut` |
| X not required | `X 'utbe'` | `credit-card 'utbe'` |
| X lacks Y | `Y Hutlh X` | `Huch Hutlh nob` (the gift lacks money → free) |
| X has Y | `Y ghaj X` | `billing-account ghajbogh Qu'` |
| X suffices | `X yap` | `wa'vatlh CU-h yap` |
| X continues | `X taH` | `account taH` |
| X stops/expires | `X mev` | `mev build` |
| X changes | `X choH` | `schema choHlaH` |
| X resembles Y | `Y rur X` | `plaintext-bindings rur peghmey` |

### 3.8 Connectives & scope words

`'ej` (and, joins sentences) · `'ach` (but) · `pagh` (or / zero!) · `vaj`
(therefore) · `ghIq` (then/next) · `DaH` (now) · `reH` (always) · `reHbe'`
(never) · `Hoch` (all/every) · `law'` (many) · `puS` (few) · `'op` (some) ·
`latlh` (other) · `rap` (be the same) · `neH` (only — AFTER its noun) ·
`je` (also — AFTER its noun) · `nIteb` (alone/by itself; also "standalone").

Never mix these into English word order: `X neH` = "only X", not `neH X`.

## 4. Numbers — placement rules (canon TKD 5.2)

**This tripped us once; the rules are strict:**

1. **Counting** (how many): number **before** the noun; plural suffix optional
   and then usually omitted.
   - `loS puq` — four children · `vaghmaH yuQ` — fifty planets
   - Corpus: `HutmaH jaj` (90 days), `cha' Qu'` (2 projects), `wa' build`
     (one build), `vagh lo'wI'` (5 users), `wa'vatlh containers` (100 containers).
2. **Numbering/labeling** (which one, "No. X"): number **after** the noun.
   - `DuS wa'` — torpedo tube number one
   - Corpus: `Gotcha 5`, `Qu' wej-Daq` ("at project 3" = numbering!), `rep wej-Daq`
     (at hour 3 = 3 AM), `phase 2`, `example 4`.
3. **Ordinals** `-DIch`: follow the noun. `paw meb wa'DIch` (the first guest
   arrives). Corpus: `wa'DIch query` (the first query), `Qu' cha'DIch` (the
   second project).
4. `Hoch`, `'op`, `bID` (half) behave number-like: `Hoch account vaD` (for every
   account), `'op poH 10` (some periods of 10).

### 4.1 Number words

`pagh` 0 · `wa'` 1 · `cha'` 2 · `wej` 3 · `loS` 4 · `vagh` 5 · `jav` 6 ·
`Soch` 7 · `chorgh` 8 · `Hut` 9

Forming higher numbers, units→largest as separate words:
`-maH` ×10 · `-vatlh` ×100 · `SaD` 1000 (variant `SanID`) · `netlh` 10 000 ·
`bIp` 100 000 · `'uy'` million · `vatlhbIp` 10M.

- 20 → `cha'maH` · 50 → `vaghmaH` · 100 → `wa'vatlh` · 234 → `cha'vatlh wejmaH loS` (TKD example)
- K/M shorthand mapping used in this project:
  `1K→wa'SaD` · `2K→cha'SaD` · `10K→wa'netlh` · `20K→cha'netlh` · `30K→wejnetlh`
  · `50K→vaghnetlh` · `100K→wa'bIp` · `400K→loSbIp` · `500K→vaghbIp`
  · `180K→wa'bIp Sochnetlh` · `360K→wejbIp javnetlh`
  · `1M→wa'maH bIp` ⚠ · `2M→cha'maH bIp` ⚠ · `5M→vagh'uy'` · `10M→vatlhbIp`.

⚠ **Smartypants collision** (Astro/Starlight): `wa''uy'` (double apostrophe)
renders as a broken quote pair — always write **`wa'maH bIp`** (10×100,000)
instead. Single-apostrophe forms (`vagh'uy'`) are safe.

Repetition: `-logh` (times): `wa'logh` (once), `cha'logh` (twice), `'oplogh`
(several times). Ordinal-for-unknown `n-th` = `'opDIch`; infinity = `'ejyaH`.

### 4.2 Units of time

`lup` second · `tup` minute · `rep` hour · `jaj` day · `Hogh` week · `jar`
month · `DIS` year · `poH` period of time · `vatlhvI'` percent.

Duration compounds: `wejmaH jaj` (30 days), `HutmaH jaj` (90 days), `Soch jaj`
(7 days), `wa'maH cha' jar` (12 months), `wa' Hogh` (one week — counting:
number first!), `Sochvatlh wejmaH vagh rep` (750 hours), `javSaD tup`
(6,000 minutes).

### 4.3 What stays Arabic (never convert)

Money (`$300`, `~1.5% + €0.25`) · dates/years (`August 2026`, `2025/2026`) ·
versions (`0.x`, `v4→v5`, `TLS 1.3`, `Postgres 16`) · ports (`5432`, `25/465/587`)
· HTTP codes (`403`, `9109`) · SKU/product identifiers (`B1S`, `F1`,
`general1.small`, `RTX Pro 6000`, `db.t3.micro`) · decimals (`0.5 GB`, `2.5M`)
· `24/7` · clock times (`00:00 UTC`) · any number ≥ ~4 morphemes (`744`) ·
ASCII diagrams inside code fences (byte-identical!).

## 5. Time & logic connectors

| English | Klingon | Example |
|---|---|---|
| per month | `Hoch jar` | `wejvatlh Huch Hoch jar` |
| per project | `Qu' wa'-Daq` / `wa' Qu'-Daq` | `limits — Qu' wa'-Daq` |
| during X | `X qaStaHvIS` | `trial qaStaHvIS` |
| simultaneously | `wa' poH qaStaHvIS` | `wejmaH jobs, wa' poH qaStaHvIS` |
| after X | `X qaSpu'DI'` | `wejmaH jaj qaSpu'DI' mev` |
| before X | `X qaSpa'` | `upgrade qaSpa'` |
| when X | `X -DI'` | `lo'be'taHvIS` (while unused) |
| if X | `X -chugh` | `Huch lo'chu'pu'chugh` |
| because X | `X -mo'` | |
| instead of X | `X Hutlh` / `latlh` | |
| up to X | loanword `up to` or `X yap` | `up to wa'vatlh` |
| as of Aug 2026 | `August 2026` | keep date |

## 6. Tech-translation phrasebook (corpus-verified)

| English | tlhIngan Hol | Notes |
|---|---|---|
| free (no cost) | `Huch Hutlh` | "lacks money" |
| Always Free | `reH Huch Hutlh` | |
| free tier | `tier Huch Hutlh` / Free Tier | loanword ok in titles |
| quota/allowance | `nob`, pl. `nobmey` | "gift" |
| credits/money/billing | `Huch`, pl. `Huchmey` | |
| cost control | `Huch-ra'` | |
| project/job/task | `Qu'` | one word, all three |
| data | `De'` | |
| request | `tlhob`, pl. `tlhobmey` | |
| user | `lo'wI'`, pl. `lo'wI'pu'` | |
| secret | `pegh`, pl. `peghmey` | |
| account | **account** (loanword) | `jonaS` FORBIDDEN §10 |
| active | **active** (loanword) | `wutlh` FORBIDDEN §10 |
| option/setting | `DuH`, pl. `DuHmey` | Maltz 2018: software options |
| team (people) | `ghom` | pl. `ghommey`; compounds: `ghom-members` |
| deploy | **deploy** (loanword) | never `qIH`! |
| run/start | `qet` | restart `qetqa'` |
| freeze (state) | `taD` | "frozen"; never `qey`! |
| destroy/delete | `QIH` | ONLY destroy/delete/expire |
| create | `chenmoH` | |
| pause | `mev` | |
| reset | `choHqa'` | |
| update/change | `choH` | |
| read / write | `laD` / `qon` | read-only `laD-neH` |
| old / new | `ngo'` / `chu'` | |
| first / last | `wa'DIch` / `Qav` | |
| high / strong | `Dung` / `HoS` | |
| help | `QaH` | |
| see (a doc) | `yIlaD` | "(see X)" → "(X yIlaD)" |
| Gotcha(s) | **Gotcha(s)** (loanword) | `mIQ` FORBIDDEN §10 |
| login/connect | `jol` | |
| managed | `ra'lu'` | "one commands it" |
| serverless | `server Hutlh` | |
| self-hosted | `hardware-lIj-Daq qet` | |
| automatically | `nIteb` | |
| shared | shared (loanword) | no attested word |
| permanent | permanent (loanword) | |
| copy-on-write | copy-on-write | |
| real | real (loanword) | `ngo'` ≠ real! |

## 7. Warrior voice — idioms that earned their place

- `Qapla'!` — success! (section endings, achievements)
- `yIqIm!` — pay attention! (⚠ warnings, gotcha intros)
- `batlh` honor · `quv` glory · `may'` battle · `jagh` enemy · `SuvwI'` warrior
- `'Iw HIq` blood wine · `nuH` weapon · `'etlh` sword · `qul` fire
- `Heghlu'meH QaQ jajvam` — today is a good day to die (sparingly!)
- `tlhIngan wo'` Klingon Empire · `qeylIS` Kahless

## 8. Worked examples (from the production corpus)

Each line: Klingon → literal gloss → meaning.

1. `Huch nob provider.`
   credits gives provider → The provider grants credits.
2. `Sochvatlh wejmaH vagh rep/Hoch jar — Huch Hutlh.`
   750 hours per month — free of charge.
3. `wejmaH jaj qaSpu'DI' QIHlu' (wa'maH loS jaj grace).`
   When 30 days have passed it is destroyed (14 days grace).
4. `yIqIm: cha' Qu' neH — Hoch org.`
   Attention: only two projects — per organization.
5. `Qu' — Soch jaj lo'be'taHvIS, mev.`
   Project: when unused for seven days, it pauses.
6. `peghmey — plaintext-bindings rur; state-Daq tu'lu'.`
   Secrets resemble plaintext bindings; they live in the state.
7. `wa' build — wa' poH qaStaHvIS — neH.`
   Only one build at a time.
8. `account yIchenmoH; credit-card 'utbe'.`
   Create an account; no credit card required.
9. `Free-Plan-Daq wej workspace-seats tu'lu'.`
   The Free Plan has three workspace seats.
10. `Huch Hutlh nobmey, Terraform-Support 'ej Auth — wa'maH jav cloud 'ej SaaS services. August 2026.`
    (site og:description) Free-tier gifts, Terraform support and auth — 16 cloud
    and SaaS services. August 2026.
11. `tlhobmey driven, qet 'ej pagh-Daq scale.`
    Request-driven: runs and scales to zero.
12. Code comment: `free_tier_enabled = true # wa'SaD RU/s + cha'maH vagh GB reH — wa' subscription-Daq wa' neH!`
    (1000 RU/s + 25 GB always — only one per subscription!)

Anti-example (what got fixed in review):
- ❌ `jonaS chenmoH` → ✅ `account yIchenmoH` (jonaS was fabricated)
- ❌ `QIH service` for "deploy the service" → ✅ `deploy service` / `service qet`
- ❌ `jaj HutmaH` (90 days) → ✅ `HutmaH jaj` (counting = number FIRST)
- ❌ `Qu' cha'` (2 projects) → ✅ `cha' Qu'` — but keep `Qu' wej-Daq`
  ("at project № 3", numbering = number AFTER)

## 9. Markdown, code, links

Follow the parent [SKILL.md](../SKILL.md) invariants. Klingon specifics:

- Frontmatter `title`/`description` in Klingon; keep dates (`August 2026`).
- Code comments may be Klingon — keep the code around them byte-identical:
  `repo = "me/app" # TF-user-account-Daq tu'lu' 'ut`
- Section headings can be loanwords when they are product terms
  (`## DuH 2: Python-SDK as IaC (QaQ way)`), but gotcha sections are
  `## Gotchas` (the German originals say "Gotchas").
- `(see X)` → `(X yIlaD)`. `Option A/B/C` → `DuH A/B/C` (also in code comments).

## 10. FORBIDDEN — verified wrong (never reintroduce)

| Forbidden | Looks like | Actually means | Use instead |
|---|---|---|---|
| `jonaS` | "account" | **nothing — fabricated** | `account` |
| `wutlh` | "active" | **underground** (KLI) | `active` |
| `qey` | "freeze" | **in vain/futile** (TKD) | `taD` / `mev` |
| `QIH` as deploy | "launch" | **destroy/damage** | `deploy` / `qet` |
| `SoQ`/`SoQmoH` | "signup" | **speech/address** | `account yIchenmoH` |
| `mIQ`/`mIQmey` | "gotcha(s)" | **roast/fry** | `Gotcha(s)` |
| `wa'SanID` | 1000 | nonstandard here | `wa'SaD` (or `SanID` dialect, but stay consistent) |
| `ngo'` as "real" | "real" | **old** | `real` loanword |

## 11. Loanword policy

Keep as-is (no attested Klingon exists): `via`, `up to`, `real`, `really`,
`deploy`, `login`, `standard`, `official`, `example`, `community`, `budget`,
`value`, `storage`, `limit`, `token`, `state`, `workspace`, `instance`,
`backend`, `container`, `scope`, `suite`, `build`, `plan`, `tier`, `region`,
`service`, `provider`, `endpoint`, `backup`, `dashboard`, `scope`, `sandbox`,
`repo`, `image`, `registry`, `session`, `wizard`, `catalog`, `managed`,
`shared`, `permanent`, `customer`, `copy-on-write`, plus every brand name.

Loanwords take Klingon affixes freely: `account-Daq`, `buildmey`, `TF-Daq`,
`Free-Plan-Daq`, `yIexport`, `deploy-lu'`.

## 12. Verification checklist (run after every pass)

```
# German residue → 0
grep -rniE '[äöüÄÖÜß]' content/tlh/ --include="*.md"
# Forbidden words → 0
grep -rn "jonaS\|wutlh\|\bqey\b\|mIQ\|SanID\|''uy'" content/tlh/ --include="*.md"
# Wrong number order spot-checks: "jaj HutmaH|Qu' cha' |lo'wI'pu' vagh" → 0
# Structure parity vs content/de/ (file + heading counts)
# Rendered: fallback banners → 0; <main> umlaut-free (minus theme UI strings);
#           term counts stable (e.g. wa'vatlh, Huch Hutlh, Gotchas, Sochvatlh wejmaH vagh)
```

Update this file whenever a new word is verified or a new mistake is caught —
this file is the living style guide for the Klingon locale.

## 13. Sources (verify against these, in order)

1. TKD — The Klingon Dictionary (Okrand): canonical grammar + suffixes;
   full text mirror: https://klingonska.org/canon/1992-01-01-tkd.txt
2. klingonska.org numbers reference: https://klingonska.org/ref/num.html
3. tlhingan.org dictionary (numbers: https://tlhingan.org/dictionary/type/number;
   number grammar: https://tlhingan.org/grammar/usingnumbers)
4. KLI mailing-list archive (usage debates, Maltz/Okrand rulings):
   https://www.kli.org/tlhIngan-Hol/
5. Hol 'ampaS: https://hol.kag.org/page/Numbers.html
6. Maltz 2018 (via KLI): `DuH` = option, incl. software settings.

**yIqIm! reH Huch Hutlh yIwIv. batlh, quv, 'ej Qapla'!**
(Pay attention! Always choose the free tier. Honor, glory — and success!)
