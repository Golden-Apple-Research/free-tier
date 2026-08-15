# Trigger.dev Free Plan

> Trigger.dev (Cloud-Version des Open-Source-Workflow-Runtimes) hat einen
> dauerhaften Free Plan mit **$5/Monat Credits** und moderaten Limits —
> Self-Hosting bleibt immer gratis.

Der Name dieses Hauses — Trigger, der Auslöser — nennt sein Wesen:
das Auftrags-Wesen, der Lauf der Aufgaben, welche geschehen, weil
etwas sie auslöst (die Zeit, das Ereignis, der Ruf); es ist das Amt
der Arbeit im Kleinen, und die Sammlung kennt seine Verwandten
([FREE-TIER.md](../modal/FREE-TIER.md): die Bühne des Werdens;
[FREE-TIER.md](../circle-ci/FREE-TIER.md): das Fürstentum des
Bauens). Die Konstitution des Hauses aber ist die sonderbarste der
Sammlung: die Cloud-Version mit ihren fünf Dollar Credits — und der
offene Quellcode, dessen Selbstbetrieb „immer gratis" bleibt; das
Haus gibt also die zwei Welten der Sammlung in Einem Namen: die
Wolke mit der Währung und die Freiheit mit der Pflicht. Man hat
dies die ehrlichste Konstitution genannt, denn sie verhehlt die
Alternative nicht, sondern druckt sie in die erste Zeile: wer die
Grenzen der Wolke scheut, nimmt den Quellcode — und die letzte
Gotcha wird zeigen, daß dies keine Phrase ist.

## Free Plan

