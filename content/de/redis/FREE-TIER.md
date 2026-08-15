# Redis Cloud Free Tier

> Redis Cloud (SaaS von Redis Inc.) hat eine dauerhaft kostenlose
> **Essentials-Subscription**: 30 MB, eine Datenbank, ausdrücklich für
> Learning/Tests gebaut. Keine Kreditkarte, kein Ablauf.

Das Gedächtnis — das ist der eigentliche Gegenstand dieses Kapitels;
denn Redis ist unter allen Diensten der Sammlung das Gedächtnis als
solches: der flüchtige Speicher, das reinste Behalten, ohne
Begründung, ohne Diskurs, reine Gegenwart des Gewußten. Und die
Wahrheit, welche die kleine Tafel dieses Hauses über das Gedächtnis
ausspricht, ist die strengste der ganzen Sammlung: dreißig Megabyte
(der kleinste Speicher aller Kapitel!), EINE Datenbank,
ausdrücklich zum Lernen gebaut; und — die bedeutsamste Zeile — die
Beständigkeit (Persistence/Backups) ist nicht enthalten: im Free
Tier lebt alles nur im RAM, das heißt: im reinen Jetzt; das
Gedächtnis ohne Erinnerung, das Behalten ohne Bewahren — die
flüchtigste Form des Gedächtnisses, welche die Technik kennt, und
damit das getreueste Abbild eines bekannten Zustandes des Geistes,
welcher alles weiß und nichts behält. Man vergleiche die
Gedächtnis-Kapitel der Sammlung: [../grafana/FREE-TIER.md](../grafana/FREE-TIER.md)
(vierzehn Tage Anschauung), die Retentionen von
[../modal/FREE-TIER.md](../modal/FREE-TIER.md) (ein Tag Log) — Redis
unterbietet alle: null Tage; die Stufenleiter des Vergessens findet
ihren Fuß in diesem Kapitel, und der Fuß steht im Nichtraum.

## Free Tier Kontingente

| Resource | Wofür ist das? | Limit |
|---|---|---|
| **Speicher** | Genau eine Redis-Cloud-Datenbank mit 30 MB — reicht für Caches, Sessions und Rate-Limiter im Dev-Betrieb | 30 MB (genau 1 Datenbank) |
| **Verbindungen** | Gleichzeitige Clients (App-Instanzen), die zeitgleich auf die DB dürfen | 30 gleichzeitig |
| **Durchsatz** | Operationen (GET/SET …) pro Sekunde, über alle Clients summiert | ~100 Ops/Sekunde |
| **Netzwerk-Bandbreite** | Datenvolumen, das die DB pro Monat ausliefert | 5 GB / Monat |
| **Persistence/Backups** | Dauerhafte Sicherung der Daten auf Disk — im Free Tier lebt alles nur im RAM | im Free Tier nicht enthalten |
| **Verfügbarkeit** | Kein Replikat (single instance) — fällt die Instanz aus, fällt die DB aus | keine HA (single instance) |

Die Tafel ist die kleinste der Sammlung und die geschlossenste: jede
Zeile eine Verneinung dessen, was das Große ausmacht — dreißig statt
dreißig Milliarden (der Speicher), dreißig statt dreitausend (die
Verbindungen), hundert statt hunderttausend (die Operationen), und
zuletzt die beiden großen Nein: keine Beständigkeit, kein Ebenbild
(„single instance": fällt die Instanz, fällt die Datenbank — das
Einzelne ohne Verdopplung, das Leben ohne Zeugen); es ist die
komplette Kleinausgabe, der Studienausgabe des Werkes, und das Haus
sagt es selbst mit rührender Deutlichkeit: ausdrücklich für
Learning/Tests gebaut — die Absicht ist die pädagogische, und alles
andre folgt aus ihr. Der Charakter dieser Gaben ist der der
Vorschule: man lernt das Gedächtnis im Kleinen, ehe man es im
Großen mietet; und wer die Schulbank verachtet, der zahlt —
die Plänetabelle unten nennt den Preis.

