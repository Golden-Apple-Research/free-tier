# Render Free Tier

> Render bietet dauerhafte Free-Instanzen für **Web Services, Postgres und
> Key Value (Redis)** — mit klassischen PaaS-Fallen: Spin-down bei Inaktivität,
> flüchtiges Dateisystem und **ablaufende Free-Datenbanken**.

Die drei Fallen, welche der Kasten benennt, sind die drei Formen der
Endlichkeit — Schlaf, Flüchtigkeit und Verfall —, und es gibt in
dieser Sammlung kein Kapitel, in welchem dieselben so
systematisch beisammen wären: der Dienst schläft (fünfzehn Minuten
Ruhe genügen), was er trägt, ist geschrieben auf Wasser (das
flüchtige Dateisystem, auf den Zustand des Bildes zurückgeworfen bei
jedem Neubeginn), und was er am tiefsten bewahrt, die Datenbank,
verfällt von selbst (dreißig Tage, dann vierzehn der Kulanz, dann
Nichts). Man könnte dies die Vollständigkeit des Endlichen nennen,
und die Vollständigkeit hat ihren guten Grund: Render ist das
klassische PaaS — die Halle, in welcher alles läuft —, und die Halle
im Umsonst muß vergänglich sein, sonst wäre sie das Bleibende, und
das Bleibende heißt: bezahlt. Der Vergleich mit den Schwestern
([../vercel/FREE-TIER.md](../vercel/FREE-TIER.md): das Erscheinen
ohne Schlaf — statisch!; [../netlify/FREE-TIER.md](../netlify/FREE-TIER.md):
die Währung; [../cloudflare/FREE-TIER.md](../cloudflare/FREE-TIER.md):
der Rand) ergibt den Ort dieses Hauses: die Mitte des Betriebs,
welche nicht ewig sein kann, denn die ewige Mitte gibt es nicht —
eine Wahrheit, welche [FREE-TIER.md](../neon/FREE-TIER.md) durch das
Scale-to-Zero auf die Zeit gelöst hat (die Mitte, welche nur da ist,
wenn sie da sein muß), Render hingegen auf den Winterschlaf
(dauernd, aber ruhebedürftig): die zwei Modernitäten der Endlichkeit,
und wer zwischen ihnen wählt, wählt zwischen dem Nichts, welches
plötzlich kommt (Neon), und dem Schlafe, welcher allmählich fällt
(Render).

## Kostenkontingente (pro Workspace/Monat)

