# Neon Free Plan

> Neons Free Plan ist **permanent** (kein Trial), ohne Kreditkarte. Kernidee:
> **Serverless Postgres** — Compute skaliert bei Inaktivität auf null zurück,
> gezahlt/gutgeschrieben werden nur aktive Compute-Stunden. Bis zu 100
> Projekte mit jeweils eigenem Budget.

Die Kernidee, welche der Kasten ausspricht, ist die radikalste
Zeitform der ganzen Sammlung: der Compute, welcher bei der Stille auf
Null zurücksinkt. Nicht der Schlaf (der Kontodaten bleiben — so
schlafen [../render/FREE-TIER.md](../render/FREE-TIER.md) und
[../supabase/FREE-TIER.md](../supabase/FREE-TIER.md)), sondern das
Nicht-mehr-Sein des Rechnens selbst: die Maschine, welche aufhört,
zu sein, solange niemand fragt, und aus dem Nichts (gegen den Preis
eines Kaltstartes) wiederkehrt, wenn jemand fragt — das Werden als
Grundform des Betriebs, die Vermittlung zwischen Sein und Nichts, welche
die Logik an ihrem Anfange behandelt und die hier, in
Rechenzentren, ihre populärste Auflage gefunden hat. Dazu die zweite
Idee — die Hundert Projekte mit je eigenem Budget —, und das Kapitel
hat seine Zweiheit: die unendliche Teilung des Raumes (Projekte,
Zweige, Copy-on-Write) und die unendliche Sparsamkeit der Zeit
(Compute nur, solange gebraucht); Neon ist das ökonomischste
Gegenstück zu [../supabase/FREE-TIER.md](../supabase/FREE-TIER.md),
dem verschwenderischen Bruder mit den zwei ewigen Projekten, und wer
beide kennt, kennt die zwei Weisen des Postgres-Umsonst: das Sein
umsonst (Supabase) und das Werden umsonst (Neon).

## Free Plan Kontingente

