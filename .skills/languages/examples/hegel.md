# Hegelian German — Register Reference & Enrichment Instructions

**Read this file completely before adding a single subordinate clause.**

Register: **dry, effusive-philosophical German in the manner of Hegel's
mature prose** — long nested periods, nominal style, bracketing
adverbials, triadic movements, and a cross-referencing web between
chapters. The technical meaning stays 100% accurate; the philosophy is
additive. This is the `content/de/` locale, and it is **enrichment, not
translation**: the language stays German; the *growth* is the task
(4–5× byte size per file).

---

## 1. What this register is — and is not

**Is:** German documentation whose prose has been dialectically inflated:
every intro, table preamble, gotcha and source list may be followed by a
philosophical commentary in 19th-century academic style. Services,
limits and auth flows serve as *occasions* (Anlässe) for the
reflections — never the other way round.

**Is not:** parody, fake scholarship, or decoration. Never paste actual
Hegel text wholesale. Never invent quotations with citation numbers
(Werke Bd. X, § Y). Never claim historical facts about providers that
contradict the docs. The tone is earnest, dry, slightly pedantic —
the humor, if any, is structural (a dialectic of cron jobs), never
jokey.

## 2. Quote discipline (Zitat-Zucht)

Only a small canon of **attested, famous formulae** may be invoked — and
always as motif, woven into one's own sentences, not as block quote:

| Formula | Source locus | Use in corpus |
|---|---|---|
| „Das Wahre ist das Ganze" | *Phänomenologie*, Vorrede | index epigraph; closing of vercel/TERRAFORM |
| Die Eule der Minerva beginnt ihren Flug mit der einbrechenden Dämmerung | *Grundlinien*, Vorrede | helpers.md (long version), vercel, index, supabase — max ~4× fleet-wide |
| „Das Bekannte … ist darum, weil es bekannt ist, nicht erkannt" | *Phänomenologie*, Vorrede | index, aws |
| Aufhebung (negieren / bewahren / emporheben) | *Wissenschaft der Logik* | modal (the negated-preserved-lifted server), huggingface |
| Herr und Knecht | *Phänomenologie*, IV | azure AKS: „die Control-Plane umsonst, die Knechte kosten"; OIDC |
| List der Vernunft | *Geschichte der Philosophie* | OIDC/machine auth: die Maschine erreicht durch Mittel, was der Wollende will |
| Maßverhältnis / Knotenlinie | *Logik* (Maß) | quota thresholds: quality turns into quantity turned border |
| „schlechte Unendlichkeit" | *Logik* | cloudflare table: the endless row vs. its bad infinite counterpart |
| Sein / Nichts / Werden | *Logik* | neon (Werden) vs. supabase (Sein) |
| Substanz vs. Subjekt | *Phänomenologie*, Vorrede | State-as-Subjekt discussions |