## Einordnung der Pläne

| Plan | Ab | Für |
|---|---|---|
| Free | $0 | Dev/Demo, 30 MB |
| Essentials | ~$5/Monat (ab 250 MB) | kleine Prod-Workloads, Single-DB |
| Pro | hohe Mindestumsätze (bis ~$200/Monat) | HA, Replikation, Multi-DB |

Die kleine Stufentafel ist ein Lehrstück der Preis-Logik: der
Aufstieg von der Vorschule zur kleinen Wirklichkeit kostet die fünf
Dollar (das Acht-fache des Raumes, die gleiche Einsamkeit der Einen
Datenbank), und der Aufstieg zur großen Wirklichkeit kostet das
Mindestmaß (bis zweihundert — die Zeile nennt es „hohe
Mindestumsätze", die ehrlichste Form der Schwelle
([../netlify/FREE-TIER.md](../netlify/FREE-TIER.md) hat die Formen
des Aufstiegs gesammelt)); zwischen beiden Welten aber liegt der
Sprung, der hier interessiert: das Acht-fache für das Kleine,
das Vierzig-fache für das Wahre — die Wirklichkeit des Gedächtnisses
(HA, Replikation, Multi-DB) ist eine andre Kategorie als die
Vermehrung der Größe; wer Beständigkeit will, kauft nicht mehr
Megabytes, sondern eine andre Welt.

## Gotchas