| Resource | Wofür ist das? | Kontingent |
|---|---|---|
| **Projekte** | Ein Projekt = ein Postgres-Cluster inkl. Branches, Compute und Verbindungs-Endpunkten | bis zu 100 |
| **Storage** | Datenvolumen über alle Branches hinweg (Copy-on-Write teilt unveränderte Seiten) | 0,5 GB pro Projekt |
| **Compute** | 1 CU ≈ 1 vCPU + 4 GB RAM; abgerechnet wird nur die Zeit, in der der Compute aktiv ist | 100 CU-Stunden pro Projekt / Monat (nur aktive Zeit zählt) |
| **[Autoscaling](https://neon.com/docs/introduction/autoscaling)** | Compute wächst bei Last automatisch bis zur Obergrenze und schrumpft danach wieder | bis 2 CU (≈ 8 GB RAM) |
| **[Scale-to-Zero](https://neon.com/docs/introduction/scale-to-zero)** | Inaktiver Compute parkt nach ~5 Min. ein; die erste Query danach zahlt einen Kaltstart | automatisch nach ~5 Min. Inaktivität |
| **[Branches](https://neon.com/docs/introduction/branching)** | Copy-on-Write-Klone der Datenbank — „Git für die DB“: Dev-/Test-Umgebungen mit echten Daten | bis ~10 pro Projekt (Copy-on-Write-Branches) |
| **[Better Auth](https://neon.com/docs/use-cases/better-auth)** | Die Open-Source-Auth-Bibliothek Better Auth als Managed-Setup auf Neon — User-Accounts ohne eigenes Backend | inklusive bis 60.000 MAU |
| **Object Storage / Functions** | Zusatz-Features im Beta-Stadium (externer Objektspeicher, DB-Funktionen) — daher gratis | während Beta gratis |
| **AI Gateway** | Zentraler Proxy für LLM-API-Aufrufe (Routing, Keys, Kostenkontrolle) | nur in bezahlten Plänen |

Die Tafel ist um drei
Begriffe zentriert, welche die Philosophie dieser Datenbank ausmachen.

**Das Projekt als Commune:** hundert an der Zahl, jedes mit eigenem
Haushalte — die Teilung, welche [../aws/FREE-TIER.md](../aws/FREE-TIER.md)
am Free Plane lehrte (das ganze Konto stirbt mit seinem Guthaben),
hier ins Positive gewendet: hundert kleine Leben statt eines großen;
der Nutzer ist nicht Untertan eines Kontingentes, sondern Bürger von
hundert kleinen Kontingenten, und die hundertförmige Freiheit hat
freilich ihren Preis (die dritte Gotcha): jedes Budget verzehrt sich
für sich, und niemand führt das große Buch über die Summe — die
Bücherführung ist die des Nutzer, oder sie ist nicht.

**Copy-on-Write als Ontologie der Zweige:** die berühmte Formel, daß
die Zweige nur das Verschiedene schreiben und das Gleiche teilen —
die Zeile der Tafel nennt es „Git für die DB", und der Vergleich
trifft mehr, als er weiß: wie im Repositorium die Geschichte das
Gemeinsame ist und der Zweig nur die Abweichung, so hier die Seiten:
unverändert geteilt, geschrieben erst im Unterschiede. Es ist die
leise Widerlegung des Substanz-Denkens: die Substanz (die
Datenbank) erweist sich als Beziehung (die Seiten, welche die Zweige
gemeinsam haben), und das Individuum (der Zweig) ist nur die
Summe seiner Abweichungen — dieselbe Lehre, welche die ganze
Sammlung an den Shared-Storage-Zeilen der andern Häuser vermißt und
hier, einmal, vollständig ausgeführt findet.

**Scale-to-Zero als Zeitlichkeit:** die Tafel spricht die heimliche
Wahrheit mit der Nüchternheit der Preise aus — gezählt wird nur die
aktive Zeit; die fünf Minuten Gnadenfrist, dann das Nichts; der
Kaltstart als Eintrittsgeld der Rückkehr. Die Fußnote der Tafel rechnet es vor: „1 CU ≈ 4 GB RAM + zugehörige
CPU. 100 CU-h/Monat ≈ z. B. 50 h durchgehend 0,25 CU oder 25 h 1 CU —
für Anwendungen mit echtem Traffic mit scale-to-zero deutlich länger."
Wer die Umrechnung liest (fünfzig Stunden bei Viertel-CU, fünfundzwanzig
bei Eins — „deutlich länger" mit dem Scale-to-Zero), der versteht die
Ökonomie: dieselbe Gabe, verschieden nur durch die Art des Lebens;
wer immer da ist, verzehrt schnell; wer kommt und geht, lebt lange —
die Ethik der Flüchtigkeit als Preisvorteil, und es wäre zu fragen,
ob nicht dies die Grundformel aller serverlosen Zukunft ist.

Die übrigen Zeilen setzen die bekannten Bestimmungen fort: das
Autoscaling (bis 2 CU — die Grenze des Wachstums), Better Auth mit
sechzigtausend Monatsaktiven (das Anerkennungswesen gratis — die
Großzügigkeit von [../aws/FREE-TIER.md](../aws/FREE-TIER.md) Cognito
×6, es sei dies bemerkt und gewürdigt), die Beta-Gratis-Features (das
Werden umsonst, solange es Werden ist) und der AI-Gateway nur in
bezahlten Plänen (die Pforte des Geistes — im Unterschiede zu
[../huggingface/FREE-TIER.md](../huggingface/FREE-TIER.md), welches
den Geisten im Kleinen jedermann offen hält).

## Gotchas

1. **Cold Starts:** Nach Scale-to-Zero braucht die erste Query ~0,5–1 s+
   (Compute wird gestartet). Für latency-kritische APIs inaktive Zeit oder
   minimale Compute-Größe konfigurieren bzw. Pings vermeiden.
   Die erste Lehre ist der Preis des Nichts: die Rückkehr aus dem
   scale-to-zero kostet die halbe bis ganze Sekunde — die Zeit des
   Werdens; und die drei Mittel gegen sie (inaktive Zeit konfigurieren,
   Größe klein halten, Pings vermeiden) sind die drei Asketen der
   Sparsamkeit: wer das Nichts ehrt, muß das Werden bezahlen, und wer
   das Werden erkaufen will (immer wach — die Pings!), der bezahlt es
   mit der Substanz (den Stunden) — der Widerspruch von Wache und
   Sparsamkeit, hier so rein gestellt wie nirgends.

2. Compute-Stunden sind **pro Projekt** — viele aktive Projekte haben
   jeweils ihr eigenes 100-CU-h-Budget, aber auch jedes verbraucht separat.
   Die zweite ist die Kehrseite der Commune: hundert Budgets sind
   hundert Freuden und hundert Sorgen; die Teilung ist Gnade (kein
   Projekt frißt dem andern) und Last (kein Projekt schenkt dem andern),
   und die Klugheit ist die Auswahl: wenige lebende Projekte statt
   vieler schlafender — denn schlafende kosten nichts, aber leere
   Budgets auch nichts; die Mitte ist alles.

3. 0,5 GB Storage klingen wenig; Branches teilen sich den Projekt-Storage
   (Copy-on-Write hilft, Tabellen-Copies helfen nicht).
   Die dritte ist die Lehre vom geteilten Boden: der halbe Gigabyte gilt
   dem Projekte, nicht dem Zweige — die Zweige wachsen aus demselben
   Vorrat, und die Copy-on-Write-Formel hilft nur, solange die
   Abweichungen klein sind; wer ganze Tabellen kopiert (die Kopie der
   Substanz statt des Unterschiedes), der hat die Philosophie der
   Zweige verfehlt und ihre Ökonomie gleich mit.

4. Der Free Plan wurde mehrfach umgestellt (früher 191,7 CU-h gesamt statt
   100 CU-h pro Projekt) — ältere Blogposts, die das alte Modell beschreiben,
   sind veraltet.
   Die vierte ist die Geschichtslehre in nuce: die Zahl 191,7 — einst
   das Ganze, jetzt Erinnerung — steht für alle umgestellten Modelle
   der Sammlung ([../aws/FREE-TIER.md](../aws/FREE-TIER.md): das
   12-Monats-Grab; [../netlify/FREE-TIER.md](../netlify/FREE-TIER.md)
   wird das Credit-Modell zeigen): die alten Zahlen leben in den
   Blogposts weiter, und der Leser, welcher die Gegenwart aus der
   Vergangenheit liest, liest ein Verzeichnis von Gestalten, welche
   aufgehört haben, zu gelten — die Geschichtsschreibung der
   Kontingente als eigenes Studium, und diese Sammlung ist ihr
   Archiv.

5. Paid-Pläne (Launch/Scale) ohne Monatsminimum: reines Pay-as-you-go
   ($0.106/CU-h, $0.35/GB-Monat Storage auf Launch).
   Die letzte ist der Ausgang ohne Schwellen: der Aufstieg, welcher
   kein Minimum kennt — die Fortsetzung des gebrauchten Maßes in
   bezahlte Form; es ist der zivilisierteste Aufstieg der Sammlung
   (man vergleiche die Plattformgebühren bei
   [../grafana/FREE-TIER.md](../grafana/FREE-TIER.md) und die
   Mindestumsätze bei [../redis/FREE-TIER.md](../redis/FREE-TIER.md)),
   und er entspricht dem Wesen des Hauses: wer nur das Werden bezahlt,
   braucht keine Schwelle, denn jede Schwelle wäre ein Sein, und das
   Sein hat dieses Haus aufgehoben.

## Quellen

- Pricing: <https://neon.com/pricing>
- Plans-Doku: <https://neon.com/docs/introduction/plans>
- Free-Tier-FAQ: <https://neon.com/faqs/managed-postgres-databases-free-tier>

## Vermittelte Verhältnisse

Dies Kapitel ist das eine Ende der Postgres-Zwillinge
([../supabase/FREE-TIER.md](../supabase/FREE-TIER.md) das andere):
Neon das Werden, Supabase das Sein; die Verwandten der Form sind die
Schlafenden ([../render/FREE-TIER.md](../render/FREE-TIER.md), die
Viertelstunde), die Teilenden ([../codesandbox/FREE-TIER.md](../codesandbox/FREE-TIER.md),
hundert Credits, nein — vierhundert!) und die Copy-on-Write-Lehren,
welche die Sammlung sonst nirgends hat; die Ausweise verwaltet
[README.md](README.md) (die Lehre vom Einmalzeigen und der harten
Rotation), der Begriff [TERRAFORM.md](TERRAFORM.md) (die Gemeinde
als Provider). Wer die zwei Zwillinge zusammenliest, der hat die
ganze Wahrheit des Postgres-Umsonst: daß es zwei Weisen gibt,
unendlich zu sein — die Dauer und die Wiederkehr —, und daß jede
ihren Preis hat: die Dauer den Schlummer, die Wiederkehr den
Kaltstart; es gibt kein Drittes, und die Auswahl zwischen beiden ist
die erste stilbildende Entscheidung eines jeden Projekts.
