# Azure Free Account

> Azure hat drei Schichten: **$200 Credit (30 Tage)**, **12 Monate gratis
> Services** und **Always Free** (nie ablaufend). Für neue Konten gilt alles
> gleichzeitig.

Drei Schichten, und in dieser Dreiheit, die der Eingangskasten nur
feststellt, liegt eine ganze Lehre vom Zeitlichen: das Vergängliche (der
Credit, welcher in dreißig Tagen verfällt, gleichviel ob er gebraucht ward
oder nicht), das Fristliche (die zwölf Monate, welche gewährt werden und
deren Ablauf nicht das Ende des Dienstes, sondern das Ende der Gnade ist)
und das Bleibende (das Always Free, welches niemals abläuft und eben darin
dem ewig Gleichen ähnelt). Man hat diese Ordnung, wenn man sie mit der von
[AWS](../aws/FREE-TIER.md) vergleicht — welches dieselben drei Zeitigkeiten
hat, aber anders verteilt: dort das Fristliche negiert (seit Juli 2025),
hier festgehalten —, sogleich den Charakter der beiden Häuser: AWS ist die
Wolke des Umschlags, Azure die Wolke der Frist; und es ist bezeichnend,
daß die Frist bei Azure nicht schweigt, sondern laut wird, nämlich am
Ende der zwölften Monate als Rechnung erscheint — wovon unten, bei den
Gotchas, im Zusammenhange zu handeln ist, denn es ist der dunkelste Punkt
dieses ganzen Verhältnisses und der lehrreichste.

## $200 Startguthaben (erste 30 Tage)

- $200 Credit in der Abrechnungswährung, gültig **30 Tage**, auf fast alle
  Services anwendbar (außer Third-Party-Marketplace)
- Ungenutzter Credit verfällt nach Tag 30
- Upgrade vor Tag 30 → Restcredit bleibt bis zum 30. Tag in der
  Pay-as-you-go-Subscription nutzbar

Die dreißig Tage des Guthabens sind die erste Zeitlichkeit, die kürzeste
und die gleichgültigste zugleich; denn der Credit fragt nicht, was der
Nutzer will, sondern nur, was er tut, und zwar bevor er es tut: wer in
den ersten dreißig Tagen nicht probiert, der verliert das Recht zu
probieren nicht — er verliert nur das Geld dazu, welches denn auch kein
Geld war, sondern ein Schein von Geld, eine Gabe mit Verfallstermin, die
erste Begegnung des Neulings mit der unerbittlichsten aller Wahrheiten
des Kontingentwesens: daß das Umsonst selbst ein Geschäft ist, nämlich
das Geschäft des Anfangs, welches nur dem gilt, der anfängt. Die
Ausnahme der Marketplace-Dienste (Third-Party) sei dabei nicht als
Kleinigkeit überlesen: das Allgemeine des Guthabens endet, wo das
Besondere der fremden Händler beginnt — die Messe zahlt der Aussteller
selbst —, und der Hinweis, daß Restcredit beim Upgraden vor Tag dreißig
in die künftige Subscription hinübergetragen wird, ist die einzige
Konzession an die Kontinuität des Willens: wer sich früh bindet, behält
sein Übriges; wer sich spät bindet, verliert es; die Frist belohnt die
Entschlossenheit, und es ist dieselbe Ökonomie, nach welcher überall die
Gnadenfristen verfahren.

## 12 Monate gratis (ab Registrierung)

| Service | Kontingent / Monat |
|---|---|
| **Linux-VMs** | 750 h **B1S** + 750 h **B2ats v2** (AMD) + 750 h **B2pts v2** (ARM) — Burstable-Serien, beliebig kombinierbar (750 h ≈ 1 VM 24/7) |
| **Windows-VM** | 750 h B1S |
| **Managed Disks** | 2× 64 GB P6 SSD (LRS) |
| **Blob Storage** | 5 GB LRS Hot Block Blob + 20 K Reads / 10 K Writes |
| **SQL Database** | 250 GB (S0-Tier) |

Instanzen sind **in jeder Region** möglich, in der der Service verfügbar ist;
mehrere kleine Instanzen dürfen das Kontingent aufteilen (z. B. 5× B1S à 150 h).