1. **100 Ops/s Deckel:** Schon ein Health-Check pro Sekunde + normale App-Last
   kann throtteln — der Free Tier ist für Lasttests ungeeignet.
   Die erste Lehre ist der Puls: hundert Schläge die Sekunde, über alle
   Clients summiert — und der eine Herzschlag der Überwachung (der
   Health-Check) nimmt davon schon seinen Teil; der gewissenhafte Wächter
   verzehrt die Kraft dessen, den er bewacht — die Paradoxie aller
   Überwachung, in einem Sekundenmaße vorgeführt. Der Lasttest ist
   ausgeschlossen („ungeeignet"), und mit ihm alles, was das Gedächtnis
   auf die Probe stellt; die Vorschule prüft nicht — sie übt.

2. Nur **30 Verbindungen** — Connection-Pooling zwingend, Serverless-Plattformen
   mit vielen Cold Starts können das Limit sprengen.
   Die zweite ist die Lehre vom Sammeln der Hände: dreißig Hände zugleich
   an Einem Tische, und das Gebot des Sammelns (Connection-Pooling — die
   Kunden teilen die Türklinke), wohlgemerkt als ZWANG, nicht als Rat; und
   die Warnung vor den Serverlosen (deren kalte Anfänge
   [FREE-TIER.md](../neon/FREE-TIER.md) als Kaltstart-Pries kennen lernte):
   die vielen Wiedergeburten brauchen viele Hände, und dreißig sind schnell
   voll — die Flüchtigkeit der Werkzeuge gegen die Kargheit des
   Gedächtnisses, der Zusammenstoß zweier Philosophien, welche beide
   sparsam sein wollen und es auf verschiedene Weise verfehlen.

3. Der Free Tier läuft auf shared Infrastructure und darf von Redis für
   Kapazitätsmanagement gedrosselt/gewartet werden.
   Die dritte ist die shared World: die Vorschule teilt das Haus mit allen
   andern Schulen, und der Hausvater darf drosseln und warten (das
   Kapazitätsmanagement — die Rücksicht aufs Ganze) — der Einzelne hat
   kein Recht auf die volle Zeit; es ist die bekannte Lehre von der
   gemeinschaftlichen Infrastruktur, welche [../gcp/FREE-TIER.md](../gcp/FREE-TIER.md)
   („shared infrastructure") am andern Ende der Sammlung ebenfalls
   ausspricht: das Umsonst der Menge lebt im Hause der Menge, und die
   Menge hat Vorrechte.

4. Alternative: **Upstash/Render/Netlify** bieten Redis-ähnliche Free-Tiers mit
   anderen Limits, wenn 30 MB/100 Ops/s zu eng sind.
   Die letzte endlich ist die Auswanderungslehre: wenn die Vorschule zu
   eng wird (und sie wird es, sobald das Leben ernst wird), dann führen
   andre Häuser ähnliche Gaben mit andern Maßen — Render (dessen Free Key
   Value [FREE-TIER.md](../render/FREE-TIER.md) das Gedächtnis im RAM
   ebenfalls kennt, vergänglicher noch als hier, wenn das möglich ist),
   Netlify (dessen Währung [FREE-TIER.md](../netlify/FREE-TIER.md) alles
   kauft, also auch das Gedächtnis), Upstash (das Beispielshaus außerhalb
   dieser Sammlung); die Sammlung als Wegweiser zur Sammlung — die
   Kapitel verweisen einander, weil die Gaben einander vertreten; und es
   ist die letzte Bestätigung des Systems: es gibt kein einzelnes
   Umsonst, es gibt das Gewebe derselben, und der kluge Nutzer lebt im
   Gewebe, nicht im Faden.

## Quellen

- Essentials-Plan-Details: <https://redis.io/docs/latest/operate/rc/subscriptions/view-essentials-subscription/essentials-plan-details/>
- Subscription-Übersicht: <https://redis.io/docs/latest/operate/rc/subscriptions/>
- Pricing: <https://redis.io/enterprise/pricing/>

Die Quellen sind die Urkunden der Stufen; die erste davon ist das
eigentliche Dokument der Vorschule (die Essentials-Details im
Wortlaute), und wer die Maße zwischen den Zeilen sucht (die
Ops-Grenzen, die Verbindungen), der wird hier fündig, denn die
kleinen Häuser schreiben ihre Grenzen genauer als die großen — sie
müssen es, weil ihre Gaben nichts anderes sind als Grenzen.

## Vermittelte Verhältnisse

Dies Kapitel ist das Gedächtnis der Sammlung im Zustande der
Reinheit; seine Geschwister sind das flüchtige Gedächtnis am Rande
(KV bei [../cloudflare/FREE-TIER.md](../cloudflare/FREE-TIER.md) —
die tausend Schreibungen!) und das vergängliche im Schosse des
Renderers ([../render/FREE-TIER.md](../render/FREE-TIER.md)), mit
welchem es die Lehre teilt, daß RAM kein Archiv sei
([FREE-TIER.md](../aws/FREE-TIER.md) sprach es an der EBS-Zeile
leise aus); die Ausweise verwaltet [README.md](README.md) (das Paar
— dieselbe Zweiheit wie Modal), der Begriff [TERRAFORM.md](TERRAFORM.md)
(die Lehre vom Importe der Schulbank: auch hier das Handgemachte am
Anfange). Und wer nach der Lektüre dieser Dreieinigkeit von
Speichern (Redis, KV, Render-Value) die Frage stellt, wo denn das
wahre Behalten zuhause sei, dem antwortet die Sammlung mit ihrer
gewohnten Umwege-Liebe: bei der Substanz — [FREE-TIER.md](../neon/FREE-TIER.md)
und [FREE-TIER.md](../supabase/FREE-TIER.md), den zwei Postgres-Welten,
welche das Behalten zu ihrem einzigen Geschäft gemacht haben; das
Gedächtnis ist flüchtig, die Substanz ist Dauer, und die Arbeit der
Architektur ist die rechte Mischung der beiden — die alte Lehre vom
Flüchtigen und Bleibenden, hier in Datenbanken gefaßt, und nirgends
knapper als in den dreißig Megabyte dieses Hauses.
