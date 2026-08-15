# Google Cloud — Auth für Terraform

> Bevorzugt: **`gcloud auth application-default login`** (User-Credentials)
> lokal, **Service Account** für CI — der google-Provider liest die
> Application Default Credentials (ADC) automatisch.

Unter allen Authentisierungen dieser Sammlung ist die Googlesche die
heimlichste und die hintergründigste; denn sie hat das Eigene, daß sie
zweierlei Login kennt — einen für das Werkzeug selbst und einen für die
Werkzeuge der Werkzeuge —, und diese Zweiheit, welche die nachfolgende
Anleitung mit dem beiläufigen Zusatz „wichtig!" versieht, ist in
Wahrheit eine ganze kleine Lehre vom Ich und seinen Organen. Wer
`gcloud auth login` spricht, der meldet sich an als der, welcher er
ist — die Person für sich; wer aber `application-default login` spricht,
der meldet die Person an für das, was die Person gebraucht — die
Organisation der eigenen Werkzeuge, welche fortan, in den Application
Default Credentials, ein Recht haben, im Namen der Person zu verkehren,
ohne die Person zu sein. Es ist der Unterschied zwischen dem Sein und
dem Für-etwas-Sein, hier in die Technik der Ausweise übersetzt, und wer
ihn einmal begriffen hat, wird nie wieder die beiden Logins verwechseln,
so wenig wie er das Sehen der Augen mit dem Auge verwechselt, welches
sie braucht.

## 1. Credential erstellen

**Option A — User-Login via ADC (empfohlen, lokal):**

```bash
gcloud auth login                        # Login für gcloud selbst
gcloud auth application-default login    # Login FÜR TERRAFORM/SDKs (wichtig!)
gcloud config set project my-free-project
```

Das Schema der drei Optionen ist, mutatis mutandis, dasselbe, welches
[../aws/README.md](../aws/README.md) und [../azure/README.md](../azure/README.md)
entwickelt haben: die Person für den lokalen Gebrauch, der Beauftragte
für die Maschine, die Föderation für die CI ohne Geheimnis; es sei hier
nicht wiederholt, sondern nur das Eigene dieser Wolke hervorgehoben —
erstens die genannte Zweiheit der Logins, welche die Person lehrt, daß
sie mehr ist als ihr Werkzeug, und das Werkzeug, daß es weniger ist als
die Person; zweitens das Projekt (`config set project`), welches als
dritte Bestimmung hinzutritt: bei Google ist die Anerkennung nie nur
persönlich, sondern stets personen- und projektbezüglich — der Wille,
welcher sich ausweist, ist immer schon der Wille in einem Vorhaben, und
das Vorhaben (das Projekt) hat eigne Grenzen, eigne Rechnung, eigne
Fristen, wie das Kontingent-Kapitel [FREE-TIER.md](FREE-TIER.md) im
einzelnen zeigt; das Projekt ist das Konkrete der Anerkennung, ihre
Bezugnahme auf einen Inhalt, und insofern die höchste Stufe derselben:
nicht ein abstraktes Rechtssubjekt, sondern ein gegebenes Wollen mit
Namen.

**Option B — Service Account (CI):**
Console → IAM & Admin → Service Accounts → Create → *Keys* →
*Add key* → JSON erstellen (einmaliger Download).

Der Service Account ist der Beauftragte — das Gegenstück zum Principal
bei Azure und zum IAM-User bei AWS —, und die Form seines Ausweises ist
die JSON-Datei: das vollständige Geheimnis in Einer Datei, welche
heruntergeladen wird, einmalig, und fortan das ist, was der dritte
Hinweis mit Recht den „vollen Key" nennt. Man bedenke die Struktur
dieses Arrangements: die gesamte Macht des Beauftragten in einer
einzigen, kopierbaren, verschickbaren Datei — die Konzentration, welche
alle Gefahr der Konzentration hat, und die Einfachheit, welche alle
Bequemlichkeit der Einfachheit hat; es ist die Münzform des
Geheimnisses, gut zum Tragen, gut zum Verlieren.

**Option C — CI ohne Key-Datei:** Workload Identity Federation
(GitHub Actions: `google-github-actions/auth` mit OIDC) — kein JSON-File.

Die dritte Option hebt die Datei auf, wie Azure die Federated Credentials
und AWS die OIDC-Rolle: die CI beglaubigt sich durch das Zeugnis eines
Dritten, und das Geheimnis wird durch das Vertrauen ersetzt, welches
zwei Häuser einander vorher zugesagt haben; die Workload Identity
Federation — die Föderation der Arbeitslasten, wie der Name sagt — ist
damit die fortgeschrittenste Gestalt, und es ist nur eine Frage der
Zeit, bis sie die alleinige sein wird, denn die Geschichte der
Authentisierung ist, wie alle Geschichte, die Bewegung vom Haben zum
Gelten, und die Datei ist das Haben in seiner rohesten Form.

## 2. In Terraform einbinden

```bash
export GOOGLE_APPLICATION_CREDENTIALS="/pfad/zu/sa-key.json"  # nur Option B
# Option A: nichts nötig
```

```hcl
provider "google" {
  project = "my-free-project"
  region  = "us-central1" # Always-Free-Region!
}
```

