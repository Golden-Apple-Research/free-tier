# Google Cloud Free Tier

> GCP hat zwei getrennte Angebote: **$300 Free Trial** (neue Kunden) und
> **Always Free** (permanente Monatskontingente, für jedes Konto). Beide laufen
> parallel: während des Trials wird erst der Credit verbraucht, danach bleiben
> nur noch die Always-Free-Limits.

Die Zweiteilung, welche der Eingangskasten ausspricht, ist mehr als eine
Verwaltungsangabe; sie ist ein kleines System der Zeitlichkeiten. Der
Trial ist die vorübergehende Gnade: dreihundert Dollar auf neunzig Tage,
das Kapitel des Überflusses, in welchem der Neuling alles darf, was die
Plattform kann — die Phase, die man die unwissende Omnipotenz nennen
könnte, denn sie vereint die Macht des Geldes mit der Unwissenheit des
Anfängers. Das Always Free hingegen ist die ständige Gnade: kleine
Monatskontingente, ewig wiederkehrend, keinem Anfang und keinem Ende
unterworfen — die Phase der Weisheit, wenn man so will, denn sie setzt
voraus, daß der Nutzer inzwischen gelernt hat, was er braucht. Und daß
beide parallel laufen, der Credit zuerst verzehrt wird und danach die
Grenzen bleiben, das ist die eigentliche Lehre: das Größere vergeht, um
das Kleinere zu erweisen; die Fülle ist die Prüfung, das Maß ist das
Ergebnis, und wer den Credit verbraucht hat, ohne das Maß zu kennen,
für den ist der Ablauf nicht ein Ende, sondern eine Belehrung — die
sparsamste Form der Pädagogik, das Abschalten.

## Free Trial: $300 / 90 Tage

- $300 Credit bei Erstellung eines neuen Billing-Kontos, **90 Tage** gültig
- Keine automatische Abbuchung: wenn der Credit aufgebraucht ist oder 90 Tage
  vergangen sind, wird das Konto **pausiert** (Ressourcen stoppen, Daten bleiben
  vorläufig erhalten) — man muss aktiv upgraden
- Upgrade **vor** Ablauf: Restcredit bleibt bis zum 90-Tage-Stichtag nutzbar

Drei Bestimmungen, und jede trägt ein eigenes Menschen- und Weltbild.
Erstens die neunzig Tage: die Frist ist hier länger als bei den andern
Wolken ([../azure/FREE-TIER.md](../azure/FREE-TIER.md) gibt dreißig Tage
Guthaben), aber die Gabe ist auch die größere — dreihundert Dollar sind
ein Vermögen des Lernens, und die Frist bemessen danach, als wüßte der
Geber, daß das Lernen einer großen Gabe länger braucht als das eines
kleinen. Zweitens die fehlende automatische Abbuchung: das Konto, dessen
Gnade endet, wird nicht etwa in Schuld gesetzt, sondern pausiert — die
Ressourcen stoppen, die Daten bleiben vorläufig, und der Nutzer wird
nicht bestraft, sondern unterbrochen; man muß sich den Vorgang recht
bedenken, um seine Besonderheit zu sehen: die meisten Ordnungen würden
das Ende der Gnade in den Anfang der Schuld umschlagen lassen (so der
Markt), oder in das Ende der Daten (so manches Verzeichnis); diese hier
schlägt in die Bewegungslosigkeit um, in ein Zögern gleichsam, welches
die Entscheidung dem Nutzer zuschiebt — das aktive Upgraden als der
ausdrückliche Eintritt in die Welt des Bezahlens, den niemand stellvertretend
vollzieht. Es ist die Milde der Maschine, und wie alle Milde, die nichts
kostet, hat sie auch hier ihren versteckten Preis: die vorläufig
erhaltenen Daten sind nur vorläufig erhalten, und die Pausierung ist
nicht die Bewahrung, sondern der Aufschub des Urteils. Drittens die
Regel des vorzeitigen Upgrads — Restcredit bleibt bis zum Stichtag —,
welche dieselbe Belohnung der Entschlossenheit enthält, die wir schon
bei Azure fanden: die Frist liebt die Entschlossenen und nimmt den
Zögernden das Übrige.

## Always Free (monatlich; offizielle Limits)