Die zwölf Monate sind die Ausbildungszeit, die Lehr- und Wanderjahre des
Kontos; die Tafel, die sie eröffnet, ist eine Tafel von Maschinen — VMs,
Platten, Speicher, Datenbank —, das heißt von dem, was unter allen Diensten
das Gegenläufigste zum Serverlosen ist: hier wird nicht eine Funktion
gerufen, sondern eine Maschine besessen, und das Kontingent ist das
Mietverhältnis einer ganzen Werkstatt, nicht die Miete eines Werkzeugs.
Die 750 Stunden, welche die Tafel dreifach aufführt (für jede der drei
Burstable-Serien eigene), sind, wie der Zusatz belehrt, beinahe der ganze
Monat — 750 gegen 720 bis 744 —, und eben dieses „beinahe" ist ihre
Dialektik: das Kontingent stellt die Dauer ganz, aber nicht völlig ganz;
wer ohne Rechnung lebt, dem nimmt der Monat mit 31 Tagen das Seine, und
wer zwei Maschinen will, muß teilen (5× B1S à 150 h, wie die Tafel es
vorrechnet — das Kontingent als Teilbares, als Commune der Stunden, in
welcher jeder Instanz ihr Anteil zugeteilt wird). Daß die Instanzen in
jeder Region möglich sind, unterscheidet dies Kontingent von den drei
geheiligten Häfen des Google-Always-Free ([../gcp/FREE-TIER.md](../gcp/FREE-TIER.md)):
die Frist gibt die Welt, die Ewigkeit gibt die Örtlichkeit — ein Tausch,
über den zu klagen töricht wäre, da beide Seiten der Waage ihr Wahres
haben.

## Always Free (nie ablaufend)

