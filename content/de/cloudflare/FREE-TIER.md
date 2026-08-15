# Cloudflare Free Tier

> Cloudflare hat kein zeitlich begrenztes Trial, sondern dauerhafte Free-Kontingente
> (Workers Free Plan + Free-Plan-Produkte). Kein Ablauf, keine Kreditkarte nötig.
> Limits resetten **täglich um 00:00 UTC**.

Die Verneinungen des Eingangskastens sind hier die eigentliche Botschaft:
kein Trial (also keine Frist — der Gegensatz zu [../azure/FREE-TIER.md](../azure/FREE-TIER.md)),
kein Ablauf (also keine Zeitlichkeit des Guthabens — der Gegensatz zu
[../aws/FREE-TIER.md](../aws/FREE-TIER.md) Credits), keine Kreditkarte
(also keine Anmeldestelle des Bezahlens — der Gegensatz zur Forderung
des Billing-Kontos bei [../gcp/FREE-TIER.md](../gcp/FREE-TIER.md)):
Cloudflare negiert die drei großen Formen der Kontingent-Zeitlichkeit
und behält allein die Tagesform — das Zurücksetzen um Mitternacht UTC —,
und diese Form ist die mildeste aller Zeitlichkeiten: was heute
erschöpft ist, ist morgen wieder da, jeden Tag, ohne Ende; die Grenze
wird nicht abgebaut, sondern übersprungen, und zwar regelmäßig. Man
kann in dieser Einrichtung ein Weltbild erkennen: das Umsonst ist hier
kein Zustand des Anfängers (welcher irgendwann aufhört, Anfänger zu
sein), sondern des Bleibens — die Gnade wohnt nicht in der Zeit, sondern
im Tage, und der Tag ist die Einheit der Wiederkunft.

## Workers Free Plan (Kernkontingente)