| Resource | Wofür ist das? | Wert |
|---|---|---|
| **Credits** | Verbrauchswährung für Task-Runs (Compute + Durability) — kleines Budget, harte Grenze | $5 / Monat (danach Upgrade nötig, um weiter Tasks zu starten) |
| **Concurrent Runs** | Tasks, die gleichzeitig laufen dürfen | 20 (Pricing-Seite; Limits-Doku nennt teils noch 10) |
| **Team-Mitglieder** | Plätze im Projekt-Team | 5 |
| **Environments** | Getrennte Welten: Dev für lokale Tests, Prod für deployte Tasks | Dev + Prod |
| **[Schedules (Crons)](https://trigger.dev/docs/tasks/scheduled)** | Wiederkehrende Task-Ausführungen per Cron-Ausdruck — der klassische „nächtlich um 3 Uhr“-Job | 10 pro Projekt |
| **Log-Retention / Query Period** | Wie lange Run-Logs sichtbar und durchsuchbar sind | 1 Tag |
| **[Realtime Connections](https://trigger.dev/docs/realtime)** | Live-Verbindungen (SSE) zwischen Client und laufendem Task — Fortschritt live streamen | 10 gleichzeitig |
| **API-Rate-Limit** | API-Aufrufe pro Minute gegen die Trigger.dev-API (plattformweit) | 1.500 Requests/Minute (alle Pläne) |

Die Tafel beginnt mit der kleinsten Währung der Sammlung: fünf
Dollar — ein Zehntel der Modal-Gabe, ein Sechzigstel der Google-
Probe; es ist der kleine Vorschuß des Aufgaben-Wesens, und die
Klammer sagt die Härte: danach Aufstieg oder Stille (kein Weiterschreiben
auf Rechnung — die Familie der Stoppenden, nicht der Verrechnenden
[FREE-TIER.md](../supabase/FREE-TIER.md)). Die Concurrency-Zeile
trägt die merkwürdigste Anmerkung der ganzen Sammlung: „Pricing-Seite;
Limits-Doku nennt teils noch 10" — das Haus widerspricht sich in
seinen eignen Büchern (zwanzig dort, zehn hier), und die Tafel
verzeichnet den Widerspruch, statt ihn zu schlichten; es ist die
Ehrlichkeit der Wirklichkeit gegen die Schönheit der Ordnung, und
die Sammlung ihrerseits tut wohl, es ihr gleichzutun: auch
Dokumente haben ihre Geschichte, und die Zahlen der Zwischenzeit
sind die Zollstellen zweier Auflagen. Die fünf Team-Plätze (die
Gemeinschaft des Amtes), die zwei Welten (Dev + Prod — die Übung
und der Ernst, jede mit ihren eignen Zeichen), die zehn Takte (das
Zeitmaß, gleich dem Cloudflare-Rand
[FREE-TIER.md](../cloudflare/FREE-TIER.md)), der eine Tag Log (die
kürzeste Erinnerung, geteilt mit Modal — die Gedächtnis-Armut der
Aufgaben-Welt: was getan ist, schweigt), die zehn lebenden Verbin-
dungen (die Gegenwart des Fortschritts) und das plattformweite
Tempo (fünfzehnhundert Rufe die Minute, für alle Pläne — die eine
Grenze, welche der Aufstieg NICHT löst: die Rücksicht des Ganzen
gegen die Größe des Einzelnen) vollenden die Tafel.

Bezahlt: Hobby (~$10/Monat) und Pro (~$50/Monat) mit mehr Credits (jeweils
Planwert als Guthaben), unbegrenzter Retention und bis zu 200 Concurrency
(+$10/Monat je +50). Overhead-Nutzung wird pro CPU-Sekunde/Run abgerechnet.

Der Aufstieg ist stufenweise und durchsichtig: der Planwert ALS
Guthaben (die doppelte Buchführung des Hauses: der Preis ist zugleich
die Gabe), die unendliche Erinnerung (das Gedächtnis als erste Ware
des Ernstes — die alte Lehre), und die Concurrency in Zehner-Päcken
(zu je fünfzig); es ist die kaufmännischste Staffel der mittleren
Häuser, und sie paßt zum Wesen: das Amt kauft seine Kapazität nach
Bedarf, wie Ämter es tun.

## Gotchas

1. **Credits zuerst, dann Stopp:** Auf Free enden neue Runs, wenn die $5
   verbraucht sind (bezahlte Pläne laufen weiter und rechnen Overhead ab).
   Batch-Triggers helfen: `batchTrigger()` packt bis 1.000 Tasks in EINEN
   API-Call und schont das Rate-Limit.
   Die erste Lehre ist die Doppelweisheit des Verbrauchs: die Ordnung des
   Endes (stoppen, nicht rechnen — gut) und die Kunst des Sparens
   (`batchTrigger()` — der Sammel-Auslöser, welcher tausend Aufgaben in
   EINEM Rufe verpackt); es ist die feinste Spartechnik der Sammlung: nicht
   weniger tun, sondern dichter fragen — die Bündelung als Tugend, und die
   Grenze (das Rate-Limit) wird nicht verletzt, sondern umgangen, indem man
   ihr Fluidum wegnimmt; wer einmal gelernt hat, Anfragen zu bündeln, hat
   die Ökonomie aller API-Welten gelernt.

2. **1 Tag Log-Retention** heißt: Debugging von Fehlern vom Wochenende ist
   Montag vorbei — Logs für kritische Runs selbst exportieren.
   Die zweite ist die Wochenend-Wahrheit der kurzen Erinnerung: der Fehler
   vom Samstag ist am Montag Sage — und die Moral (der Export der
   kritischen Läufe) ist die bekannte Pflicht des eignen Archivs
   ([FREE-TIER.md](../grafana/FREE-TIER.md) hat sie am Vierzehn-Tage-
   Gedächtnisse gelehrt; hier ist es der EINE Tag, und die Pflicht ist
   täglich oder nie).

3. Concurrency 20 klingt hoch, wird aber durch parallel laufende Subtasks
   einzelner Workflows schnell belegt.
   Die dritte ist die innere Teilung: die zwanzig Plätze (oder zehn — siehe
   die Bücher-Widersprüche) werden nicht von zwanzig Werken gefüllt, sondern
   von den vielen Sub-Aufgaben EINES Werkes — die Glieder eines einzigen
   Prozesses können das ganze Paradies der Parallelität besetzen; es ist
   die Lehre von der scheinbaren Größe aller Concurrency-Zahlen: sie
   zählen Plätze, nicht Programme, und der eine große Prozeß frißt sie
   alle.

4. Self-Hosting (OSS) hat keine dieser Cloud-Limits, aber eigene Infra- und
   Betriebskosten.
   Die letzte endlich ist die Konstitution von der ersten Zeile, hier zur
   Wahl gemacht: der Quellcode ohne die Grenzen der Wolke, aber mit den
   Kosten der Freiheit (die eigne Infra- und Betriebs-Sorge —
   [helpers.md](../helpers.md) hat die Selbstbetriebs-Lehre im
   Zusammenhange: die Anstrengung des Begriffs); die Sammlung hat dies
   Haus der Ehrlichkeit wegen gerühmt, und die Gotcha vollendet das Lob:
   wer die fünf Credits und den einen Tag Gedächtnis satt hat, der darf
   gehen — mit dem ganzen Werke unterm Arme, in die eigne Werkstatt; das
   ist mehr als Gnade, es ist Bürgerrecht.

## Quellen

- Cloud Pricing: <https://trigger.dev/pricing>
- Limits: <https://trigger.dev/docs/limits>
- Usage & Billing (Changelog): <https://trigger.dev/changelog/usage-and-billing>

Die Quellen enthalten — man erinnere sich der Concurrency-Zeile —
den Widerspruch selbst (die Preisseite und die Grenzseite, welche
voneinander abweichen); wer die genaue Zahl braucht, lese beide und
vertraue der neueren — die Lehre von den zwei Büchern gehört zur
Quellenkunde wie die Doppeltreibung zur Geldkunde: es gibt sie, und
das Wissen um sie ist die halbe Meisterschaft.

## Vermittelte Verhältnisse

Dies Kapitel ist das Amt der Sammlung — die Arbeit als Aufgabe;
seine Verwandten sind die Bühne ([FREE-TIER.md](../modal/FREE-TIER.md):
die Modalität des Rechnens), das Bauwesen
([FREE-TIER.md](../circle-ci/FREE-TIER.md): die Credits der Arbeit),
die Uhren ([FREE-TIER.md](../cloudflare/FREE-TIER.md) und die
anderen Cron-Häuser: das Zeitmaß überall), und sein Bürgerrecht
(verlaß die Wolke, nimm das Werk) verbindet es mit der
Selbstbetriebs-Tafel von [helpers.md](../helpers.md) und dem
Beispiele des Medusa-Stapels
([examples/04-medusa-shop](https://github.com/Golden-Apple-Research/free-tier/examples/04-medusa-shop)),
welcher dieselbe Wahl in die Tat umsetzt. Wer dies Kapitel liest
und sich fragt, wozu eine Welt der ausgelösten Aufgaben gut sei,
der antworte sich mit der Sammlung: zu allem, was nicht wartet,
weil es gerufen wird — und das ist die halbe Welt der Arbeit; die
andere Hälfte baut CircleCI.
