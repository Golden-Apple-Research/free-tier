# Vercel Hobby Plan (Free Tier)

> Vercels kostenloser **Hobby Plan** ist dauerhaft gratis, aber ausdrücklich
> **nicht-kommerziell** (persönliche Projekte, Learning). Limits werden als
> harte Stops durchgesetzt: Bei Überschreitung pausiert das Feature — es gibt
> keine Überraschungsrechnung, aber auch kein Zukauf.

Die Bedingung, welche der Kasten ausspricht, ist die moralische
Ausnahme der ganzen Sammlung: das Umsonst, welches nicht nach der
Menge, sondern nach dem Zwecke fragt. Überall sonst gilt: wer die
Grenze hält, bekommt die Gabe; hier gilt: wer die Grenze hält UND
kein Geld machen will — der Hobby-Plan, das Umsonst des
Hobbyisten, ausdrücklich nicht-kommerziell, die Gabe mit der
Gesinnungs-Klausel. Die Philosophie dieser Klausel ist es wert, einen
Augenblick erwogen zu werden: das Haus scheidet die Nutzer nicht
nach der Größe, sondern nach der Gesinnung ihres Tuns (persönlich,
ler-nend — die zwei unschuldigen Zwecke), und die Scheidung ist
keine Form (der Parser liest keine Absichten), sondern eine
Klausel, welche bei Zuwiderhandlung erwacht — die Fair-Use-Richte,
von welcher die erste Gotcha handelt. Man kann darin die alte
Unterscheidung des Rechtes wiederfinden: die Gebrauchsrechte nach
der Art des Gebrauchs, die Lizenz, welche das private Vergnügen
freistellt und das Erwerbsgeschäft ausschließt — Vercel als der
Verleger, welcher die Probeabzüge verschenkt und das Drucken
bezahlt verlangt; und die Grenzen (die harten Stops: Pause statt
Rechnung) zeigen die Familie: die Stoppenden
([FREE-TIER.md](../supabase/FREE-TIER.md),
[FREE-TIER.md](../grafana/FREE-TIER.md)) — aber hier ist es kein
Quota, sondern die Pflicht, welche die Pause auslöst: das System
fragt zuerst WOZU, dann WIEVIEL.

## Enthaltene Kontingente (pro Monat)

