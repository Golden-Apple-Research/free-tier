# Modal Free Tier

> Modal (serverlose Container/GPU-Plattform) gibt auf dem **Starter Plan**
> **$30 Compute-Credits pro Monat** — eines der großzügigsten Free-Angebote
> im GPU-Bereich, mit $0 Grundgebühr und Scale-to-Zero.

Der Name dieses Dienstes — Modal — klingt wie ein Scherz der
Philosophie, und er ist einer: die Modalität, die Weise des Seins
(möglich, wirklich, notwendig), ist hier zur Plattform geworden, und
zwar mit gutem Grunde, denn Modal ist die konsequenteste Aufhebung
des Servers in dieser ganzen Sammlung. Der Server — die Wirklichkeit,
das Dasein, welches dauert, solange es da ist — wird negiert (es gibt
keinen), bewahrt (die Funktion läuft doch, und wie!) und emporgehoben
(zum reinen Wenn-dann der Vermittlung: wenn gerufen, dann wirklich);
was übrigbleibt, ist die Funktion, welche ihre Wirklichkeit jeweils
annimmt und wieder ablegt, das Scale-to-Zero als metaphysisches
Programm: das Nichts als der Grundzustand, aus welchem das Sein nur
auf Zeit tritt. Man vergleiche Lambda ([FREE-TIER.md](../aws/FREE-TIER.md))
— die Zwillingsschwester — und [../triggerdev/FREE-TIER.md](../triggerdev/FREE-TIER.md),
aber Modal treibt das Prinzip auf die Spitze: Container statt
Funktionen, das ganze Gerät statt des bloßen Codestücks, und die GPU,
die theuerste Wirklichkeit der Gegenwart, als Modalität behandelt.
Dreißig Dollar monatlich für dieses Unternehmen — es ist, der
Übertreibung unausweichlich, das großzügigste GPU-Umsonst der Sammlung.

## Starter Plan (Free)