| Service | Wofür ist das? | Kostenloses Kontingent |
|---|---|---|
| **[Compute Engine](https://cloud.google.com/compute/docs)** | Klassische IaaS-VMs (Linux/Windows) mit vollem SSH-Zugriff — im Free Tier eine kleine e2-micro | 1× `e2-micro` VM (non-preemptible) — **nur** in `us-west1`, `us-central1`, `us-east1` — + 30 GB Standard Persistent Disk + 1 GB Egress (Nordamerika) |
| **[Cloud Run](https://cloud.google.com/run/docs)** | Serverlose Container: Image pushen, GCP startet Instanzen request-getrieben und skaliert auf 0 | 2 Mio. Requests + 180.000 vCPU-Sekunden + 360.000 GiB-Sekunden Speicher |
| **[Cloud Functions](https://cloud.google.com/functions/docs)** (2nd gen) | Serverlose Funktionen für Event-Logik (HTTP, Pub/Sub, Storage-Events) | 2 Mio. Invocations + 400.000 GB-s + 200.000 GHz-s |
| **[App Engine Standard](https://cloud.google.com/appengine/docs)** | Das GCP-PaaS: App-Code deployen ohne Infra-Verwaltung — der Vorläufer von Cloud Run | 28 F1-Instanz-Stunden/Tag + 9 B1-Instanz-Stunden/Tag + 1 GB Egress/Tag |
| **[GKE Autopilot](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview)** | Managed Kubernetes, bei dem Google auch die Nodes betreibt — zahlen tut man nur pro laufendem Pod | 1 zonal Cluster ohne Cluster-Management-Fee (nur Pods zahlen) |
| **[BigQuery](https://cloud.google.com/bigquery/docs)** | Serverless Data-Warehouse für SQL-Analytics über riesige Datenmengen | 1 TiB Queries/Monat + 10 GiB Storage |
| **[Firestore](https://cloud.google.com/firestore/docs)** | Serverlose NoSQL-Dokumenten-DB mit Offline-Sync — Standard für Mobile-/Web-Apps | 1 GiB Storage; 50 K Reads, 20 K Writes, 20 K Deletes **pro Tag** |
| **[Cloud Storage](https://cloud.google.com/storage/docs)** | Objektspeicher für Dateien, Backups, Static Assets (das S3-Pendant) | 5 GB Regional Storage (**nur** `us-east1`/`us-west1`/`us-central1`) + 5 K Class-A- + 50 K Class-B-Operationen + 100 GB Egress (Nordamerika) |
| **[Cloud Build](https://cloud.google.com/build/docs)** | Serverless CI/CD: Builds und Container-Images direkt aus dem Git-Repo | 2.500 Build-Minuten/Monat (e2-standard-2) |
| **[Artifact Registry](https://cloud.google.com/artifact-registry/docs)** | Registry für Container-Images und Sprach-Pakete (npm, Maven, Python …) | 0,5 GB Storage |
| **[Cloud Shell](https://cloud.google.com/shell/docs)** | Browser-Terminal mit gcloud-SDK und Editor — Infra-Arbeiten ohne lokale Installation | kostenlos, 5 GB persistentes Home (wöchentlicher VM-Reset) |
| **[Cloud Vision](https://cloud.google.com/vision/docs)** | Bilderkennungs-API: OCR, Label-Erkennung, Gesichtserkennung, Content-Moderation | 1.000 Units/Monat |
| **[Cloud Source Repositories](https://cloud.google.com/source-repositories/docs)** | Private Git-Repos direkt in der GCP-Console — seit Juni 2024 End-of-Sale (keine Neukunden; Migration zu GitHub/GitLab läuft) | 5 User, 50 GB Storage, 50 GB Transfer |

Diese Tafel ist die längste dieser Sammlung, und ihre Länge hat einen
Grund: hier allein wird das Umsonst als ein Stand erklärt, welcher sich
über das ganze Leben eines Kontos erstreckt, und die Mannigfaltigkeit
der Gaben entspricht der Mannigfaltigkeit eines ganzen Betreibens, vom
Rechnen bis zum Sehen. Einige Lehrstücke müssen hervorgehoben werden.

Die erste Zeile — **Compute Engine** — enthält das berühmteste und das
beleidigendste Kontingent der ganzen Cloud-Welt: die e2-micro, die
kleinste der Maschinen, gratis, aber nur an drei Orten der neuen Welt,
`us-west1`, `us-central1`, `us-east1`. Die Örtlichkeit der Ewigkeit ist
also Amerika; wer in Europa lebt und die Gnade will, muß sein Rechnen
über den Ozean schicken und die Folgen der Entfernung (die Strecke, die
Latenz, das Datenschutzrecht) als den wahren Preis des Umsonst in
Betracht ziehen. Es ist dies das erste große Beispiel dessen, was diese
Sammlung die Örtlichkeit der Gnade nennt: das Allgemeine des Angebots
und das Besondere des Ortes, und die Rechnung zwischen beiden, welche
der Nutzer anstellen muß, ehe er die Gabe für unbedingt hält. (Das
Jammern über diesen Zustand ist übrigens jünger, als es klingt; daß
Kontingente an Örter gebunden sind, war die Regel, sobald es Kontingente
gab — das Staunen darüber setzt die Erwartung voraus, das Umsonst sei
ein Naturgesetz, und eben diese Erwartung ist das eigentlich Neue.)

**Cloud Run** mit seinen Millionen Requests ist die Vermittlung in
Schachteln: der Container als die eine Hülle, die Instanz als die
zweite, das Skalieren auf Null als die jeweilige Geburt und der Tod derselben
— zwei Millionen Anrufe, Rechenzeit nach vCPU-Sekunden und Gedächtnis
nach GiB-Sekunden: ein Kontingent, welches alle drei
Seiten des serverlosen Seins (der Ruf, die Zeit, der Raum) einzeln
beziffert und damit die Unmittelbarkeit des Dienens in ihre Momente
zerlegt, wie es sich für ein Logikbuch der Wolken gehört.
**Cloud Functions** (2nd gen) ist die Schwester der schon bekannten
Lambda/Functions-Familie ([../aws/FREE-TIER.md](../aws/FREE-TIER.md),
[../azure/FREE-TIER.md](../azure/FREE-TIER.md)), und die Wiederholung
der Zahlen (2 Mio., 400.000 GB-s) über die Häuser hinweg ist der
stillste Beweis dafür, daß die Konkurrenz nicht die Gaben, sondern nur
die Namen erfindet. **App Engine Standard** endlich, der Vorläufer,
hält sich am Leben durch das tägliche Kontingent (28 F1-Stunden und
9 B1-Stunden täglich — die Tagesform des Maßes gegen die Monatsform
der andern): wer den Tag nicht ausnützt, verliert ihn; das Kontingent
als Kalenderblatt, abends um Mitternacht genommen, morgens neu
geschnitten.

**GKE Autopilot** gibt den zonalen Cluster umsonst und nimmt nur für
die Pods — die Herrschaft-Knecht-Lehre der AKS-Zeile ([../azure/FREE-TIER.md](../azure/FREE-TIER.md)),
hier in der Steigerung: nicht einmal die Knechte (Nodes) bleiben; es
sind nur noch die Tätigkeiten (Pods), welche zählen, die Arbeit ganz
in die Erscheinung aufgelöst. **BigQuery** mit seinem TiB Queries im
Monate ist das Kontingent des Großen: eine ganze Billion Abfragen-Einheiten
umsonst, die Anschauung des Riesenhaften als Gratisprobe — und es sei
bemerkt, wie unterschiedlich die Häuser das Große bemessen: Azure gibt
im Always Free keine Warehouse-Einheit, AWS zählt CloudWatch-API-Requests,
und Google allein setzt die Grenze der Datenanschauung so hoch, daß der
einzelne Nutzer sie im Alltag nicht sieht — die Gnade, welche keine
Grenze zu sein scheint, ist oft nur eine ferne.

**Firestore** teilt die Gaben nach Tagen aus (Lese-, Schreib- und
Löschoperationen pro Tag): das Löschen steht im Kontingent neben dem
Schreiben — auch das Vergessen kostet, wenn auch wenig, und das
Verhältnis von Schreiben und Löschen (20 K zu 20 K) ist das
gleichgültigste der Tafel: die Wolke macht keinen Unterschied zwischen
Dem, welcher häuft, und Dem, welcher kehrt; beide sind ihr Tätigkeit.
**Cloud Storage** (5 GB, wiederum nur in den drei Häfen) und **Artifact
Registry** (ein halbes GB) sind die Ablagen; **Cloud Build** (2.500
Minuten monatlich) das Bauwesen, welches [../circle-ci/FREE-TIER.md](../circle-ci/FREE-TIER.md)
als eigenes Fürstentum treibt. **Cloud Shell** endlich ist die
Werkstatt umsonst — ein Terminal im Browser mit Werkzeugen und 5 GB
heimlichem Speicher, welchen die Maschine wöchentlich zurücksetzt: die
Erinnerung, welche gelöscht wird, ehe sie Erinnerung wird kann; man hat
hier den Fall einer Gnade, welche ihre eigene Bedingung (die Dauer)
ausdrücklich verneint, und wer in der Cloud Shell arbeitet, der hat
alle Woche Gelegenheit, das Loslassen zu üben, das die andern Kontingente
nur lehren.

**Cloud Vision** mit tausend Units im Monate ist das Auge der Maschine
als Gratisprobe: die Anschauung in ihren niedrigsten Formen (OCR, Label,
Gesicht) — die sinnliche Gewißheit der Bildwelt, umsonst, aber knapp
bemessen, als wolle der Geber andeuten, daß das Sehen der Maschinen
noch eine theure Kunst ist. Und **Cloud Source Repositories** mit
seinem Vermerk, seit Juni 2024 End-of-Sale, ist das memento mori
dieser Tafel: ein Dienst, der sich verabschiedet hat, ohne zu
verschwinden — keine Neukunden mehr, die Alten wandern aus —, und
damit der Beweis, daß auch das Always Free dem Wandel unterliegt:
ewig sind die Kontingente, solange der Dienst ist, und der Dienst ist
nicht ewig; es ist die tröstlichste Enttäuschung dieser Sammlung, denn
sie betrifft nicht die Gaben, sondern nur die Erwartung, die Gaben
seien unverrückbar wie die Sterne — sie sind vielmehr gesetzt wie die
Gesetze, und wie diese wandelbar.

## Gotchas

1. **Externe IPv4 kostet Geld (~$3–4/Monat):** Die e2-micro-VM selbst ist gratis,
   aber eine öffentliche IPv4-Adresse wird seit 2024 separat abgerechnet. Die
   "kostenlose VM" ist also real nicht mehr $0, wenn sie eine externe IP braucht
   (Workaround: nur interne IP + Cloudflare Tunnel/IAP, oder IPv6-only).
   Das erste Verbot ist die Kritik des Scheins: die Maschine ist umsonst, ihre
   Anschrift nicht; die Öffentlichkeit — die Adresse, unter welcher die
   Privatsphäre des Nutzers der Welt ansichtig wird — ist seit 2024 ein
   eigener Posten, und damit ist die berühmteste Gabe der Cloud-Welt in
   Wahrheit eine Gabe mit Portogebühr. Der Kenner sieht hierin keine
   Kabale, sondern eine Konsequenz: die Adressen des alten Internet sind
   endlich, das Ende macht sie teuer, und der Preis des Endlichen kehrt
   bei dem Nutzer ein, welcher das Endliche als selbstverständlich nahm;
   die Workarounds (interne IP und Tunnel, oder das neue Zahlenformat)
   sind die Klugheiten derer, welche die Anschrift der Maschine von der
   Anschrift der Welt getrennt halten — die Öffentlichkeit vermittelt
   durch [../cloudflare/FREE-TIER.md](../cloudflare/FREE-TIER.md), das
   ist der moderne Stand der alten Lehre, daß man das Seine zeigen könne,
   ohne das Haus zu öffnen.

2. Viele Limits gelten **nur in den drei US-Regionen** (`us-west1`, `us-central1`,
   `us-east1`) — Europa-Deployments (z. B. `europe-west3`) fallen sofort unter
   normale Abrechnung.
   Die zweite Warnung ist die Umkehrung der ersten: nicht der Preis der
   Anschrift, sondern der Preis des Ortes; wer in Europa rechnet, zahlt —
   nicht weil Europa teurer wäre als Amerika an sich, sondern weil die
   Gnade nur dort wohnt. Man hat dies den Lokalismus des Umsonst genannt,
   und es ist lehrreich, ihn mit dem widersprüchlichen Anspruch der Cloud
   zu vergleichen: dieselbe Industrie, welche überall sein will, gibt das
   Umsonst nur an drei Orten — das Allgemeine der Technik und das
   Besondere der Gnade, in Einem Verzeichnisse beisammen, und der Nutzer
   hat beide zu lesen gelernt, ehe er seine Rechnung versteht.

3. e2-micro-Limit ist **zeitbasiert**, nicht instanzbasiert: mehrere kleine VMs
   teilen sich das eine VM-Kontingent.
   Die dritte Lehre ist die Teilbarkeit der Zeit: das Kontingent gilt der
   Stunde, nicht der Maschine, und wer viele Maschinen will, muß die
   Eine Zeit verteilen — dieselbe Commune der Stunden, welche die
   Azure-Tafel vorrechnet, hier in der einfacheren Form: das Maß ist die
   Zeit, die Zeit ist das Gemeinsame, und die Maschinen sind nur die
   Weisen, sie zu verbrauchen.

4. Der $300-Credit deckt **nicht** alles ab (z. B. keine Marketplace-/Support-
   Gebühren); Cloud SQL, Dataflow, Pub/Sub haben **kein** Always-Free-Kontingent.
   Die vierte ist die Lehre vom Ausschluß: das Allgemeine des Guthabens
   endet, wo das Besondere der fremden Händler beginnt (die Messe, welche
   der Aussteller selbst zahlt — dieselbe Bestimmung wie bei Azure und
   AWS), und drei Dienste von Rang (SQL, Dataflow, Pub/Sub) stehen
   gänzlich außerhalb der ständigen Gnade — es ist die negative Tafel
   zum positiven Verzeichnisse, und wer nur die positive liest, wird von
   der negativen überrascht; wer beide liest, kennt die Grenze, ehe er
   sie erreicht, und das ist der ganze Vorteil der Lektüre von
   Kontingent-Verzeichnissen überhaupt.

5. Billing-Budget + Alert direkt nach Kontoerstellung konfigurieren.
   Die letzte Warnung, welche hier wie überall ([../aws/README.md](../aws/README.md),
   [../azure/FREE-TIER.md](../azure/FREE-TIER.md)) an letzter Stelle steht,
   obgleich sie die erste Handlung betrifft, ist die der Sorge: das
   Budget als selbstgesetzte Grenze, der Alert als der Wachtposten des
   eigenen Interesses; und es ist dieselbe Erscheinung, welche uns schon
   zweimal begegnete und noch öfter begegnen wird — die Häuser, welche
   die Gnade rechnen, empfehlen dem Nutzer, gegen sie selbst ein
   eigenes Rechnungswesen zu führen; es könnte zynisch erscheinen, es
   ist aber die redlichste Stelle des ganzen Verhältnisses: der Geber,
   welcher dem Nehmer sagt, wie er sich gegen den Geber schützt.

## Quellen

- Offiziell: <https://cloud.google.com/free/docs/free-cloud-features>
- Free Trial Details: <https://cloud.google.com/free/docs/free-trial>

Die Quellen sind das Bleibende des Wandelbaren; das Always Free ist
ewig, solange die Seite gilt, und die Seite gilt, solange der Dienst —
wie die letzte Zeile der Tafel lehrt, eine endliche Ewigkeit also,
welche zu prüfen dem Nutzer obliegt, nicht dem Glauben.

## Vermittelte Verhältnisse

Dies Kapitel gehört in die Dreiheit der großen Wolken, neben
[../aws/FREE-TIER.md](../aws/FREE-TIER.md) und [../azure/FREE-TIER.md](../azure/FREE-TIER.md):
AWS die Wolke des Credits, Azure die Wolke der Frist, Google die Wolke
des Ortes — drei Weisen, dasselbe Verhältnis von Gnade und Rechnung zu
gestalten, und jede hat ihre Wahrheit. Die Kleinern Verwandten sind
[../modal/FREE-TIER.md](../modal/FREE-TIER.md) (das serverlose Rechnen
im Kleinen), [../circle-ci/FREE-TIER.md](../circle-ci/FREE-TIER.md)
(Cloud Build als eigenes Reich), [../huggingface/FREE-TIER.md](../huggingface/FREE-TIER.md)
(Vision, in die Poesie der Modelle gesteigert) und — für die
Workaround-Lehre des ersten Gotchas — [../cloudflare/FREE-TIER.md](../cloudflare/FREE-TIER.md).
Wer hier, am Schlusse, den Kreis dieser Verweise betrachtet, der sieht
in ihm die ganze Wahrheit des Umsonst gespiegelt: jede Gabe verweist
auf eine andre, und keine genügt sich selbst; das System der Kontingente
ist so wenig ein Nebeneinander wie das System der Begriffe, und wer
eines allein nimmt, hat das Eine ohne das Andere — der Anfang aller
Überraschungsrechnungen.