Rules: each formula appears at most a handful of times across the fleet;
when quoting verbatim, use German typographic quotes („…"); attribute
loosely („die Vorrede der *Phänomenologie*") — never precise § numbers,
never page numbers, never invented paraphrases presented as quotes.

**Forbidden:** anything from the *Enzyklopädie* you cannot reproduce from
memory with confidence; any "quote" you would have to fabricate; Hegel
biography anecdotes; quotes from other philosophers (Kant's island,
Fichte's I) — one school, one voice.

## 3. Syntax rules (the period)

1. **Length through nesting, not run-ons.** A period carries 2–5
   subordinate clauses, each closing before the frame closes. The frame:
   adverbial or object first, verb buried late (German bracketing does
   the work): „Die Frage nach dem Fundorte ist niemals bloß topisch;
   wer nach dem »Wo« fragt, hat schon gefragt, was das Gesuchte seinem
   Wesen nach sei, denn das Wesen muß, um gefunden zu werden, am Orte
   seiner Wahrheit stehen".
2. **Nominal style**: Substanz, Vermittlung, Unmittelbarkeit,
   Vorstellung, Begriff, Urteil, Schluß, Verzeichnis, Er-Innerung.
   Verbs are nominalized where possible; articles mark the concept:
   *der* Begriff, *die* Idee, *das* Wahre (capitalized as concept).
3. **Semicolon chains and dash parentheses**: `;` joins sister clauses,
   `—` inserts the afterthought or the correction: „(nicht gelöscht,
   nicht bezahlt — stillgestellt)".
4. **Triadic rhythm**: unmittelbar → vermittelt → aufgehoben;
   erstens … sodann … endlich; an sich → für sich → an und für sich.
   Deploy the triad visibly, once per major section at most.
5. **Reflexive constructions**: „es verhält sich so, daß …", „wobei es
   sein Bewußtsein über sich selbst bringt", „die Grenze, welche sich
   selbst setzt".
6. **The dry judgment**: close long flights with a short verdict:
   „eine Ansicht, welche tiefer ist, als sie nach technischer
   Notwendigkeit aussieht", „und der Rest ist Verkehr". Alternation of
   long and short IS the style; ten nested periods in a row exhaust
   the reader.
7. **Honest hedges**: „man hat dies genannt", „die Sammlung verzeichnet
   den Zustand und hält das Urteil zurück, wie es sich für Verzeichnisse
   gehört". Never modern hedging („eventuell", „eigentlich cool").

## 4. The conceptual lexicon (Begriffslexikon)

The corpus speaks its own dialect. Keep it consistent:

| German concept | Refers to |
|---|---|
| das Haus | the provider (AWS = das Haus des Credits, Azure = das der Frist, GCP = das des Ortes) |
| die Gnade / das Umsonst | the free tier |
| die Tafel | a (quota) table — „die Tafel sagt …" |
| der Kasten | the intro blockquote |
| die Lehre | a gotcha (each gotcha extension ends in a Lehre) |
| die Gabe / die Gaben | the free credits (Modal $30, Trigger.dev $5) |
| die Währung | usage-metered billing (Netlify, Vercel) |
| das Zeichen / der Ausweis | token / credential / key |
| das Schloß | the service being unlocked |
| die Er-Innerung | Terraform State (memory that IS the thing) |
| das Vergleichen / der Vollzug | `terraform plan` / `terraform apply` |
| die letzte Gewalt | `terraform destroy` |
| der Riegel | `prevent_destroy` / deletion protection |
| der Schlaf / der Winterschlaf | pausing/idling (Render 15 min, HF 48 h, Supabase 7 d, Neon scale-to-zero) |
| die Klausel | Vercel's non-commercial condition |
| die Stufen | auth maturity ladder: Person → Paar → Schnitt (scoped) → Stufe (OIDC/federated) → Bot |
| die stoppenden / die verrechnenden Häuser | hard-stop vs. overage-billing providers |
| die zwei Bücher | docs vs. pricing page contradicting each other (Trigger.dev concurrency) |
| der Rand | the edge (Cloudflare) |
| das Amt / die Bühne / die Werkstatt / das Auge / der Geist | Trigger.dev / Modal / CodeSandbox / Grafana / Huggingface |

New concepts must fit this declension of houses; coin sparingly
(„die Postkutsche der Zeitläufe" for ±59 min cron — once), then reuse
deliberately.

## 5. The motif system (Leitmotive across chapters)

The chapters refer to each other through recurring movements — this is
what makes the corpus a *system*, not 44 decorated files:

1. **Drei Zeitigkeiten** — Credits (AWS), Frist (Azure: 12 Monate), Ort
   (GCP: 3 Regionen). Every free tier is assigned its temporal mode.
2. **Schlaf-Typologie** — the pausing forms graded by depth.
3. **Die Postgres-Zwillinge** — Supabase = Sein (substance, 7-day
   pause), Neon = Werden (scale-to-zero, ephemeral branches).
4. **Örtlichkeit der Gnade** — GCP binds grace to regions; others give
   it everywhere.
5. **Form-Grenzen** — what IaC cannot set: Netlify site, CircleCI
   config.yml, Modal SDK, Redis prepayment, Render whole tier.
6. **Die Stufen der Anerkennung** — the auth ladder (§4), developed
   across all README chapters, culminating in the Bot and, one storey
   up, the agents (helpers.md).
7. **Verwerfende vs. verrechnende Häuser** — the two constitutions.

Rules: each new chapter must *place itself* in at least two motifs and
may reference others via relative links. Motifs are cited as known
things („die Sammlung hat oft gelehrt …") — the corpus is aware of
itself as a whole. Das Wahre ist das Ganze.

## 6. Growth rules

1. **Target: 4–5× original byte size** per file (prose alone grows
   5–7×; tables and code cannot grow, so files with heavy tables land
   at ~3.2–3.6× — that is acceptable, document it in the report).
2. **Never shrink or replace information.** Every original sentence
   survives byte-identically; growth is strictly additive paragraphs.
3. **Every file ends with `## Vermittelte Verhältnisse`** — a closing
   section (5–15 lines) that links the file's three documents
   (FREE-TIER = the contingent/quota side, README = recognition/signs,
   TERRAFORM = the concept) and at least 2–3 sibling chapters,
   circular links explicitly welcome when context fits.
4. Growth locations, in order of value: after the intro blockquote
   (constitution of the house), after each table (reading the table
   dialectically, row group by row group — WITHOUT touching rows),
   after each gotcha (the Lehre), after the source list (Quellenkunde),
   and the closing Vermittelte Verhältnisse.

## 7. Where philosophy goes — and where it never goes

**Yes:** new paragraphs between preserved elements; gotcha continuations
(the numbered gotcha text stays byte-identical, the commentary follows
as a plain continuation paragraph in the same list item); descriptions
around tables; the closing section.

**Never (byte-exact zones):**
- Frontmatter (keys AND values)
- H1 headings and all preserved heading texts
- The intro blockquote (`>`) of each file
- Every table row, every quota/price/date cell
- Code fences (comments too — leave them, simpler and safer)
- Links — targets byte-identical; link *text* may not change either
  (they are part of preserved sentences)
- Numbers, units, plan names, service names, SKUs, region codes

## 8. Number policy

- Original Arabic numerals: never touched, never reformatted.
- **New prose spells numbers as German words**: „fünf Dollar",
  „hundert Gigabyte", „fünfzehnhundert Rufe die Minute",
  „zwanzig Zeichen". This keeps new prose out of the number-integrity
  check entirely (the baseline Counter must find every original numeric
  token unchanged — new tokens are allowed but discouraged).
- Arabic numerals in new prose ONLY when re-quoting a value already
  printed in the adjacent preserved line (e.g. „die ±59 Minuten"),
  never with new magnitudes.

## 9. Orthography

- New prose uses **classic pre-1996 forms**: `daß`, `muß`, `verläßlich`,
  `Kreisende`… (corpus: 135× `daß`, 60× `muß` against only 7 inherited
  `muss` in preserved text — never "fix" preserved text to match).
- Quotes: „…", single ‚…' inside; no straight quotes in new prose.
- Em dash `—` (spaced), ellipsis `…`, never `...`.
- No English words in new prose (tech terms per SKILL.md §4 stay
  Latin). No emoji. No exclamation marks except in quoted speech.

## 10. Artifact discipline (real failure modes)

Long German periods typed at speed produce characteristic slips. Every
file gets a glyph/scan pass before verification:

- **Foreign glyphs**: CJK (这两, 问答), Cyrillic (Уже, современное) —
  window-switching artifacts. Scan with the whitelist script.
- **Glued words**: `einesganzen`, `seineAntipoden`, `alsStrafe` —
  always at line-wrap points; proof every wrap.
- **English fragments**: `following`, `only`, `self-gesetzt`.
- **Underscore slips**: `alle_provider` (markdown emphasis bleeding).
- **Table mutations**: a duplicated row, a dropped row, a rewritten
  quota cell — the most dangerous class; only the literal table-row
  check catches them (see §11).
- **URL damage**: dropped `/docs`, `access-policies` pluralized —
  caught by the link-set check against baseline.
- **Dropped short lines**: a footnote like „1 CU ≈ 4 GB RAM …" that the
  eye skips — caught by the number Counter.

Fix via python exact-substring replaces (with content asserts), never
sed; re-run the scan after fixing.

## 11. Verification recipes

Capture **before** editing (the original tree is still in
`docs-site/src/content/docs/de/` until the next sync — that un-synced
copy is the baseline witness):

```python
# Baseline per file: links set, fence MD5s, number Counter
links  = set of markdown targets + bare URLs
fences = [md5(f) for f in re.findall(r'```.*?```', text, re.S)]
numbers = collections.Counter(re.findall(r'\d[\d.,]*', text))
```

After each file (and again globally after the fleet):

1. **Glyph scan** — whitelist scanner over the file → expect „ALLE REIN"
   (whitelist: original emojis + `≈×àéêîôûçñÈ≠±`).
2. **Fences** — MD5 list identical to baseline.
3. **Links** — every baseline link present (compare rstrip'd of `>`).
4. **Numbers** — `Counter(baseline) - Counter(new)` must be empty.
5. **Table rows** — every line starting with `|` in the ORIGINAL must
   occur literally in the new file (catches mutations, not just loss).
6. **Ratio** — bytes new / bytes original; flag < 3.0 and pad prose.
7. Fleet-wide: sync (`node scripts/sync-content.mjs` — it rewrites the
   relative .md links in Vermittelte Verhältnisse to slug URLs) +
   `npx astro build`, then: 0 broken internal links in `dist/de/`,
   motif markers present (Eule, Aufhebung, Vermittelte Verhältnisse ×44),
   word count sanity.

## 12. Workflow per file

1. Read the original **completely** (all lines to EOF — truncated `cat`
   output once cost a lost Gotcha; and beware: `cat` occasionally showed
   *phantom* duplicated lines that were NOT in the file — when in doubt,
   trust the fence baseline, not the phantom).
2. Write the new file in one `write` call: preserved elements first
   (they are sacred), then grow prose around them per §6.
3. Scan (glyphs), fix artifacts (python replaces + asserts).
4. Verify fences/links/numbers/tables against baseline (§11).
5. Log the ratio; move on. One file per tool call; never batch two
   files into one edit.

## 13. Final bar (Abnahme)

A file is done when: every original byte survives, the prose has grown
into the dialect (lexicon §4, motifs §5, syntax §3), each gotcha
teaches its Lehre, the sources have their Quellenkunde, the file closes
with Vermittelte Verhältnisse linking at least three siblings, the
glyphs are rein, and the reader — after three paragraphs — has
forgotten that this is a cloud billing document, which is precisely
the moment they learn what the free tier *ist*.

*Die Eule der Minerva beginnt erst mit der einbrechenden Dämmerung
ihren Flug — und die Dämmerung über den Kontingenten der Wolken ist,
wie dies Werk zeigt, reich genug an Licht für einen langen Flug.*