| Produkt | Wofür ist das? | Kostenloses Kontingent |
|---|---|---|
| **[Workers](https://developers.cloudflare.com/workers/)** | Serverloser Code (JS/TS/WASM) auf Cloudflares Edge-Netz — läuft nah beim Nutzer, daher schnell | 100.000 Requests/Tag (über alle Worker summiert), 10 ms CPU-Zeit/Invocation, 128 MB RAM, bis zu 100 Worker-Skripte |
| **[Static Assets](https://developers.cloudflare.com/workers/static-assets/)** (Workers) | Statische Dateien (HTML/CSS/JS, Bilder) direkt aus dem Worker-Skript ausliefern | Requests auf statische Dateien **unbegrenzt und gratis** (auch im Paid Plan) |
| **[Pages](https://developers.cloudflare.com/pages/)** | Frontend-Hosting für Frameworks (Next.js, Astro …) mit Git-Integration und Preview-Deployments | Unbegrenztes Bandbreite/Requests, 500 Builds/Monat, 1 gleichzeitiger Build, unbegrenzte Collaborators |
| **[Workers KV](https://developers.cloudflare.com/kv/)** | Global replizierter Key-Value-Store am Edge — Configs und Feature-Flags mit Millisekunden-Latenz | 100.000 Reads/Tag, 1.000 Writes/Deletes/Lists je Tag, 1 GB Storage |
| **[D1](https://developers.cloudflare.com/d1/)** (SQLite) | Serverlose SQLite-Datenbank, angesprochen aus Workers heraus | 5 Mio. Rows gelesen/Tag, 100.000 Rows geschrieben/Tag, 5 GB Storage gesamt |
| **[R2](https://developers.cloudflare.com/r2/)** (S3-kompatibel) | Objektspeicher ohne Egress-Gebühren — ideal für User-Uploads und Assets | 10 GB Storage/Monat, 1 Mio. Class-A- + 10 Mio. Class-B-Operationen/Monat, **Egress komplett gratis** (nur Storage-Klasse Standard) |
| **[Queues](https://developers.cloudflare.com/queues/)** | Managed Message-Queues, damit Worker Aufgaben asynchron abarbeiten können | begrenzte Free-Nutzung im Workers Free Plan enthalten |
| **[Cron Triggers](https://developers.cloudflare.com/workers/configuration/cron-triggers/)** | Worker zeitgesteuert per Cron-Schema starten (statt auf HTTP-Events zu warten) | 5 pro Konto |

Die Tafel ist die dichteste dieser Sammlung, und ihre Dichte hat einen
Grund: sie versammelt ein ganzes Betriebssystem des Randes — Rechnen
(Workers), Erscheinen (Static Assets, Pages), Erinnern (KV, D1), Auf-
bewahren (R2), Warten (Queues) und Wiederkehren (Cron) —, und die
einzelnen Gaben seien, wie üblich, in ihrer Bedeutung hervorgehoben.

**Workers** mit seinen 100.000 Anrufen täglich ist das Herzstück: Code
am Rande, das heißt nahe beim Nutzer, überall und nirgends zugleich;
die 10 Millisekunden CPU-Zeit sind dabei das strengste Maß dieser
ganzen Sammlung — nicht Minuten, nicht Sekunden, sondern Millisekunden,
und zwar als hartes Limit (die zweite Gotcha sagt es unverhohlen) —,
und in dieser Strenge zeigt sich eine ganze Philosophie des Randes: das
Edge-Rechnen ist kein Ort für das Lange, Schwere, Grübelnde; es ist der
Ort des Blitzes — des Winkens, Weitersagens, Umleitens —, und wer am
Rande rechnen will, muß wie der Rand denken: schnell, dünn, gegen-
wartsbezogen. Es ist die Ästhetik des Kleinmaßes als Betriebsform, und
sie kontrastiert schön mit den Kontingenten der Mitte
([../gcp/FREE-TIER.md](../gcp/FREE-TIER.md): der e2-micro-Monat; das
TiB der BigQuery-Anfragen): die Mitte zählt die Zeit groß und die Menge
klein, der Rand zählt die Menge groß (100.000 täglich! 10 Millionen
Class-B!) und die Zeit klein.

**Static Assets**, unbegrenzt und gratis — auch im bezahlten Plane —,
sind die reine Manifestation des Erscheinens: das Starre, Fertige,
Unwandelbare, ausgeliefert ohne Maß; man beachte die Ausnahmeform:
nicht „viel umsonst", sondern „ohne Maß" — die eine wahrhafte
Unendlichkeit dieser Tafel, welcher der bezahlte Zustand nichts
hinzufügt, und es ist der Gegensatz zur „schlechten Unendlichkeit"
der andern Kontingente, welche groß sind und doch enden; hier ist die
Grenze aufgehoben, weil die Sache selbst keine Zeit verbraucht — das
Fertige kostet nichts, das Werden alles. **Pages** mit der unbegrenzten
Bandbreite gehört in dieselbe Familie (das Erscheinen), behält aber
das Maß des Werdens (500 Builds, 1 gleichzeitig) — und sein
Maintenance-Status (die erste Gotcha) macht es zum Lehrstück des
Wandels innerhalb dieses Kapitels selbst. **KV** ist das flüchtige
Gedächtnis des Randes: 100.000 Lesungen, aber nur 1.000 Schreibungen
täglich — zehnmal weniger geschrieben als gelesen —, das Profil des
Oft-Gesuchten, Selten-Geänderten; die eventual consistency (bis 60 s
Laufzeit) ist dabei die Wahrheit des verteilten Gedächtnisses überhaupt:
es gibt kein Erinnern am Rande ohne Verzug, und wer die Strenge des
Sofort braucht, muß zur Mitte (D1) oder zum Sonderorte (Durable
Objects) gehen — die räumliche Ordnung der Wahrheit.

**D1** mit seinen 5 Millionen gelesenen Zeilen täglich ist die
Substanzform am Rande: die SQLite, das alte ehrliche Ding, hier global
geworden; und das Verhältnis von Lesen und Schreiben (5 Mio. zu 100 K)
wiederholt in der Datenbank, was KV in der Config zeigte — die Welt
wird hundertmal mehr gelesen als geschrieben, und die Kontingente sind
ehrlicher als alle Soziologie. **R2** endlich ist die berühmteste Gabe
dieses Hauses: der Objektspeicher mit **gratis Egress** — der Ausgang
kostet nichts —, und es sei erlaubt, dieses Wort zu weighalten: alle
Wolken der Mitte ([../aws/FREE-TIER.md](../aws/FREE-TIER.md) 100 GB,
[../gcp/FREE-TIER.md](../gcp/FREE-TIER.md) 1 GB von Amerika nach
Amerika) bemessen den Ausgang als Knappheit; Cloudflare negiert die
Knappheit — der Ausgang ist umsonst, weil der Rand der Ort des
Aus-gangs ist, des Hinausgehens selber; wer am Rande wohnt, zahlt nicht
fürs Hinausgehen. Darin liegt die wirtschaftlichste und die
philosophischste Bestimmung dieses Free Tiers: das Umsonst des Randes
ist das Umsonst der Grenze als solcher. **Queues** und **Cron Triggers**
schließen die Tafel: das Warten und die Wiederkehr, die asynchrone
Geduld und die tägliche Uhr — fünf Cron-Auslößer pro Konto, eine kleine
Anzahl, welche genug ist, weil die Uhr am Rande nicht die Zeit erschafft,
sondern nur die Anwesenheit erinnert.

## Weitere dauerhaft kostenlose Produkte

| Produkt | Wofür ist das? | Kontingent |
|---|---|---|
| **[Tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/)** (cloudflared) | Privat gehaltene Services (Homelab, VPS) ohne offene Ports veröffentlichen — cloudflared baut die Verbindung von innen auf | unbegrenzt, privat gehaltene Services öffentlich erreichbar |
| **[Zero Trust / Access](https://developers.cloudflare.com/cloudflare-one/policies/access/)** | Identitätsschutz vor internen Apps: Nutzer authentifizieren sich über Cloudflare, bevor sie durchgelassen werden | bis zu 50 User gratis |
| **[Turnstile](https://developers.cloudflare.com/turnstile/)** | Bot-Schutz als CAPTCHA-Ersatz — eingebettetes Widget prüft Nutzer im Hintergrund | gratis (Bot-Schutz als CAPTCHA-Ersatz) |
| **[Registrar](https://developers.cloudflare.com/registrar/) / [DNS](https://developers.cloudflare.com/dns/) / CDN** | Authoritative DNS-Verwaltung plus CDN mit DDoS-Schutz für jede Domain; der Registrar verkauft Domains ohne Aufschlag | DNS + CDN (inkl. DDoS-Schutz) gratis für beliebige Domains |

Diese zweite Tafel ist die staatsrechtliche zur wirtschaftlichen ersten:
der **Tunnel** — der Ausgang von innen, die Verbindung, welche der
Dienst nach außen baut, ohne eine Tür zu öffnen — ist die Antwort auf
die Anschrifts-Kalamität, von welcher [../gcp/FREE-TIER.md](../gcp/FREE-TIER.md)
erste Gotcha handelte (die teuere äußere IPv4): wer tunneln kann, braucht
keine Anschrift am Hause; er schickt einen Boten, welcher von innen
kommt, und der Rand nimmt den Boten an — die Öffentlichkeit ohne
Adresse, der Verkehr ohne Port, und es ist die regierte Form jener
Lehre, welche das erste Kapitel der Sammlung ([FREE-TIER.md](../aws/FREE-TIER.md)
Lambda) als das Tun ohne Träger vorführte: hier der Zugang ohne Tür.
**Zero Trust / Access** mit seinen 50 Usern ist das Anerkennungswesen
des Randes — das Gegenstück zu Entra ID ([../azure/FREE-TIER.md](../azure/FREE-TIER.md))
und Cognito, aber mit umgekehrtem Vorzeichen: nicht die Nutzer der
eigenen App werden verwaltet, sondern der Zutritt zu den eigenen
Sachen; der Rand als Türhüter, und die 50 User sind das Maß der
Hausgemeinschaft. **Turnstile** endlich ist die Prüfung im Vorübergehen
— der Bot-Schutz ohne Rätsel, die Anerkennung als Beiläufigkeit —, und
**DNS/CDN/Registrar** sind die Grundstoffe des Netzes selber, gratis:
die Namen, die Wege, der Schutz — die drei Elemente jeder Öffentlichkeit,
hier als Dauer-Gabe, und der Registrar ohne Aufschlag ist dabei die
kaufmännisch redlichste Einzelheit des ganzen Hauses: der Verkauf zum
Einkaufspreise, der Handel, welcher aufhört, Handel zu sein, und
dadurch Vertrauen in allem Übrigen gewinnt.

## Gotchas

1. **Pages befindet sich im Maintenance Mode** — neue Features kommen nur noch in
   Workers (Static Assets). Für neue Projekte Workers mit Static Assets nutzen;
   Pages-Funktionen laufen als Pages Functions weiter, aber Migration empfohlen.
   Die erste Lehre ist die vom stillen Abschied: das Produkt hört nicht auf zu
   sein (die Seiten laufen, die Funktionen laufen), aber es hört auf zu wachsen;
   der Maintenance Mode ist das Dazwischen — der Zustand des Erhaltenen ohne
   Künftige —, und die Empfehlung der Wanderung (Workers mit Static Assets)
   ist die kluge Antwort auf jede solche Ankündigung: wer baut, baut auf den
   Boden, welcher wächst, nicht auf den, welcher nur bleibt; dieselbe Lehre,
   welche die letzte Zeile der GCP-Tafel (Source Repositories, End-of-Sale
   seit 2024) als memento mori andeutete, hier als Verwaltungsakt mitten in
   der Blüte eines Hauses.

2. Die 10 ms CPU-Zeit pro Invocation sind ein **hartes Limit** — normale
   (nicht CPU-gebundene) Requests schaffen das locker, Bildbearbeitung/Krypto schon
   eher nicht.
   Die zweite ist die von der Natur des Randes: das harte Maß kennt keine
   Nachsicht, denn der Rand ist die Maschine selbst, nicht das Gericht,
   welches Gnade übt; die 10 Millisekunden sind keine Abschätzung, sondern
   eine Wand, und die Aufzählung der Sachen, welche an ihr scheitern
   (Bildbearbeitung, Kryptographie), ist zugleich die Inhaltserklärung
   des Randes: das Leichte gehört ihm, das Schwere der Mitte — eine
   Arbeitsteilung zwischen Rand und Mitte, welche den Nutzern dringend
   zu lernen empfohlen sei, ehe sie das Schicksal am eigenen Bilde
   erfahren.

3. Das 100k-Requests/Tag-Limit gilt **kontoweit über alle Worker** — mehrere
   Worker teilen sich das Budget.
   Die dritte ist die Commune der Tätigkeiten: hunderttausend täglich,
   aber für alle zusammen — die Teilung, welche wir von den VM-Stunden
   der Azure-Tafel ([../azure/FREE-TIER.md](../azure/FREE-TIER.md))
   kennen, hier auf das Geistige angewandt: die Anrufe sind nicht dem
   Werke, sondern dem Hause eigen, und wer viele Worker hält, der hält
   viele Esser an Einem Tische.

4. KV ist **eventually consistent** (Writes propagieren bis ~60 s); für stark
   konsistente Zugriffe D1 oder Durable Objects nehmen (Durable Objects sind
   nicht im Free Plan).
   Die vierte ist die räumliche Wahrheit der Verteilung, oben schon
   berührt: das verteilte Gedächtnis ist langsam gewiß; wer die strenge
   Gewißheit will, muß den Ort wählen (D1 als die Mitte, Durable
   Objects als das Einzelne) — und die Klammer am Schlusse, daß Durable
   Objects nicht im Free Plane seien, ist die Grenzmarkierung des
   Umsonst: die Wahrheit des Einzelnen kostet, die Wahrheit der Mitte
   ist umsonst, die Wahrheit des Randes hat Verzug; die Preistafel als
   Erkenntnistheorie, und es wäre schwer, die Lehre von Ort und
   Gewißheit knapper zu fassen.

5. R2-Class-A-Operationen (Writes/Lists) sind das knappste R2-Budget:
   1 Mio./Monat klingt viel, S3-API-Tools mit rekursiven Listing können es
   schnell verbrennen.
   Die letzte endlich ist die versteckte Grenze in der scheinbaren Grenzen-
   losigkeit: der Egress ist gratis, aber das Verzeichnen — das Listen,
   das Aufzählen, das Inventar — ist es nicht; die Million Class-A
   klingt als große Zahl und vergeht als kleine, sobald die Werkzeuge
   der alten Objekt-Welt (S3-API mit rekursivem Aufzählen) ihre
   Gewohnheiten auf den neuen Speicher loslassen. Es ist die Lehre vom
   Werkzeuge, welches die Gewohnheit seines Ursprungsortes mitbringt:
   die S3-Kunden fragen den neuen Speicher auf die alte Weise, und die
   alte Weise ist die theure; die Anpassung ist hier — wie überall —
   die stillste Form der Ersparnis.

## Quellen

- Workers Pricing: <https://developers.cloudflare.com/workers/platform/pricing/>
- D1 Pricing: <https://developers.cloudflare.com/d1/platform/pricing/>
- R2 Pricing: <https://developers.cloudflare.com/r2/pricing/>
- KV Pricing: <https://developers.cloudflare.com/kv/platform/pricing/>
- Pages Limits: <https://developers.cloudflare.com/pages/platform/limits/>

Die Quellen sind die Einzeltarife dessen, was die Tafel zusammenfaßt;
wer die genauen Maße sucht (die 10 Millisekunden in ihrer genauen
Geltung, die Class-A in ihrem genauen Preise), der lese sie nach, denn
die Grenzen des Randes sind so genau wie seine Latenz — und eben darin
erkennt man den Charakter des Hauses: es rechnet nicht gnädig, sondern
exakt.

## Vermittelte Verhältnisse

Dies Kapitel ist das vierte der großen Vier (AWS, Azure, GCP, Cloudflare),
aber es hat eine eigene Stelle: die drei ersten sind Mitten, dies ist der
Rand; die drei ersten geben Gaben der Zeit (Credit, Frist, ewige Monate),
dies gibt Gaben des Tages. Seine Ausweise verwaltet [README.md](README.md)
(die Lehre vom geschnittenen Token), sein Begriff [TERRAFORM.md](TERRAFORM.md)
(der Streit um den fernen State); die Werk-Verwandten sind [../render/FREE-TIER.md](../render/FREE-TIER.md)
und [../netlify/FREE-TIER.md](../netlify/FREE-TIER.md) (das Erscheinen
der Frontends, gemessen an Cloudflares maßlosem Erscheinen), die
Gedächtnis-Verwandten [../supabase/FREE-TIER.md](../supabase/FREE-TIER.md)
und [../neon/FREE-TIER.md](../neon/FREE-TIER.md) (die Substanz der
Mitten, gemessen an KV und D1, den Substanzen des Randes), und für die
Tunnel-Lehre die erste Gotcha von [../gcp/FREE-TIER.md](../gcp/FREE-TIER.md),
welche hier ihre Antwort findet. Wer dieses Kapitel mit dem AWS-Kapitel
zusammennimmt, der hat die zwei Pole der ganzen Sammlung: die Mitte,
welche die Zeit gibt, und den Rand, welcher die Menge gibt — und die
Wahrheit des Nutzers wird sein, beides zu brauchen: die Mitte für die
Substanz, den Rand für die Erscheinung.
