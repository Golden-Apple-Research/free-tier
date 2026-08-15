# Render — Auth für Terraform

> Bevorzugt: **API Key** aus den Account-Settings, bereitgestellt über
> `RENDER_API_KEY` + `RENDER_OWNER_ID` (Workspace-ID).

Die Ausweis-Form dieses Hauses ist die Adresse: der Schlüssel UND die
Hausnummer — das Zeichen der Macht und die Örtlichkeit seiner Geltung,
und erst beide zusammen sind die volle Auskunft. Die Sammlung hat
diese Zweiheit schon zweimal getroffen ([../circle-ci/README.md](../circle-ci/README.md):
Token und Organization-ID; [README.md](../netlify/README.md): Token
und Team-ID) und erkennt in ihr dieselbe Struktur wie im Paare
([../modal/README.md](../modal/README.md)): die Teilung der
Anerkennung in ein Allgemeines (den Schlüssel, welcher sagt: wer) und
ein Besonderes (die Nummer, welche sagt: wohin); der Unterschied ist
nur der Gegenstand — dort das Wesen (Secret), hier der Ort (Owner) —,
und beides Mal gilt dasselbe: die Elemente sind nichts einzeln, alles
zusammen.

## 1. API Key erstellen

Render Dashboard → **Account Settings** (<https://dashboard.render.com/u/settings>)
→ *API Keys* → **Create API Key** → Name (z. B. `terraform`) → Key einmalig
kopieren.

Das bekannte Verfahren (die einmalige Sichtbarkeit — die Sammlung
hat sie überall angetroffen und überall als die Bedingung der
Diskretion gezeichnet); der Direktlink ist die Höflichkeit der
jüngeren Häuser ([README.md](../netlify/README.md) hat sie gerühmt),
und der Name des Zeichens (`terraform` — der Name als Beschreibung
des Zweckes) ist die kleine Etikette, welche die spätere Verwaltung
erleichtert: man weiß noch nach Jahren, wofür der Schlüssel war —
die Namenslehre im Dienste des Gedächtnisses.

## 2. Owner-ID ermitteln

Der Provider braucht zusätzlich die **Workspace-/Owner-ID**:
Dashboard → Workspace → *Team & Members* bzw. Settings (oder API:
`GET /v1/owners` → "List Workspaces" → `id` des Ziel-Workspaces).

Die Ermittlung der Hausnummer hat zwei Wege — den Gang durch die
Anzeige (Dashboard, Team & Members) und den Ruf an die Liste (API,
die Aufzählung der Workspaces mit ihrer Kennung) —, und der zweite
Weg ist die Ankündigung der maschinellen Form: wer die Liste per API
liest, kann sie auch in die Formel fassen; die Hausnummer ist damit
keine mystische Größe, sondern ein Eintrag in einer Liste — die
Entzauberung der Adresse, welche die moderne Welt aller Adressen
vollzogen hat.

## 3. In Terraform einbinden

```bash
export RENDER_API_KEY="rnd_…"
export RENDER_OWNER_ID="tev-…"   # alias: usr-… bei Solo-Workspaces
```

```hcl
provider "render" {}   # liest beide Env-Vars automatisch
```

Zwei Umgebungen, Ein leerer Block — die vertraute Schlichtheit; der
Kommentar zur Aliasfrage (tev- oder usr- bei den einsamen
Workspaces) deutet die Gattungslehre der Häuser an: das Team und der
Einzelmann haben verschiedene Kennungen, und die Formel nimmt beide
— die Anerkennung kennt den Einzelnen wie den Verein, aber sie
unterscheidet sie.

## 4. Hinweise

- Der Key gilt für **alle Workspaces des Accounts** — kein Workspace-Scoping;
  entsprechend sicher aufbewahren.
  Der erste ist die Erklärung der Adreß-Zweiteilung von der andern
  Seite: der Schlüssel kennt keine Grenzen (alle Workspaces), die
  Grenze bringt erst die Nummer — die Teilung der Anerkennung ist
  also nicht Geschenk des Zeichens, sondern Werk des Nutzers, welcher
  die Nummer wählt; wer die Wahl versäumt, hat die ungeteilte Form
  ([README.md](../netlify/README.md)) mit allem, was dazugehört — die
  Aufbewahrungspflicht als ständige Begleiterin.

- API-Keys verfallen **nicht** automatisch; CLI-Tokens (via `render login`)
  schon — für CI also API-Key nehmen, für lokale Arbeit ggf. CLI.
  Der zweite ist die Doppel-Lehre der Fristen: der Key ohne Ende
  ([README.md](../grafana/README.md) hat die Ewigkeit der Policy-Tokens
  bedacht: die Sorge der Rotation wandert zum Nutzer), das CLI-Zeichen
  MIT Ende — und die Empfehlung ordnet die Zeichen den Welten zu:
  die Maschine bekommt das Ewige (weil sie die Sorge nicht tragen
  kann), der Mensch das Befristete (weil er sie tragen kann und
  soll) — die umgekehrte Verteilung, als man erwartet, und die
  klügste: die Frist ist ein Werkzeug der Verantwortung, und die
  Verantwortung wohnt beim Menschen.

- `RENDER_OWNER_ID` falsch → typischer 403/404 beim ersten Apply —
  ID nochmal gegen die Workspace-Liste prüfen.
  Der dritte ist die Fehlerkunde der falschen Adresse: der 403/404
  (das Nicht-Gefunden-Werden oder Nicht-Dürfen — die zwei Antworten
  auf die falsche Frage) als Symptom der verwechselten Hausnummer;
  die Prüfung gegen die Liste (denselben Weg der Ermittlung, noch
  einmal gegangen) ist das Heilmittel — die Adresse ist eine
  Tatsache, keine Meinung, und Tatsachen prüft man mit Listen.

- Free-Services lassen sich nicht per TF anlegen (siehe TERRAFORM.md) —
  der Key wird erst ab Starter-Plänen wirklich gebraucht.
  Der vierte endlich ist die Nutzen-Kunde im Voraus: der Schlüssel
  des Hauses, welches die Free-Dienste nicht formeln kann
  ([TERRAFORM.md](TERRAFORM.md) erzählt das Unvermögen ausführlich),
  ist für den Umsonst-Nutzer fast müßig — er wird erst gebraucht,
  wenn bezahlt wird; es ist die merkwürdigste Umkehrung der Sammlung:
  das Zeichen folgt dem Gelde, und der Umsonst-Zustand lebt ohne
  Ausweis (im Dashboard, von Hand — [FREE-TIER.md](FREE-TIER.md) hat
  die Halle beschrieben); wer nie zahlt, braucht nie den Schlüssel
  — die Ironie der Gnade: sie fragt nicht nach Papieren, solange
  man ihr Haus nicht formeln will.

## Quellen

- Provider: <https://registry.terraform.io/providers/render-oss/render/latest/docs>
- API-Keys: <https://render.com/docs/api>

## Vermittelte Verhältnisse

Die Ausweise vermitteln zwischen der Halle ([FREE-TIER.md](FREE-TIER.md))
und ihrem Begriffe ([TERRAFORM.md](TERRAFORM.md)); ihre Lehre —
Schlüssel und Hausnummer, Ewiges für Maschinen und Befristetes für
Menschen, der Ausweis als Gefolge des Geldes — gehört in den großen
Zusammenhang der Zeichen-Ordnungen dieser Sammlung, deren Glieder
von [../aws/README.md](../aws/README.md) (die drei Stufen) bis
[README.md](../redis/README.md) (das Paar) reichen; und dies Kapitel
fügt der Reihe die Frage hinzu, welche erst das Ende der Sammlung
beantworten wird: wem gehört der Ausweis — dem Nutzer, dem Dienste
oder dem Gelde? Hier: dem Gelde. Anderswo: dem Nutzer. Nirgends:
dem Zufall — und das ist die tröstliche Ordnung hinter allen
Zeichen: es gibt sie, und sie haben einen Grund.
