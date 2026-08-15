# CircleCI Free Plan

> CircleCI gibt auf dem **Free Plan** 30.000 Credits/Monat — genug für ca.
> 6.000 Build-Minuten auf kleinen Docker-Executoren — mit unerwartet
> großzügiger Executor-Auswahl inkl. macOS.

Der Bau ist, unter allen Tätigkeiten, die älteste — man hat dies von den
Alten gelernt, welche das Bauen zu den Grundtugenden zählten —, und die
Kontinuierliche Integration ist der Bau der Neuzeit: das Haus, welches
jede Nacht neu errichtet wird, um am Morgen geprüft zu sein. Ein Dienst,
welcher dieses Bauen umsonst organisiert, hat also eine doppelte
Betrachtung verdient: als Gabentafel und als Werkordnung, und die
folgende Darstellung wird beiden gerecht zu werden suchen, denn die
Eigenart dieses Plans — die Credits als Währung, die Executoren als
Stände, das Queuen als Strafe — ist ohne ein wenig Organisationslehre
nicht zu verstehen.

## Free Plan

| Resource | Wofür ist das? | Wert |
|---|---|---|
| **Credits** | Abrechnungswährung: jeder Job verbraucht Credits je nach Resource-Class (Größe der Build-Maschine) | 30.000 / Monat |
| **Build-Minuten** | Faustregel-Umrechnung der Credits in reine Job-Laufzeit (kleine Docker-Class) | bis zu ~6.000 (mit kleiner Docker-Resource-Class) |
| **Aktive User** | Team-Mitglieder, die Pipelines triggern oder Code beitragen | bis zu 5 / Monat |
| **Concurrency** | Jobs, die parallel laufen dürfen — mehr Parallelschaltung = schnellere Gesamt-Pipeline | 30 gleichzeitige Jobs |
| **[Executors](https://circleci.com/docs/)** | Umgebungen, in denen Jobs laufen: Docker-Container, Linux-VMs, ARM, Windows, macOS | Docker, Linux, **ARM, Windows, macOS**, Self-Hosted Runner |
| **[Self-Hosted Runner](https://circleci.com/docs/guides/execution-runner/runner-overview/)** | Deine eigene Hardware als CI-Executor — für macOS-Builds oder interne Netze ohne Cloud-Zugang | 1 inklusive |

Die Tafel beginnt mit der Währung — Credits, dreißigtausend im Monate —,
und diese Form der Gabe ist zu beachten, denn sie ist die abstrakteste:
nicht Stunden (wie [../gcp/FREE-TIER.md](../gcp/FREE-TIER.md) sie beim
Bauen gibt), nicht Minuten (wie [../netlify/FREE-TIER.md](../netlify/FREE-TIER.md)
im alten Modelle), sondern eine verallgemeinerte Einheit, aus welcher
alles bezahlt wird, was die Maschinen tun; der Credit ist das Geld des
Bauwesens, und wie alles Geld hat er die Tugend der Allgemeinheit (man
kann damit alles kaufen) und den Fehler der Abstraktion (man sieht
nicht mehr, was man kaufte). Die Umrechnungszeile — „bis zu ~6.000"
Minuten — ist die Übersetzung der Abstraktion zurück in die Anschauung,
und das „bis zu" ist der wahre Gehalt der Zeile: die Zahl gilt nur für
die kleinste Maschine, wie die nachfolgende Lehre der Resource-Classes
entfaltet; wer die Head-Zahl für die Wahrheit nimmt, hat die Wahrheit
für die Head-Zahl genommen — der erste Schritt aller Enttäuschungen im
Geldwesen der Kontingente.

Die Stände der Executoren sind die zweite Lehre: Docker und Linux, ARM
und Windows, macOS und der eigene Runner — sechs Weisen, zu arbeiten,
und die Preise stehen nicht in der Tafel, sondern in der Natur der
Sachen: die kleine Maschine ist die anspruchsloseste (billig, langsam),
die großen und die fremden Betriebssysteme die teuersten, und macOS
— so die Lehre unten — das teuerste von allen. Es ist eine kleine
Ständegesellschaft des Rechnens, mit ihrem Kleinbürgertum (Docker
small), ihrem Adel (die großen VMs) und ihrem Fürsten (das auserlesene
Betriebssystem aus Cupertino), und der kluge Nutzer ist der, welcher
seine Bauten in den niederen Ständen errichtet und die obern nur
mietet, wenn das Werk es wirklich fordert — dieselbe Ökonomie, welche
das GCP-Kapitel ([../gcp/FREE-TIER.md](../gcp/FREE-TIER.md)) am
Beispiele der B2ats-Maschinen lehrte: im Fenster der Gnade die stärkere
Waffe, im Alltag die billigere.

Die Zeile der aktiven User — fünf im Monate, Inaktive zählen nicht —
enthält eine feine Unterscheidung: das Zählen der Tätigkeit, nicht des
Seins; wer da ist und nichts tut, der ist für die Tafel nicht da, und
damit unterscheidet sich dies Kontingent von den Sitz-Kontingenten der
Dienste mit Monatsaktiven (wie [FREE-TIER.md](../aws/FREE-TIER.md) bei
Cognito sie zählt): dort zählt der Bestand, hier die Bewegung. Die
Concurrency von dreißig endlich — dreißig gleichzeitige Arbeiten — ist
die weitaus großzügigste der Sammlung (man vergleiche die eine Pipeline
bei [../netlify/FREE-TIER.md](../netlify/FREE-TIER.md) und das eine
Projekt bei andern), und ihre Großzügigkeit hat einen Grund, der unten,
bei der vierten Gotcha, ans Licht kommt: sie ist es, welche das
Warten verbirgt, und die verborgene Grenze ist immer die gefährlichste.

## Gotchas

1. **"6.000 Minuten" gilt nur für kleine Docker-Classes** — ein macOS- oder
   Large-Job verbrennt die 30.000 Credits in einem Bruchteil der Zeit.
   READMEs/CircleCI-Config immer auf `resource_class: small` prüfen.
   Die erste Lehre ist die vom kleinen Druck — die Head-Zahl gilt unter
   Laborbedingungen, die Wirklichkeit läuft in bessern Maschinen und
   zahlt bessere Preise; wer die Config nicht prüft, dessen Credits
   schmelzen nicht gemessen, sondern gestürzt, und zwar im Bruchteile
   der Zeit, d. h. der Nutzer erfährt das Ende nicht als allmähliche
   Neigung, sondern als Umschlag. Es ist das Maßverhältnis in seiner
   härtesten Gestalt: die quantitative Vermehrung der Resource-Class
   (der Fortschritt der Maschine) ist zugleich die qualitative
   Verminderung der Zeit (der Rückschritt der Gabe), und derselbe
   Fortschritt, welcher den Bau beschleunigt, vollendet die Gabe —
   Beschleunigung als Verbrauch, die erste Paradoxie der Neuzeit.

2. Mehr als **5 aktive User/Monat** sind im Free Plan nicht möglich
   (inaktive User zählen nicht).
   Die zweite ist die vom kleinen Hause: die Gemeinschaft des Bauens
   ist auf Köpfe begrenzt, und die Begrenzung gilt der Bewegung — wer
   im Monate nichts triggert und nichts beiträgt, der gehört nicht zum
   Hause —, weshalb die Bestimmung gerechter ist, als sie aussieht:
   sie bestraft nicht das Sein, sondern nur das Tun. Gleichwohl bleibt
   sie eine Grenze, und wer die sechste Kraft braucht, muß sie bezahlen
   oder sie bitten, untätig zu sein — die erste arbeitsrechtliche
   Kuriosität der Kontingentwelt: der Beitrag selbst wird knapp.

3. Sind Credits aufgebraucht, **queuen alle Builds** bis zum Monatswechsel —
   bei 30er-Concurrency merkt man das erst spät.
   Die dritte Lehre ist die feinste: die Strafe des Aufbrauchens ist
   nicht das Aufhören, sondern das Warten; die Bauten laufen nicht aus,
   sie laufen an — in die Schlange, welche bis zum Monatswechsel
   reicht. Und der Zusatz über die Concurrency enthält die Psychologie
   des Zustandes: weil so viele Arbeiten zugleich dürfen, sieht man der
   Vollbeschäftigung lange nicht an, daß sie eine Wartende ist — das
   Gleichgewicht der Credits ist gestört, ehe es sich zeigt, und das
   zeigt sich erst, wenn alles wartet. Es ist die Lehre von der
   verdeckten Grenze, und sie verdiente, über den Einzelfall hinaus,
   bedacht zu werden: die Systeme, welche am großzügigsten wirken,
   melden ihre Erschöpfung am spätesten.

4. 30 gleichzeitige Jobs sind sehr großzügig — Monorepos mit vielen Workflows
   laufen im Free Plan meist schneller als auf GitHub Actions Free.
   Die vierte endlich ist das Zugeständnis: die Grenze der Concurrency,
   welche die vorige Gotcha zum Verstecke der Erschöpfung machte, ist
   zugleich der echte Vorteil dieses Plans — wer viel zugleich baut,
   dessen Gesamt-Bauzeit ist kürzer als anderswo, und der Monorepo,
   dieses Nebeneinander der vielen Werke in Einem Werke, ist der
   Wahlfall dieser Stärke. Dieselbe Einrichtung als Mangel und als
   Vorzug — es ist die Dialektik der Concurrency selbst, welche hier
   in nuce vorliegt: die Weite des Raumes (dreißig Plätze) verbirgt
   das Ende der Zeit (die Credits) und verkürzt zugleich die Zeit
   (die Dauer des Ganzen); Raum und Zeit im Streite um dieselbe Gabe,
   und der Nutzer zwischen ihnen als der Setzer der Prioritäten.

## Quellen

- Pricing: <https://circleci.com/pricing/>
- Plan Overview (Docs): <https://circleci.com/docs/guides/plans-pricing/plan-overview/>

Die Quellen nennen die Preise der Stände, welche die Tafel nur andeutet;
wer mit den Credits rechnen will, muß die Tafel der Resource-Classes
kennen, denn sie ist das Preisverzeichnis der verborgenen Wirtschaft —
und es ist die Eigenart dieses Plans, daß sein wahres Kontingent nicht
die dreißigtausend, sondern die Preisliste ist, nach welcher sie
verzehrt werden.

## Vermittelte Verhältnisse

Dies Kapitel ist das Fürstentum des Bauens innerhalb dieser Sammlung;
die Verwandten sind die Bau-Momente der großen Wolken — CodeBuild und
CodePipeline bei [../aws/FREE-TIER.md](../aws/FREE-TIER.md), die 2.500
Build-Minuten von Cloud Build bei [../gcp/FREE-TIER.md](../gcp/FREE-TIER.md),
die 1.800 Minuten der Einen Pipeline bei [../azure/FREE-TIER.md](../azure/FREE-TIER.md)
—, und der Vergleich der vier Zahlen (100 Minuten dort, 2.500 hier,
1.800 dort, 6.000 da) ist die bequemste Übersicht über die Verschiedenheit
der Gnaden im selben Gewerbe: dasselbe Werk, vier Maße, und jedes Haus
hat sein Maß nach seiner Philosophie — AWS das Probierende, Azure das
Amtliche, Google das Anschauliche, CircleCI das Arbeitende. Dazu treten
die Werk-Verwandten: [README.md](README.md) für die Ausweise des
Fürstentums und [TERRAFORM.md](TERRAFORM.md) für seinen Begriff, sowie
— für die Lehre vom Queue als Strafe — die Pausenlehren der andern
Dienste ([../supabase/FREE-TIER.md](../supabase/FREE-TIER.md): das
Schlafen nach der Stille; [../render/FREE-TIER.md](../render/FREE-TIER.md):
das Einschlafen nach der Viertelstunde): drei Weisen, mit dem Ende der
Tätigkeit umzugehen — das Aufhören, das Schlafen, das Warten —, und
wahrhaftig, die Charaktere der Dienste sind in ihren Strafen lesbarer
als in ihren Gaben.