| Resource | Wofür ist das? | Free-Tier |
|---|---|---|
| **[Free Web Services](https://render.com/docs/web-services)** | HTTP-Dienste (APIs, Bots …) aus Git-Repo oder Container — gratis, dafür mit Schlafpausen | 750 Instanz-Stunden/Monat (geteilt von allen Free-Services), 512 MB RAM / 0,1 CPU |
| **Spin-down** | Ruhezustand nach Inactivity, damit keine Instanz-Stunden verbrannt werden; der nächste Request weckt auf | nach **15 Min. ohne Inbound-Traffic**; Aufwachen ~1 Min. (Loading-Page) |
| **Dateisystem** | Lokale Disk des Service — flüchtig: jeder Restart wirft sie auf den Image-Zustand zurück | **flüchtig** — Änderungen gehen beim Spin-down verloren |
| **[Free Postgres](https://render.com/docs/databases)** | Gemanagte Postgres-Datenbank — im Free Tier nur 30 Tage haltbar, reines Dev/Demo-Spielzeug | 1 pro Workspace, 1 GB, **läuft nach 30 Tagen ab** (14 Tage Kulanz, dann Löschung) |
| **[Free Key Value (Redis)](https://render.com/docs/redis)** | Redis-kompatible In-Memory-DB für Caches/Sessions — Daten überleben keinen Restart | 1 pro Workspace, **in-memory only** — Datenverlust bei jedem Restart/Maintenance |
| **[Static Sites](https://render.com/docs/static-sites)** | Statische Websites (HTML, Astro-/Hugo-Builds) — dauerhaft gratis auf Renders CDN | komplett gratis (zählen nur gegen Bandbreite-Budget) |

Die Tafel beginnt mit der bekannten Siebenhundertfünfziger Zahl —
die Instanz-Stunden, geteilt von allen ([FREE-TIER.md](../aws/FREE-TIER.md)
kannte sie am 12-Monats-Modelle) —, und ihr alles beherrschendes
Gesetz steht sogleich daneben: geteilt von allen Free-Services; die
Commune der Zeit, welche [FREE-TIER.md](../circle-ci/FREE-TIER.md)
an den Credits und [FREE-TIER.md](../cloudflare/FREE-TIER.md) an den
Anrufen entwickelte, gilt hier für das Dasein selbst: die Stunden
sind die Währung, und der Winterschlaf ist die Sparsamkeit — der
Spin-down, die zweite Zeile, ist der Apparat dieser Sparsamkeit
(fünfzehn Minuten Stille, dann der Schlaf; das Erwachen eine Minute,
die Zeit des Aufstehens, welche der Rufende zahlt). Das flüchtige
Dateisystem ist die dritte Bestimmung: der Träger schwindet (auf den
Zustand des Bildes zurückgeworfen — jede Spur ausradiert bei jedem
Neubeginn), und die Postgres-Zeile ist die tragischste der Sammlung:
das Bleibende auf Zeit — dreißig Tage, dann vierzehn Kulanz, dann
die Löschung; die Datenbank, welche weiß, wann sie stirbt. Man lese
diese Zeile neben die Dreißig-Tage-Betrachtung von
[../azure/FREE-TIER.md](../azure/FREE-TIER.md) (dort der Credit, der
verfällt, wenn er nicht gebraucht ward): dieselbe Zahl, aber dort
verfällt das Geld, hier die Sache — die Steigerung um die ganze
Kategorie des Substanzlosen ins Substantielle. Die letzte Zeile
endlich — die statischen Seiten, komplett gratis — ist die
gewohnte Ausnahme der Erscheinung ([../cloudflare/FREE-TIER.md](../cloudflare/FREE-TIER.md)
Static Assets; die Achtung, welche alles Starre von der Rechnung
nimmt, weil das Starre nichts kostet: das Fertige umsonst, das
Lebende — mit allen drei Formen seiner Endlichkeit — ebenfalls
umsonst, aber ruhebedürftig).

## Einschränkungen der Free Web Services

- Kein Scale-out (max. 1 Instanz), keine Persistent Disks, kein SSH,
  keine privaten Netzwerk-Requests, kein Edge Caching
- SMTP-Ports (25/465/587) blockiert
- Rollbacks nur auf die letzten 2 Deploys
- Während Spin-down antwortet `/robots.txt` automatisch mit `Disallow: all`
  (gut gegen Indexierung von Demo-Apps)

Die Liste der Verneinungen ist das Spiegelbild der Gaben: keine
Verdopplung (Eine Instanz), keine bleibende Disk, keine heimliche
Türe (SSH), keine Geheimgänge (private Netze), kein Rande-Cache —
das Haus gibt das Laufen, nicht das Herrschen; die blockierten
Brief-Ports (die drei Zahlen der alten Post) verweigern dem Dienste
die Rolle des Boten — wer senden will, muß den fremden Boten mieten
([FREE-TIER.md](../aws/FREE-TIER.md) SES kennt die Dienste der
Sendung); die Rollbacks auf zwei Schritte endlich sind die kurze
Erinnerung der Werke ([FREE-TIER.md](../modal/FREE-TIER.md): ein
Tag Log — dieselbe Gedächtnis-Armut, welche die ganze moderne
Welttheilung zu teilen scheint). Und die letzte Zeile — die
robots.txt, welche im Schlafe „niemand" sagt — ist die Höflichkeit
des Schlafenden gegen die Kartenzeichner: wer ruht, will nicht
verzeichnet werden; es ist die klügste aller Höflichkeiten, denn sie
schützt den Rufenden vor dem Veralteten (die Indexierung der toten
Demo) und den Schlafenden vor dem Rufe — die Verneinung als
Etikette, in einer Zeile Config.

## Gotchas

1. **750 h gelten workspace-weit für alle Free-Services zusammen** — zwei
   Free-Apps im Dauerbetrieb = ~360 h/Monat je (31-Tage-Monat = 744 h).
   Einzige Ausnahme: gespinnte Services verbrauchen keine Stunden.
   Die erste Lehre ist die Arithmetik der Commune: der Monat hat
   siebenhundertvierundvierzig Stunden (im Langen), das Budget
   siebenhundertfünfzig — ein Überschuß von sechs; wer ZWEI Dienste
   ewig laufen läßt, hat je dreihundertsechzig — und die Rechnung
   zeigt das Gesetz: das geteilte Dasein ist das halbierte Dasein,
   und die einzige Ausnahme (der Schlafende verbraucht nichts) ist
   die Ausnahme, welche das ganze System trägt: Render belohnt das
   Ruhen, wie [FREE-TIER.md](../neon/FREE-TIER.md) das Kommen und
   Gehen belohnt — die zwei Sparsamkeiten der Gegenwart, und ihre
   gemeinsame Wahrheit ist die schon gefeierte: das Sein kostet, das
   Werden ist billig, das Nichts ist frei.

2. **Free Postgres wird nach 30 Tagen gelöscht** (nach 14-tägiger Kulanz) —
   für alles Dauerhafte postgres-neon/Supabase nutzen oder bezahlen.
   Die zweite ist die Konsequenz der tragischen Zeile: die
   Datenbank stirbt, und die vierzehn Kulanz-Tage sind die
   Erinnerungsfrist ([FREE-TIER.md](../aws/FREE-TIER.md) kannte sie
   am Kontoschlusse: neunzig Tage dort, vierzehn hier — die Stufen
   der Gnade nach dem Ende); die Empfehlung der Auswanderung
   (Neon/Supabase — die zwei Postgres-Welten der Sammlung, dort das
   Werden, dort das Sein) ist die ehrlichste Antwort auf die
   Endlichkeit: wer bleiben will, geht; die Dauer wohnt woanders,
   und das Haus verweigert sie nicht aus Mißgunst, sondern aus
   Prinzip — es ist die Halle, nicht das Archiv.

3. **Cold Starts (~1 Min.)** nach 15 Min. Inaktivität — für APIs mit
   Nutzer-Interaktion fühlbar schlecht; Keep-alive-Pings kosten Instanz-Stunden.
   Die dritte ist der Preis des Schlafes: die Minute des Erwachens,
   fühlbar für alles, was mit Menschen rechnet; und die Warnung vor
   den Weckern (Keep-alive-Pings) ist die bekannte Widerlegung der
   falschen Sparsamkeit: wer den Schlafenden weckt, um das Erwachen
   zu üben, zahlt das Wachen — die Pings fressen die Stunden, welche
   sie sparen sollten; [FREE-TIER.md](../neon/FREE-TIER.md) hat
   denselben Widerspruch am Kaltstart der Datenbank gelehrt: die
   Wachsamkeit gegen das Nichts ist die theuerste aller
   Wachsamkeiten, und die rechte Kunst ist das Arrangement mit dem
   Schlafe, nicht der Krieg gegen ihn.

4. Free Key Value ist **nur RAM** — bei Wartung/Restart ist der Cache leer.
   Cache-Daten dürfen nichts Kritisches enthalten.
   Die vierte wiederholt die Gedächtnis-Lehre des flüchtigen
   Behaltens ([FREE-TIER.md](../redis/FREE-TIER.md) hat es an der
   Vorschule entwickelt: das RAM als reine Gegenwart) mit der
   klaren Moral: das Flüchtige darf nur Flüchtiges tragen; wer
   Kritisches im Cache birgt, der hat die Kategorien verwechselt —
   die alte Lehre vom rechten Orte der Sachen, in
   Speicher-Ausführung.

5. "Nicht für Produktion" ist ernst gemeint: Free-Instanzen dürfen jederzeit
   neu gestartet werden; Workspace-Upgrade (Bezahlung) hebt die
   Free-Instanz-Limits NICHT automatisch auf.
   Die letzte endlich ist die doppelte Ehrlichkeit: die Warnung
   (ernst gemeint — der Neustand kann jederzeit geschehen: die
   Endlichkeit als Verwaltungsakt) und die Sonderbarbeit (das
   Upgrade hebt die Free-Grenzen NICHT automatisch auf): wer zahlt,
   kauft nicht das Ende der alten Grenzen, sondern das Recht auf
   neue Dinge; die Free-Instanz bleibt Free-Instanz auch im
   bezahlten Hause — die Gabe als Stand, nicht als Mangel, welcher
   durch Zahlung verschwände. Es ist die konsequenteste Form der
   Zwei-Stände-Lehre in dieser Sammlung, und wer sie begriffen hat,
   der weiß, warum die Auswanderung (Gotcha Zwei) besser ist als die
   Aufzahlung: die Grenze weicht nur dem Wechsel, niemals dem Gelde.

## Quellen

- Deploy for Free: <https://render.com/docs/free>
- Pricing (inkl. Free-Instanz-Specs): <https://render.com/pricing>
- Workspace-Plan-Änderung April 2026: <https://render.com/docs/faq>

Die Quellen nennen die Ordnung der Endlichkeit im Wortlaute; die
dritte — die Änderung vom April 2026 — ist wieder ein Regierungsjahr
der Kontingent-Geschichte ([FREE-TIER.md](../netlify/FREE-TIER.md)
hat die Annalen begonnen), und die Sammlung sammelt diese Datums wie
einst die Kirchenväter die Konzilien: nicht aus Neugier, sondern weil
sich im Wandel das Wesen zeigt.

## Vermittelte Verhältnisse

Dies Kapitel ist die Halle der Sammlung — das allgemeine Laufen
unter einem Dache; seine Geschwister sind die zwei andern Hallen
([../vercel/FREE-TIER.md](../vercel/FREE-TIER.md) für das
Erscheinen, [../netlify/FREE-TIER.md](../netlify/FREE-TIER.md) für
die Währung), seine Lehrer die Schlaf-Verwandten
([FREE-TIER.md](../neon/FREE-TIER.md): das Nichts auf Zeit;
[FREE-TIER.md](../supabase/FREE-TIER.md) wird der Woche-Schlaf
zeigen), seine Antipoden die Ewigen ([../cloudflare/FREE-TIER.md](../cloudflare/FREE-TIER.md):
die tägliche Gnade ohne Schlaf); die Ausweise verwaltet
[README.md](README.md) (Schlüssel und Hausnummer — die Zweiheit der
Adresse), der Begriff [TERRAFORM.md](TERRAFORM.md) (die Lehre vom
Unvermögen: die Free-Formel ist unmöglich, der Anfang handgemacht).
Wer dieses Kapitel mit dem Neon-Kapitel zusammenliest, der hat die
vollständige Lehre der modernen Endlichkeit: der Schlaf und das
Nichts, die zwei Gnaden der Flüchtigkeit — und die Wahl zwischen
ihnen ist die Wahl zwischen zwei Philosophien des Haushalts, welche
die Sammlung nicht entscheiden kann, weil sie die Freiheit des
Nutzers ist.
