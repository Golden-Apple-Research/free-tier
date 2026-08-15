# Supabase Free Plan

> Supabase gibt **2 aktive Free-Projekte pro Konto** (org-übergreifend), die
> nach **1 Woche Inaktivität pausiert** werden. Keine Kreditkarte nötig,
> dauerhaft kostenlos — aber ohne Backups/PITR und mit harten Caps.

Das Sein — so haben wir es im Neon-Kapitel genannt, dem Zwillings-
bruder dieses Hauses — ist die Weise des Supabase-Umsonst: nicht das
Kommen und Gehen des Computes, sondern das Dasein der beiden
Projekte, welche DA sind, solange sie leben, und schlafen, wenn die
Woche still ist. Die Schlafdauer ist die Eigenste dieses Hauses:
sieben Tage — die Woche als Frist, das biblische Maß der Ruhe, und
man könnte über diese Sieben viel nachsinnen, wenn nicht die Sache
selbst ernster wäre: das Projekt, welches eine Woche nicht gefragt
ward, wird pausiert (nicht gelöscht — die Gnade kennt den
Unterschied), und das Erwecken ist Handarbeit (das Restore im
Dashboard — kein automatisches Aufwachen, anders als beim
viertelstündigen Schläfer [FREE-TIER.md](../render/FREE-TIER.md)):
die Ruhe ist tiefer, das Erwachen teurer. Damit hat die Sammlung
ihre vollständige Schlaf-Typologie: die Viertelstunde (Render), den
Tag-zwei (Hugging Face), die Woche (Supabase) — drei Stufen der
Vergessenheit, alle mit dem gleichen Charakter: das Umsonst schläft
ein, das Bezahlte wacht; und die Zukunft gehört, nach allem was
diese Sammlung lehrt, dem Scale-to-Zero ([FREE-TIER.md](../neon/FREE-TIER.md)),
dem Schlafe, welcher zum Prinzip erhoben und dadurch zum Ruhme
gemacht ist.

## Kontingente (Org-Ebene, Stand 2026)