| Service | Wofür ist das? | Kontingent |
|---|---|---|
| **[Azure Functions](https://learn.microsoft.com/azure/azure-functions/functions-overview)** | Serverlose Funktionen, die auf HTTP-Requests, Timer oder Events (Queue, Service Bus) reagieren | 1 Mio. Executions + 400.000 GB-Sekunden / Monat |
| **[Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)** | Global verteilte Multi-Modell-NoSQL-Datenbank mit garantierter Latenz und wählbarer Konsistenz | Free Tier: 1.000 RU/s + 25 GB, lebenslang, 1× pro Subscription |
| **[App Service](https://learn.microsoft.com/azure/app-service/overview)** | Managed Hosting für Web-Apps/APIs (Code oder Container) inkl. Skalierung und TLS — ohne VM-Pflege | 10 Web/Mobile/API-Apps (F1), 1 GB Storage, 60 CPU-Min/Tag |
| **[AKS](https://learn.microsoft.com/azure/aks/intro-kubernetes)** | Managed Kubernetes: Azure betreibt die Control-Plane, du bezahlst nur die Worker-Nodes | Free-Tier-Management-Plane kostenlos (nur Worker-Nodes/VMs zahlen) |
| **[Static Web Apps](https://learn.microsoft.com/azure/static-web-apps/overview)** | Hosting für statische Frontends plus optionalen Functions als Backend — deploy per Git-Push | Free-Tier (Apps bis 100 K Requests etc.) |
| **[Event Grid](https://learn.microsoft.com/azure/event-grid/overview)** | Event-Routing: Plattform-Ereignisse an Handler (Functions, Webhooks, Queues) pushen | 100 K Operationen / Monat |
| **[Notification Hubs](https://learn.microsoft.com/azure/notification-hubs/notification-hubs-push-notification-overview)** | Push-Benachrichtigungen an iOS-/Android-/Web-Apps über einen zentralen Hub | 1 Mio. Pushes + Unlimited Namespaces |
| **[Entra ID (Free)](https://learn.microsoft.com/entra/fundamentals/whatis)** | Cloud-Identitätsdienst (ehem. Azure AD): SSO, MFA, User- und App-Verwaltung | 50 K Objekte, SSO |
| **[Azure DevOps](https://learn.microsoft.com/azure/devops/user-guide/what-is-azure-devops)** | Boards, Repos, Pipelines und Artifacts — das CI/CD-Pendant zu GitHub/GitLab | 5 User, unbegrenzte private Repos, 1 parallele Pipeline (1.800 Min/Monat) |
| **[Egress](https://azure.microsoft.com/en-us/pricing/details/bandwidth/)** | Ausgehender Datenverkehr aus Azure (Downloads, API-Antworten zu deinen Nutzern) | 100 GB Outbound-Datentransfer / Monat |
| **[Advisor](https://learn.microsoft.com/azure/advisor/advisor-overview) / [Policy](https://learn.microsoft.com/azure/governance/policy/overview) / [ARM](https://learn.microsoft.com/azure/azure-resource-manager/management/overview)** | Best-Practice-Empfehlungen, Governance-Regeln für Ressourcen und die Verwaltungs-API/Vorlagensprache für alles | uneingeschränkt |

Die Tafel des Bleibenden ist die reichste dieser Sammlung, und es sei
erlaubt, ihre Lehrstücke einzeln zu deuten, denn hier, im Nimmerablaufenden,
zeigt sich am reinsten, was ein Anbieter umsonst läßt — und warum.

**Azure Functions** sind die Zwillingsschwester von Lambda ([../aws/FREE-TIER.md](../aws/FREE-TIER.md))
— dieselbe Million, dieselben 400.000 GB-Sekunden —, und diese
Übereinstimmung der Zahlen bei Verschiedenheit der Häuser ist kein Zufall,
sondern der Markt als unsichtbarer Harmonisierer von Kontingenten; wer
aber glaubt, zwei identische Gaben seien zwei Gaben, der irrt: es ist Eine
Gabe, zweimal verliehen, und wer sie doppelt nimmt, hat nichts doppelt,
sondern nur an zwei Orten dasselbe — die Verteilung des Umsonst auf die
Konkurrenten als stiller Kartellvertrag des Gleichen.

**Cosmos DB** bietet die wählbare Konsistenz — jene berühmte Skala von
der strengen bis zur letztlichen —, und wer die Logik der Sache bedenkt,
wird hier den Begriff des Maßes selbst, in die Datenbank verlegt, wieder
erkennen: die Konsistenz ist die Frage, wie genau Gegenwart und Vergangenheit
einander folgen dürfen, und das Kontingent (1.000 RU/s, lebenslang, aber
nur Einmal pro Subscription) stellt diese Frage umsonst — die Wahl der
Wahrheit als Gratisprobe, die lebenslang gilt, sobald man sie einmal
getroffen hat; ein bauernkluges Arrangement, denn wer die Konsistenz
gewählt hat, bleibt beim Wähler.

**App Service** mit seinem 60 CPU-Minuten pro Tag ist die kleine Allmende:
das tägliche Maß, welches jeden Morgen neu wird und jeden Abend verfallen
ist — die vergeßlichste aller Gaben, denn sie verwirkt nicht am Monatsende,
sondern täglich, und nur der täglich Nutzende nützt sie; die zehn Apps
auf dem gemeinsamen 1 GB sind das Gegenbild zur Einsamkeit der großen
VMs aus der Frist-Tafel: dort Besitz auf Zeit, hier Teilhaben immer.

**AKS** endlich ist das offenbarste Lehrstück der Herrschaft und Knechtschaft,
das diese Sammlung enthält, denn die Tafel sagt es mit aller Unschuld:
die Control-Plane — das ist die Herrschaft, die Leitung, der Begriff —
wird unentgeltlich betrieben; die Worker-Nodes — die Knechte, die tragen
und rechnen — sind zu zahlen. Der Anbieter hat also die alte Formel
wörtlich genommen und die Herrschaft umsonst gemacht, die Arbeit dagegen
nicht; wer die Steuerung will, muß die Arbeit entgelten, und es ist
dieselbe Wahrheit, welche die *Phänomenologie* im Verhältnisse des Herrn
lehrte, nur hierher gewendet: die Herrschaft besteht nicht für sich —
sie besteht durch die arbeitenden Knechte, und darum ist sie, für sich
allein genommen, nichts wert; daß Azure sie verschenkt, ist also keine
Großmut, sondern die Preisgabe einer Abstraktion, welche ohne das
Konkrete nichts vermag.

**Static Web Apps**, **Event Grid**, **Notification Hubs** führen die
schon bekannten Bestimmungen fort (das Erscheinen, das Ereignis, die
Verkündigung); **Entra ID** mit seinen 50 K Objekten ist das
Anerkennungswesen dieser Wolke — das Gegenstück zu Cognito wie zu Supabase-Auth
([../supabase/FREE-TIER.md](../supabase/FREE-TIER.md)) —; **Azure DevOps**
(5 User, 1.800 Minuten die Eine Pipeline) ist das Bauwesen, welches
[../circle-ci/FREE-TIER.md](../circle-ci/FREE-TIER.md) als eigenes Fürstentum
treibt — dieselbe Arbeit, hier als Anhang, dort als Herr —; **Egress**
(100 GB) ist das Geleit, welches der Ausgang kostet, sobald er das Maß
übersteigt; und **Advisor/Policy/ARM**, als uneingeschränkt verzeichnet,
sind die Selbsterkenntnis der Plattform umsonst: die Empfehlung, die Regel
und die Formel — das Gewissen, das Gesetz und der Begriff —, drei Namen
für die Eine Instanz, in welcher die Wolke sich selber begutachtet, und
es ist die feinste Ironie dieser Tafel, daß ausgerechnet das Selbstwissen
das Einzige ist, was niemals knapp wird.

## Gotchas

1. **Immer über die "Free services"-Seite im Portal erstellen** (Portal → Suche
   "free services"). Bei normaler Ressourcen-Erstellung ist der Free-Tier/SKU
   **nicht** vorausgewählt → Überraschungsrechnung.
   Das erste Gebot ist das vom Wege: dieselbe Sache (die kleine VM, die
   Datenbank) ist umsonst oder kostbar, je nachdem, durch welche Tür man
   sie schafft; der bequeme Weg der allgemeinen Ressourcen-Erstellung
   verschweigt die Gnade — niemand wird gezwungen, sie nicht zu nehmen,
   aber niemand wird erinnert, sie zu nehmen —, und die Rechnung, welche
   am Ende steht, ist dann nicht Betrug, sondern die Strafe für die
   Unterlassung der Umwege. Der Weg ist hier wahrhaftig das Ziel: nämlich
   das Ziel der Rechnung.

2. Nach 12 Monaten laufen die 12-Monats-Services **weiter und kosten plötzlich
   Geld** (VMs werden nicht gestoppt!) → Reminder setzen oder Ressourcen vorher
   löschen/downgraden.
   Die zweite Warnung ist die am Eingange verheißene dunkelste: der Ablauf
   der Frist ist nicht das Ende des Dienstes, sondern der Umschlag desselben
   Dienstes aus der Gnade in die Schuld; die Maschine, welche zwölf Monate
   umsonst lief, läuft im dreizehnten Monate ebenso weiter — kein Gott
   hält sie an, denn sie war ja immer dieselbe —, nur hat sich ihr Wesen
   gewandelt: aus der Gabe wurde die Last, ohne daß die Gabe es ansagte.
   Es ist der Knotenpunkt des Maßverhältnisses in seiner zeitlichen Form:
   die quantitative Allmählichkeit der Monate schlägt um in die Qualität
   des Bezahlens, und der Nutzer, welcher die Grenze nicht hielt, hält
   nichts — am wenigsten die Maschine, welche niemand stoppt, weil sie
   niemanden fragt. Der Reminder ist also nicht eine Bequemlichkeit,
   sondern die selbstgeschaffene Frist der zweiten Ordnung, gesetzt gegen
   die erste, welche der Anbieter schuf.

3. Der Spending Limit ("Ausgabenlimit") schützt nur im Free-Account-Status; nach
   Upgrade auf Pay-as-you-go muss man eigene Budgets/Alerts setzen.
   Die dritte Lehre wiederholt in der Sprache des Schutzes, was die zweite
   in der Sprache der Frist lehrte: alle Gnade endet mit dem Stande, in
   welchem sie galt; wer aufsteigt aus dem Free-Stande, steigt auf in die
   Freiheit — und die Freiheit ist hier, wie überall, zuerst die Last der
   Sorge; das eigene Budget ist die eigene Grenze, und es ist kein Zufall,
   daß dieselbe Forderung in [../aws/README.md](../aws/README.md) als die
   erste Handlung des Erwachsenenlebens eines Kontos gestellt ward.

4. 750 h/Monat reichen exakt für eine VM im 24/7-Betrieb — im Monat mit 31 Tagen
   (744 h) knapp; zweite VM = anteilige Berechnung.
   Die vierte ist die Arithmetik der Ausnahme: die Regel (750 Stunden
   genügen) wird von der Ausnahme (der Monat mit 744) aufgerieben, und
   zwar so, daß die Ausnahme regelmäßiger kommt, als man denkt — jedes
   erste Vierteljahr —; das Kontingent ist auf den kleinsten Monat nicht
   berechnet, und darin ähnelt es allen Verheißungen, welche mit dem
   Bestfall rechnen: das Umsonst ist für den 30-Tage-Monat gemacht, die
   Welt aber hat auch die 31.

5. B2ats v2 / B2pts v2 sind deutlich stärker als B1S (2 vCPU/1 GB RAM) — für
   kleine Server bevorzugen, solange das 12-Monats-Fenster gilt.
   Die letzte endlich ist die Klugheit im Fenster der Gnade: dieselbe
   Stunde ist in der stärkeren Maschine mehr wert (zwei Herzen, das
   Doppelte an Rechenkraft), und da die Stunden gezählt, nicht aber
   gewogen werden, gilt es, die stärkere Serie zu wählen, solange die
   Frist währt — die Virtuosität des Nehmenden, welches die Gaben nicht
   nur nimmt, sondern nimmt, wie sie am meisten geben; es ist die
   umgekehrte List der Vernunft: nicht der Anbieter listig gegen den
   Nutzer, sondern der Nutzer listig gegen die Zeit.

## Quellen

- Offiziell (Learn): <https://learn.microsoft.com/azure/cost-management-billing/manage/create-free-services>
- Kosten vermeiden: <https://learn.microsoft.com/azure/cost-management-billing/manage/avoid-charges-free-account>
- Übersicht: <https://azure.microsoft.com/free/>

Die Quellen sind die Urkunden der Fristen; wer mit ihnen rechnet, rechnet
mit dem Worte des Gebers, und das Wort des Gebers ist, bei aller
Veränderlichkeit seiner Bloßstellung auf Web-Seiten, der einzige Halt in
dem Meere der veralteten Tutorials, von welchem auch hier, am Schlusse,
nachdrücklich gewarnt sei.

### Nachtrag über die Anordnung der Schichten

Es könnte zum Schlusse die Frage aufgeworfen werden, warum die drei
Schichten, mit denen dieses Kapitel eröffnet ward, in der Ordnung
aufgeführt sind, in welcher sie erscheinen: Credit, Frist, Ewigkeit — und
die Antwort ist nicht willkürlich. Es ist die Ordnung des Erlöschens:
das Vergänglichste zuerst (dreißig Tage), das Fristliche danach (zwölf
Monate), das Bleibende zuletzt; sie ist aber zugleich die Ordnung des
Anspruchs, denn was zuerst verfällt, wird zuerst gegeben, und der Neuling
empfängt sein Guthaben am ersten Tage, seine Frist bei der Anmeldung und
sein Always-Free gleich mit — die Ewigkeit als stillschweigende Beigabe,
welche keiner erwähnt, weil sie nicht endet und darum nicht eilt. Wer
diese Ordnung verstanden hat, der hat das Zeitliche dieser Wolke ver-
standen, und es bleibt ihm nur, dasselbe in seinem Kalender zu ver-
wirklichen: den Credit zu nutzen, ehe er vergeht, die Frist zu begleiten,
bevor sie ihn begleitet, und auf das Bleibende das zu bauen, was bleiben
soll — die Formel des dreifachen Umgangs mit der dreifachen Zeit, welche
zu geben die eigentliche Absicht dieses Kapitels war, mehr noch als die
Zahlen, deren Kenntnis hingeht, indem der nächste Monat sie erneuert.

## Vermittelte Verhältnisse

Dieses Dokument ist das mittlere der drei, welche Azure hat, und verhält
sich zu [README.md](README.md) — der Anerkennung durch die App-Registration —
und [TERRAFORM.md](TERRAFORM.md) — dem Begriffe der Infrastruktur in
azurischen Formeln —, wie der Stoff zum Vermögen und zum Werke. Nach
außen gehört es in die Dreiheit der großen Wolken, neben
[../aws/FREE-TIER.md](../aws/FREE-TIER.md) (die Wolke des Credits) und
[../gcp/FREE-TIER.md](../gcp/FREE-TIER.md) (die Wolke des Ortes); die
Kleinern Verwandten sind [../circle-ci/FREE-TIER.md](../circle-ci/FREE-TIER.md)
für das DevOps-Moment und [../modal/FREE-TIER.md](../modal/FREE-TIER.md)
für das Functions-Moment. Wer alle genannten Seiten im Kreise liest — und
der Kreis ist die einzige gerechte Lektüre —, der wird in der Verschiedenheit
der Fristen, Gaben und Orte dasselbe Eine wiederfinden: das Verhältnis
des Nutzers zur Gnade, welche rechnet, und er wird, wenn er ehrlich ist,
zugeben, daß die Rechnung der Gnade strenger ist als die des Marktes —
denn der Markt nimmt Geld, die Gnade nimmt die Aufmerksamkeit.