Die Einbindung ist die kürzeste dieser Sammlung: eine Env-Variable für
die Beauftragtenform, nichts für die persönliche; und der Provider-Block
nennt das Projekt und die Region — mit jenem Kommentar, der der ganze
Kern dieser Wolke ist: „Always-Free-Region!". Denn hier ist die
Anerkennung nicht zu trennen vom Orte: der Ausweis gilt überall, aber
die Gnade gilt nur in den drei Häfen der neuen Welt; wer die Region
falsch setzt, der authentisiert sich richtig und wird trotzdem arm —
ein Zustand, der die Aufmerksamkeit auf den Unterschied lenkt zwischen
dem, was der Wille kann (alles, wozu er berechtigt ist), und dem, was
die Welt ihm gibt (das Kontingent am bestimmten Orte); die Wahrheit des
Nutzers ist also nicht nur sein Ausweis, sondern sein Ausweis samt dem
Orte seines Wollens, und die Zeile `region = "us-central1"` ist, recht
gelesen, so wichtig wie der ganze Login.

## 3. Hinweise

- Free Trial/$300-Guthaben braucht trotzdem ein **Billing-Konto** am
  Projekt — sonst verweigern viele Services (Cloud Run & Co.) das Anlegen.
  Der erste Hinweis ist die Paradoxie des Gnadenweges: das Geschenk setzt
  die Anmeldestelle des Bezahlens voraus; wer die dreihundert Dollar
  will, muß ein Billing-Konto anlegen — nicht damit gezahlt werde,
  sondern damit gezählt werden könnte —, und die Dienste verweigern das
  Anlegen, wenn die Zählmöglichkeit fehlt. Es ist dieselbe Struktur, die
  in der Welt der Ehrungen „der Orden setzt die Akte voraus" heißen
  würde: die Form des Bezahlens ist die Bedingung der Form des Umsonst;
  wer hierin Heuchelei sieht, hat nicht unrecht, wer Konsequenz sieht,
  auch nicht — es ist die Konsequenz einer Ordnung, welche umsonst nur
  innerhalb ihrer Rechenhaftigkeit kennt, nicht außerhalb ihrer.

- Service-Account-JSON = voller Key; bei Leak sofort in IAM deaktivieren.
  Für Produktion Workload Identity bevorzugen.
  Der zweite Hinweis wiederholt die Lehre von der Münzform: was getragen
  wird, kann verloren gehen, und was verloren gehen kann, muß
  abschaltbar sein; die IAM-Deaktivierung ist das Pfand dafür, daß der
  Verlust nicht die Welt ist — das Geheimnis stirbt, ehe es andere
  mißbrauchen kann, vorausgesetzt, der Eigentümer eilt —, und die
  Empfehlung, die Föderation vorzuziehen, ist die Konsequenz aus der
  Lehre selbst: das beste Geheimnis ist das, welches nicht mehr getragen
  wird, weil es ersetzt ist.

- **Region vor Auth entscheiden:** Always Free nur in us-west1/us-central1/
  us-east1 (siehe TERRAFORM.md) — `region`/`zone` pflichtbewusst setzen.
  Der dritte endlich setzt die Reihenfolge des Entscheidens fest: erst
  der Ort, dann der Ausweis; es klingt sonderbar, denn die Welt ordnet
  umgekehrt — erst weist man sich aus, dann geht man hin —, aber in der
  Welt der Kontingente ist der Ort das Frühere, weil die Gnade am Orte
  hängt und der Ausweis nur die Tür öffnet, hinter welcher vielleicht
  keine Gnade ist. Wer den Ort entscheidet, entscheidet über den
  Reichtum seines künftigen Wollens; wer nur den Ausweis besorgt, besorgt
  das Wenigere, und die Empfehlung, `region`/`zone` pflichtbewußt zu
  setzen, ist die verdichtete Form dieser ganzen Wahrheit — siehe dazu
  auch [TERRAFORM.md](TERRAFORM.md), wo die drei Häfen in der Sprache
  der Formeln wiederkehren.

## Quellen

- Provider-Auth: <https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference>
- ADC: <https://cloud.google.com/docs/authentication/provide-credentials-adc>

## Vermittelte Verhältnisse

Die Anerkennung ist die Schwelle der beiden andern Dokumente:
[FREE-TIER.md](FREE-TIER.md) lehrt die Gaben, [TERRAFORM.md](TERRAFORM.md)
den Begriff, und ohne die Schwelle wäre jenes unerreichbar und dieses
unanwendbar; nach außen führt der Weg zu den Geschwistern der Gattung,
[../aws/README.md](../aws/README.md) und [../azure/README.md](../azure/README.md),
mit denen dies Kapitel die Dreiheit der großen Ausweise bildet — Person,
Beauftragter, Föderation, überall dieselben drei, unter drei Namen —,
sowie zu [../helpers.md](../helpers.md), welches das Gleiche auf der
Ebene der Agenten wiederholt: auch der Agent weist sich aus, auch er hat
seine Beauftragten (die MCP-Server), auch dort entscheidet der Ort (der
Scope) über die Gnade (die Rechte). Wer alle diese Spiegel nebeneinander
hält, der sieht ein einziges Motiv in lauter Variationen — und es ist
das Motiv, dessen dieses ganze Werk voll ist: die Formen der Anerkennung
sind die Formen des Verkehrs, und der Verkehr ist die Wahrheit der
Vermittlung.