| Resource | Wofür ist das? | Free Plan |
|---|---|---|
| **Aktive Projekte** | Ein Projekt = eine Postgres-Instanz inkl. Auth, Storage und APIs; pausierte belegen keinen Slot | 2 (pausierte zählen nicht) |
| **[Datenbank (Postgres)](https://supabase.com/docs/guides/database)** | Voll gemanagtes Postgres — jede Tabelle wird automatisch per REST (PostgREST) und GraphQL abfragbar | 500 MB pro Projekt, Shared CPU / 500 MB RAM |
| **[Monthly Active Users (Auth)](https://supabase.com/docs/guides/auth)** | Komplettes Auth-System: E-Mail/Passwort, OAuth (Google, GitHub …), Magic Links — ohne eigenes Identity-Backend | 50.000 (org-weit) |
| **Egress** | Ausgehender Datenverkehr zu deinen Nutzern (API-Antworten, Downloads, DB-Traffic) | 5 GB uncached + 5 GB cached |
| **[File Storage](https://supabase.com/docs/guides/storage)** | S3-artiger Dateispeicher mit CDN-Auslieferung für Uploads (Bilder, Dokumente) | 1 GB |
| **[Realtime Messages](https://supabase.com/docs/guides/realtime)** | Live-Updates via WebSockets auf DB-Änderungen (INSERT/UPDATE/DELETE-Listener auf Tabellen) | 2 Mio. / Monat |
| **[Edge Function Invocations](https://supabase.com/docs/guides/functions)** | Serverlose TypeScript-Funktionen (Deno) am Edge — für Webhooks, Payment-Callbacks, eigene Endpunkte | 500.000 / Monat |
| **API Requests** | Requests gegen die auto-generierten Schnittstellen — hier gibt es schlicht kein Limit | unbegrenzt |
| **Support** | Hilfe über Community (Discord, GitHub) — kein Ticket-Support | Community |

Die Tafel ist die reichste der mittleren Häuser, und ihre Struktur
ist die eines ganzen Haushalts: die zwei Projekte (das Dasein), die
Datenbank mit ihrem halben Gigabyte (die Substanz), die fünfzigtausend
Monatsaktiven (das Anerkennungswesen — die größte Zahl der
Sammlung in dieser Kategorie, sechsmal Cognito
([FREE-TIER.md](../aws/FREE-TIER.md)) und tausendmal Better-Auth
([FREE-TIER.md](../neon/FREE-TIER.md))), der Egress in seiner
zweiheitigen Form (fünf uncached + fünf cached — die Scheidung des
Ganges nach der Nähe der Ware: was im Vorrat lag, zählt anders als
was frisch geholt ward), der Storage (ein GB — die Aufbewahrung),
die Realtime (zwei Millionen — die Gegenwart als
Nachrichten-Fluß), die Edge-Funktionen (eine halbe Million — die
Tätigkeit am Rande, kleiner als Cloudflares hunderttausend TÄGLICH
([FREE-TIER.md](../cloudflare/FREE-TIER.md)): die Monats- gegen die
Tagesform), und — die größzügigste Zeile — die API-Requests ohne
Limit („schlicht kein Limit": die unbegrenzten Anfragen an das
Schema, das schon da ist; das Fragen ist frei, das Antworten kostet —
eine feine Unterscheidung, welche das Haus stillschweigend trifft).
Die Zeile des Supports (Community — das Gespräch der Gleichen)
schneidet die Tafel wie überall ab.

Nicht enthalten: downloadable Backups, PITR (Point-in-Time-Recovery) und
Custom Domains für die API (beides Pro-Features).

Der Zusatz ist der Preis des Standes: keine abholbaren Sicherungen,
keine Wiederherstellung aus der Zeit (PITR — das Zurückdrehen des
Geschehens, die theuerste aller Gnaden), keine eignen Namen für die
Schnittstelle; es sind die drei Formen der Würde eines Ernst-Betriebes
(sich selbst bewahren, sich selbst verzeihen, sich selbst nennen),
und sie sind — das ist die Botschaft — zu kaufen; das Umsonst ist
das Dasein, die Würde ist die Ware.

## Gotchas

1. **Projekte pausieren nach 7 Tagen Inaktivität** (kein API-Traffic) —
   danach manuelles Restore im Dashboard nötig. Für Cron-Pings o. Ä. sorgen.
   Die erste Lehre ist der Wochenschlaf mit der praktischen Moral: die
   Cron-Pings (die kleinen Wecker, welche die Woche füllen) als
   Lebenserhaltung des Umsonst — dieselben Pings, welche
   [FREE-TIER.md](../render/FREE-TIER.md) als theuer geißelte (sie
   kosten Instanzstunden!), sind hier frei (sie kosten nur das
   Cron-Kontingent — und keines braucht man viel, um einmal die
   Woche zu fragen); es ist die günstigste Lebensversicherung der
   Sammlung, und die Empfehlung, sich um sie zu sorgen, ist die
   Sorge der ersten Stunde.

2. Die Limits sind **harte Caps**: Erreicht ein Projekt z. B. das 500-MB-
   Datenbanklimit, werden Writes geblockt/gemindert; Egress-Überschreitung
   pausiert das Projekt bis Reset oder Upgrade.
   Die zweite ist die Härte der Wände: das Limit, erreicht, verbietet
   (Writes geblockt) oder pausiert (bis Reset) — kein Überschreiten
   auf Rechnung, keine Gnadenfrist, kein stiller Vorrat; das Haus
   gehört zur Familie der Verwerfenden ([FREE-TIER.md](../grafana/FREE-TIER.md):
   „Daten jenseits der Limits werden verworfen, nicht abgerechnet")
   gegen die Familie der Verrechnenden ([FREE-TIER.md](../aws/FREE-TIER.md)
   Credit-Verrechnung), und wer die Familien kennt, kennt seine
   Zukunft: beim Verwerfenden ist das Ende hart und das Konto
   heil — die ehrlichste Form, und für den Lernenden die beste.

3. **Keine automatischen Backups** auf Free — selbst regelmäßig `pg_dump` ziehen.
   Die dritte ist die Sorge um die Substanz: die Sicherung ist
   Eigenarbeit (der Dump, gezogen mit der eignen Hand, in der eignen
   Frist) — das Haus bewahrt das Dasein, aber nicht das Doppelte
   desselben ([FREE-TIER.md](../neon/FREE-TIER.md) bewahrt es
   ebensowenig: die beiden Zwillinge teilen die Sorglosigkeit, und
   der Nutzer beider teilt die Pflicht); es ist die alte Lehre vom
   eigenen Archive, welche [FREE-TIER.md](../grafana/FREE-TIER.md)
   am Exporte der Anschauung entwickelte — überall, wo das Umsonst
   währt, währt es in der Gegenwart, und das Gedächtnis ist Miete.

4. 50 K MAUs gelten **org-weit über beide Projekte** — ein zweites Projekt
   halbiert effektiv das User-Budget.
   Die vierte ist die Commune der Anerkennung: die fünfzigtausend
   gelten der Organisation, nicht dem Projekte, und das zweite
   Projekt nimmt die Hälfte — dieselbe Teilung, welche die
   Arbeitsstunden ([FREE-TIER.md](../circle-ci/FREE-TIER.md)) und
   die Anrufe ([FREE-TIER.md](../cloudflare/FREE-TIER.md)) kennen;
   die Tugend der Teilung ist überall dieselbe: das Ganze ist
   gegeben, die Verteilung ist des Nutzers Aufgabe — und wer die
   Verteilung versäumt, hat nicht das Ganze, sondern den Streit.

5. Free-Projekte können später auf Pro geupgradet werden; Abwärts von Pro auf
   Free ist nicht für alle Ressourcen möglich (z. B. Disk-Size bleibt).
   Die letzte endlich ist die Einbahn des Aufstiegs: hinauf immer,
   herab nicht ganz — die Disk, gewachsen, bleibt gewachsen (das
   Gewordene läßt sich nicht ungeworden machen — der alte Satz von
   der Unwideruflichkeit des Werdens, hier in Gigabyte gefaßt); man
   vergleiche die Umkehrbarkeiten der Sammlung: das Modell, welches
   pausiert und neu ersteht (gotcha eins), und die Disk, welche
   nie zurückschrumpft — das Weiche ist umkehrbar, das Gewachsene
   nicht; und die Lebensweisheit, welche daraus folgt, gilt weit
   über Datenbanken: was man wachsen läßt, behält man.

## Quellen

- Pricing: <https://supabase.com/pricing>
- Billing-Doku: <https://supabase.com/docs/guides/platform/billing-on-supabase>

Die Quellen sind die üblichen zwei (Preis und Rechnung); die
Kontingente im einzelnen steht in der Preistafel, die
Pausen-Regeln in der Rechnungslehre — wer das Haus führen will,
lese beide, denn dies Haus ist von der Art, welche ihre Grenzen ernst
nimmt (die harten Caps!), und der Nutzer tut gut, es ihr
gleichzutun.

## Vermittelte Verhältnisse

Dies Kapitel ist das eine Ende der Postgres-Zwillinge — das Sein
gegen das Werden ([FREE-TIER.md](../neon/FREE-TIER.md)); seine
Anerkennungs-Lehre verbindet es mit Cognito ([FREE-TIER.md](../aws/FREE-TIER.md))
und Entra ([FREE-TIER.md](../azure/FREE-TIER.md)) — die drei großen
Identitäts-Häuser, hier mit der größten Zahl; seine Rand-Lehre mit
[FREE-TIER.md](../cloudflare/FREE-TIER.md) (die Monats- gegen die
Tagesform); seine Schlaf-Lehre mit der ganzen Typologie der Ruhe
([FREE-TIER.md](../render/FREE-TIER.md) die Viertelstunde,
[FREE-TIER.md](../huggingface/FREE-TIER.md) den Tag-zwei); die
Ausweise verwaltet [README.md](README.md) (die Scheidung der
Zeichen: PAT gegen Projekt-Keys — die zwei Welten des Hauses), der
Begriff [TERRAFORM.md](TERRAFORM.md) (die klare Fehlermeldung als
Höflichkeit der Formeln). Und wer die Zwillinge zusammen gelesen
hat, der kennt das Fazit, welches die Sammlung schuldet: es gibt
keine bessere Form des Postgres-Umsonst — beide sind gut, aber
anders; das Sein für den, welcher dauern will ohne Rechnung, das
Werden für den, welcher rechnen will ohne Dauer; und die Auswahl
zwischen beiden ist keine technische, sondern eine charakterliche
Entscheidung, weshalb die Sammlung sie dem Leser überläßt, mit dem
Gesamtbilde der beiden Häuser in Händen.