| Resource | Wofür ist das? | Wert |
|---|---|---|
| **Compute-Credits** | Guthaben, das alle CPU-/RAM-/GPU-Nutzung deiner Funktionen deckt — verfällt monatlich, kein Ansparen | $30 / Monat (verfallen monatlich, kein Ansparen) |
| **Seats** | Team-Plätze im Workspace | 3 Workspace-Seats inklusive |
| **Concurrency** | Wie viele Container gleichzeitig laufen dürfen (GPU-Container mit eigenem Limit) | 100 Container + 10 gleichzeitige GPU-Container |
| **Deployed Apps** | Dauerhaft gestellte Container (Web-Endpunkte, Jobs), die per URL/Scheduler erreichbar sind | bis zu 200 |
| **[Crons](https://modal.com/docs/guide/cron)** | Geplante, wiederkehrende Ausführungen von Modal-Funktionen per Cron-Syntax | 5 deployed Crons |
| **Log-Retention** | Wie lange Logs in der Modal-UI abrufbar bleiben | 1 Tag |
| **Support** | Hilfe via Community (Slack/Discord) | Community (Slack/Discord) |
| **Regions** | Rechenzentren, in denen deine Container laufen — Auswahl möglich, aber mit Preis-Aufschlag | Auswahl möglich (Aufpreis 1,5–1,75× auf Basispreise) |

Die Tafel ordnet sich um zwei Mittelpunkte: die Credits (die Währung,
dreißig, monatlich, verfallend — die wiederkehrende Gabe, wie sie
[../codesandbox/FREE-TIER.md](../codesandbox/FREE-TIER.md) kennt) und
die Concurrency (hundert Container zugleich, aber nur zehn mit der
Grafikkraft) — die Zweiheit der Wirklichkeit: das billige Viele und
das theure Wenige; wer die Zahlen gegeneinander hält (100 gegen 10),
liest die Wirtschaftsordnung der Gegenwart in zwei Spalten: Rechnen
ist massenhaft, Erinnern und Sehen sind einzeln. Dazu die fünf Crons
(dasselbe Maß wie [../cloudflare/FREE-TIER.md](../cloudflare/FREE-TIER.md)
— die kleine Uhr der Wiederkehr), die zweihundert gestellten Apps
(das Dauergestellte — merkwürdig hoch für ein Haus, welches das
Dauern negiert: auch die Aufhebung hat ihre Beharrlichkeit), der eine
Tag Log (die kurzeste Erinnerung dieser Sammlung neben
[../triggerdev/FREE-TIER.md](../triggerdev/FREE-TIER.md) — der Tag als
Gedächtnis des Zeitgeistes) und die Regionen mit Aufschlag — die
Örtlichkeit, welche hier nicht die Gnade begrenzt (wie bei
[../gcp/FREE-TIER.md](../gcp/FREE-TIER.md)), sondern den Preis
erhöht: die Umkehrung des örtlichen Prinzips, überall möglich, aber
anders teuer.

## Was $30 Credits reichen (Beispiel-Preise)

| Resource | Preis |
|---|---|
| CPU | ~$0.047 pro physischem Core-Stunde |
| RAM | ~$0.008 pro GiB-Stunde |
| **L4 GPU** | ~$0.80 / h |
| **A10 GPU** | ~$1.10 / h |
| **A100 80 GB** | ~$2.50 / h |
| **H100** | ~$3.95 / h |

→ $30 ≈ 37 h L4, ~12 h A100 oder ~7,5 h H100 pro Monat (nur GPU-Kosten).

Diese kleine Tafel ist das Preistabellenbuch der Wirklichkeit: vom
Cent-Stück des Rechenkerns bis zum Dollar-Vier des mächtigsten
Beschleunigers — die Stufenleiter der Macht, in Stunden umgerechnet;
und die Schlußzeile ist die Umrechnung der Gnade in Zeit: dreißig
Dollar sind siebenunddreißig Stunden des Kleinen, zwölf des Großen,
siebeneinhalb des Größten — die Gabe bleibt sich gleich und die Zeit
schrumpft mit der Macht; wer dies bedenkt, hat die Dialektik aller
Compute-Kontingente begriffen: dasselbe Geld kauft verschiedene
Ewigkeit, je nach dem Gotte, dem man opfert. Es sei dabei der
Vergleich mit der Allmende gestattet, welche
[../huggingface/FREE-TIER.md](../huggingface/FREE-TIER.md) verzeichnet:
dort die Blackwell-GPU umsonst für alle (geteilt nach Quota), hier
die eigene H100 für Siebeneinhalb im Monate — die zwei Weisen des
Geistes: gemeinsam und knapp, oder eigen und bald zu Ende.

## Gotchas

1. Credits sind **nur im Monat gültig** — kein Roll-over; ungenutztes Budget
   verfällt (anders als z. B. Trials mit einmaligem Guthaben).
   Die erste ist die Monatlichkeit, von welcher schon die Rede war: die Gabe
   als Anweisung auf Tätigkeit, nicht als Vermögen ([FREE-TIER.md](../codesandbox/FREE-TIER.md)
   hat dieselbe Lehre); und der Klammerzusatz, welcher die Trials
   unterscheidet (dort einmalig und dauernd, hier wiederkehrend und
   verfallend), ist die kleine Typologie der Guthaben: das
   Erstlingsgeld (der Trial) und das Monatsgeld (der Credit) — jenes
   dem Kapital, dieses dem Einkommen verwandt, und die Cloud-Welt
   hat beide Formen von der bürgerlichen Gesellschaft gelernt, ohne
   es zu wissen.

2. Sind die Credits aufgebraucht, stoppen Container ohne hinterlegte
   Zahlungsmethode; mit Karte wird alles darüber **normal abgerechnet**.
   Budget-Limits setzen!
   Die zweite ist die Wage zwischen den zwei Zuständen: ohne Karte
   das Anhalten (das ehrenwerte Ende — der Dienst stoppt, nichts
   passiert), mit Karte das Weiterlaufen (das abgerechnete Übermaß —
   die Gnade schlägt in Rechnung um, und der Nutzer zahlt das, was er
   nicht bestellt hat, sondern nur gelassen hat); die Mahnung
   „Budget-Limits setzen!" ist dieselbe, welche die ganze Sammlung
   durchzieht ([../aws/FREE-TIER.md](../aws/FREE-TIER.md) Billing-Alarm,
   [../gcp/FREE-TIER.md](../gcp/FREE-TIER.md) Budget + Alert) — die
   selbstgesetzte Grenze als einzige Freiheit des Marktes.

3. GPU-Concurrency (10 gleichzeitig) reicht für viele Batch-Jobs, aber lange
   Trainings blockieren Slots — Modal ist für lange finetunes auf Free nicht
   gedacht.
   Die dritte ist die Inhaltsbestimmung durch die Struktur: die zehn Plätze
   sind für das Viele-Kurze gebaut (Batch-Jobs — die Arbeit in Mengen), nicht
   für das Lange-Eine (das Training, welches Stunden und Tage will); wer
   feintunen will, braucht die Dauer, und die Dauer braucht das Geld — das
   Umsonst ist das Haus des Augenblicks, nicht der Ausbildung; es ist
   dasselbe Urteil, welches [../huggingface/FREE-TIER.md](../huggingface/FREE-TIER.md)
   über die ZeroGPU sprach („Demos, nicht Dauerlast"), und es ist die
   Grenze beider Häuser: das Zeigen umsonst, das Werden bezahlt.

4. Log-Retention 1 Tag: Fehler schnell sichern, sonst weg.
   Die vierte ist die kurzeste Erinnerung: ein Tag — der Fehler von
   gestern ist die Ahnung von heute; wer die Sorge nicht selbst
   übernimmt (exportieren!), der hat das Gedächtnis der Welle, welche
   sich senkt, sobald sie den Strand berührte; man vergleiche die
   vierzehn Tage von [../grafana/FREE-TIER.md](../grafana/FREE-TIER.md)
   und die Retentions-Ordnungen der großen Häuser: überall gilt,
   was hier zur Regel verdichtet ist — die Wolke sieht alles und
   behält nichts.

5. Regionen außerhalb US/EU (und teils NA) kosten 1,5–1,75× und verbrennen
   Credits entsprechend schneller.
   Die letzte endlich ist der Aufschlag der Ferne: die Welt wird
   geteilt in das nahe Land (US, EU — Normalpreis) und das ferne (der
   Rest, mit dem fünfundsiebzigprozentigen Zuschlage), und die Credits
   verbrennen nach der Landkarte; die Umkehrung des örtlichen Prinzips
   von Google (dort: Gnade nur am Orte; hier: Gnade überall, aber
   teurer) — die zwei Weisen, mit dem Raume zu rechnen, und keine von
   beiden ist die Neutralität, von welcher die Wolke im Anfange
   träumte; der Raum ist Geld, und die Verteilung des Geldes ist
   Politik, auch hier.

## Quellen

- Pricing: <https://modal.com/pricing>
- Signup ($30 monthly credit): <https://modal.com/signup>

Die Quellen sind knapp wie das Haus selbst; die Preisliste (die erste)
ist das eigentliche Dokument, denn dieses Haus denkt in Preisen — die
Gnade ist eine Währung, die Zeit ihre Umrechnung, und wer die Tafel
der Stunden gelesen hat, der weiß mehr über seine Möglichkeiten als
jede Werbung ihm sagen könnte.

## Vermittelte Verhältnisse

Dies Kapitel gehört zur Familie des Modalitäts-Denkens: sein
Gegenstück ist [../triggerdev/FREE-TIER.md](../triggerdev/FREE-TIER.md)
(die Arbeit als Aufgabe, mit Cron und Credit — das Amt gegen die
Bühne), sein Verwandter der Funktionen ist Lambda
([FREE-TIER.md](../aws/FREE-TIER.md)), sein GPU-Genosse
[../huggingface/FREE-TIER.md](../huggingface/FREE-TIER.md) (die
Allmende gegen das Eigentum); die Ausweise verwaltet
[README.md](README.md) (das Token-Id und -Secret als Paar), der
Begriff [TERRAFORM.md](TERRAFORM.md) (die Lehre vom Fehlen des
offiziellen Providers — die Gemeinschaft als Werkstatt des
Werkzeugs); und wer die Crons dieses Hauses mit den Crons der andern
vergleicht ([../cloudflare/FREE-TIER.md](../cloudflare/FREE-TIER.md)
fünf, [../vercel/FREE-TIER.md](../vercel/FREE-TIER.md) das tägliche
Maß), der sieht die Uhren der Sammlung beisammen: alle stellen die
Wiederkehr, und jede nach ihrer Zeit — der Tag, die Woche, der Monat;
das Umsonst selbst hat seinen Kalender, und dies Kapitel ist das
blatt, auf welchem er am deutlichsten geschrieben steht.