| Resource | Wofür ist das? | Hobby |
|---|---|---|
| **Fast Data Transfer** (Bandbreite CDN → Nutzer) | Bandbreite, die Vercels CDN an deine Besucher ausliefert (HTML, Bilder, API-Antworten) | 100 GB |
| **[Vercel Functions Invocations](https://vercel.com/docs/functions)** | Serverlose Backend-Funktionen (Node, Python, Go …) — z. B. API-Routen in Next.js | 1.000.000 |
| **Functions Active CPU** | Rechenzeit, die diese Funktionen tatsächlich laufen — CPU-Stunden statt Wanduhr | 4 CPU-Stunden (+ 360 GB-h Provisioned Memory) |
| **[Edge Requests](https://vercel.com/docs/functions/runtimes/edge)** (Middleware/Edge Functions) | Leichtgewichtiger Code am CDN-Randpunkt, der vor jedem Request läuft (Auth-Checks, Rewrites) | 1.000.000 |
| **[Image Transformations](https://vercel.com/docs/image-optimization)** | On-the-Fly-Bildoptimierung: resize, WebP/AVIF-Konvertierung via `next/image` oder Image CDN | 5.000 (plus 300 K Image-Cache-Reads, 100 K Writes) |
| **Deployments** | Git-Push = Build + Deploy; jedes Deployment bekommt eine eigene URL (Previews inklusive) | 100 pro Tag (Soft Limit) |
| **[Cron Jobs](https://vercel.com/docs/cron-jobs)** | Geplante Functions-Aufrufe per Cron-Syntax — im Hobby-Plan nur Tages-Präzision | 100 pro Projekt, aber **min. einmal täglich**, Stunden-Präzision (±59 min) |
| **Builds** | Die Build-Maschinen, die aus dem Repo das Deployment schnüren | 45 Min./Build, 1 gleichzeitiger Build, 2 vCPU / 8 GB RAM |
| **Seats** | Plätze für Team-Mitglieder — Hobby ist strikt Einzelnutzer | 1 (keine Team-Kollaboration) |

Die Tafel ist die klassische der Erscheinungs-Häuser, und ihre
Zeilen ordnen sich um das bekannte Dreieck: der Gang (100 GB — das
Geleit, gemessen wie überall), die Tätigkeit (die Million Rufe und
die vier CPU-Stunden — die Vermittlung mit der Zeitform des
Ernstes: nicht Wanduhr, sondern gerechnete Zeit, die ehrliche Form
der Abrechnung), der Rand (die zweite Million, für die Wächter vor
der Tür — Auth-Checks und Umleitungen, dieselbe Kategorie wie
Cloudflares Rand [FREE-TIER.md](../cloudflare/FREE-TIER.md), hier
der eignen Mitte vorgelagert), die Werke (hundert Würfe täglich —
ein weiches Limit, die Klammer sagt es: die erste Mahnung, nicht
die letzte), die Uhren (hundert Cron-Aufe pro Projekte, aber nur
mit Tages-Ungenauigkeit — die ±59 Minuten, welche die Kleinstadt
der genauen Zeitläufe zur Postkutsche machen: einmal täglich, und
wann genau, entscheidet das Haus) und die eine Sitzung (ein Platz —
das Umsonst des Einzelnen, ausdrücklich: keine Team-Welt).

## Verhalten bei Limit-Überschreitung

- Feature wird **für 30 Tage pausiert** (Web Analytics nur 7 Tage) — keine
  Abrechnung, kein Auto-Upgrade.
- Danach Reset bzw. manuelles Upgrade auf **Pro ($20/Monat)**: 1 TB Fast Data
  Transfer, minutengenaue Cron Jobs, Team-Features, kommerzielle Nutzung.

Die Pause ist die Strafe der Ruhe: das überschrittene Ding wird
dreißig Tage schlafen gelegt (nicht gelöscht, nicht bezahlt —
stillgestellt), und die kleine Ausnahme (die Web-Anschauung nur
sieben Tage: die Statistik hat die kürzere Buße, weil sie das
Flüchtigste ist) zeigt die innere Ordnung des Hauses; der Ausgang
danach (Reset oder Aufstieg — Zwanzig Dollar für das Tausendfache
des Ganges und die Erlaubnis des Geldverdienens) rundet das Bild:
die Grenze und die Klausel zusammen sind der Rand des Plans, und
beide kosten dasselbe Ticket.

## Gotchas

1. **Keine kommerzielle Nutzung erlaubt** — selbst kleine Monetarisierung
   (Ads, SaaS, Landingpage für Firma) verletzt die Fair-Use-Richtlinien und
   ist der häufigste Grund, vor allen Limits auf Pro upgraden zu müssen.
   Die erste Lehre ist die Klausel in ihrer Alltagsgestalt: die kleine
   Monetarisierung (die Werbung, das Abo, die Firmenseite — die unschuldig
   beginnenden Formen des Erwerbs) genügt zur Verletzung, und der
   häufigste Aufstiegsgrund ist NICHT das Limit, sondern die Gesinnung:
   der Erfolg im Kleinen erzwingt den Kauf im Großen. Es ist die
   klügste Preis-Politik der Sammlung (das Umsonst wird durch den
   Erfolg selbst unbrauchbar — die Grenze wächst mit dem Werke), und
   die Fair-Use-Richte ist ihr Vollstrecker; wer sie kennt, plant
   ehrlich: das private Vergnügen im Hobby, das erste Geld im Pro —
   und die Grenze zwischen beiden ist nicht technisch, sondern
   bürgerlich.

2. Cron Jobs auf Hobby laufen **nur maximal 1×/Tag** mit ±59 min Ungenauigkeit —
   für eng getaktete Schedules unbrauchbar.
   Die zweite ist die Uhren-Lehre im Einzelnen: einmal täglich, und
   die Stunde ungewiß (±59 — fast die ganze Stunde!): die Kutsche
   gegen die Bahn ([FREE-TIER.md](../triggerdev/FREE-TIER.md) und
   die andern Cron-Häuser fahren genauer); wer eng getaktet schalten
   will, braucht den Ernstplan oder das auswärtige Amt — und die
   Sammlung verzeichnet die Wahl: die Zeit als Billigware (hier) und
   die Zeit als Ware (drüben).

3. Bandbreite (100 GB) gilt nur für **Fast Data Transfer**; wer große
   Downloads/Videos ausliefert, ist schnell am Limit → Feature-Pause ohne
   Vorwarnung außer E-Mail.
   Die dritte ist die Heimtücke des guten Ganges: die hundert
   Gigabyte gelten dem schnellen Wegeg (HTML, Bilder, die API — die
   leichten Lasten), nicht den schweren (Downloads, Videos — die
   Frachtfuhren); wer letztere ausliefert, ist schnell am Ende, und
   die Pause kommt ohne Vorwarnung (außer der Mail — die stillste
   aller Warnungen, welche nur liest, wer sie erwartet); es ist die
   feine Unterscheidung des Verkehrs nach seiner Würde, und der
   Nutzer tut gut, seine Güter zu sortieren, ehe er sie schickt:
   das Leichte dem schnellen Gange, das Schwere dem R2 des Randes
   ([FREE-TIER.md](../cloudflare/FREE-TIER.md) — der Ausgang ohne
   Entrichtung) oder dem bezahlten Wege.

4. 100 Deployments/Tag sind ein Soft Limit — CI-Spam (Preview-Deploys pro Push)
   kann Vercel zur Drosselung veranlassen.
   Die vierte ist die Lehre vom geschäftigen Werke: die hundert
   Würfe sind weich, aber nicht unendlich weich — die Pipeline,
   welche jeden Stoß zum Wurfe macht, kann die Drossel wecken; die
   Eleganz des Hauses (jede Anfrage wird automatisch zum Wurfe mit
   eigner Adresse — die Vorschau-Welt, welche Netlify mit seinen
   unbegrenzten Previews großzügiger gibt
   [FREE-TIER.md](../netlify/FREE-TIER.md)) hat ihren Preis in der
   eignen Tätigkeit: die Bequemlichkeit erzeugt die Menge, und die
   Menge die Grenze — dieselbe Lehre, welche
   [TERRAFORM.md](../netlify/TERRAFORM.md) an der Deploy-Frequenz
   unter IaC zog (fünfzehn Credits der Währung für jeden Wurf!):
   die Formel ist billig im Setzen und teuer im Vollziehen.

5. Team-Kollaboration (Review-Flows, mehrere Seats) gibt es erst ab Pro —
   Hobby ist ein Single-User-Plan.
   Die letzte endlich ist die konsequente Einzelwirtschaft: ein
   Sitz, keine Runde — die Sammlung der Team-Grenzen (Netlifys
   Zuschauer, Grafas drei Tätige, CircleCIs fünf Aktive) hat hier
   ihren klarsten Fall: das Umsonst des Einzelnen, das Mit- einander
   als Ware; und es paßt zur Klausel des Anfangs (nicht-kommerziell
   — die Einzelwirtschaft als die natürliche Form des privaten
   Zwecks): wer gemeinsam will, will ein Unternehmen, und das
   Unternehmen zahlt. Die konsequenteste Moral des Hauses, und die
   runde.

## Quellen

- Hobby Plan Details: <https://vercel.com/docs/plans/hobby>
- Pricing: <https://vercel.com/pricing>
- Cron-Jobs-Limits: <https://vercel.com/docs/cron-jobs/usage-and-pricing>
- Limits & Fair Use: <https://vercel.com/docs/limits/fair-use-guidelines>

Die vierte Quelle — die Fair-Use-Richte — ist das eigentliche
Grundgesetz dieses Plans (die Klausel im Wortlaute), und wer dies
Kapitel mit Einer Quelle liest, lese diese; die andern drei sind die
Erläuterungen der Grenzen, welche die Richte umsetzt, wenn sie
erwacht.

## Vermittelte Verhältnisse

Dies Kapitel gehört zur Familie des Erscheinens — neben
[FREE-TIER.md](../netlify/FREE-TIER.md) (die Währung),
[FREE-TIER.md](../cloudflare/FREE-TIER.md) (die Maßlosigkeit am
Rande) und [FREE-TIER.md](../render/FREE-TIER.md) (die Halle mit
Schlaf) —, und es bildet in dieser Familie das Glied der
GESINNUNG: überall sonst fragen die Häuser Wieviel, hier Wozu; die
Ausweise verwaltet [README.md](README.md) (der geschnittene
Personen-Token — die feinste Form der Zeichen), der Begriff
[TERRAFORM.md](TERRAFORM.md) (die Arbeitsteilung von Hull und
Sailen); und wer die Familie komplett liest, wird den Zug der Zeit
erkennen, welchen die Sammlung mehrfach andeutete: von den Maßen
zur Währung, von der Währung zur Maßlosigkeit, von allem zur
Klausel — die Zukunft des Erscheinens wird die Frage nach dem Zwecke
sein, und dies Haus hat sie zuerst gestellt. Ob die Antwort der
Klausel (das private Vergnügen umsonst, das Erwerben bezahlt) die
letzte ist, wird sich zeigen; die Sammlung verzeichnet den Zustand
und hält das Urteil zurück, wie es sich für Verzeichnisse gehört —
und wie die Eule der Minerva, welche dies ganze Werk über den
Dokumenten der Wolken kreisen ließ, am besten weiß.
