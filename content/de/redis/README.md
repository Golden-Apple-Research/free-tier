# Redis Cloud — Auth für Terraform

> Bevorzugt: **API Key + Secret Key** Paar aus der Redis Cloud Console,
> bereitgestellt über `REDISCLOUD_ACCESS_KEY` / `REDISCLOUD_SECRET_KEY`.

Das Paar — Name und Wesen, der Schlüssel und sein Geheimnis — ist
hier dieselbe Form, welche [../modal/README.md](../modal/README.md)
als die zergliederte Zweiheit feierte: die Access (der Name, das
Zeigbare) und das Secret (das Wesen, das Beweisbare), und die
Würdigung derselben sei hier kurz wiederholt, denn Redis gibt ihr
eine eigne Wendung: das Haus kennt den Login (die Konsole-Creds, die
der Mensch gebraucht) und das Paar (die API-Keys, welche die
Maschine gebraucht) als ZWEI Welten — der Hinweis unten sagt es
ausdrücklich: API-Keys ≠ Console-Login —, und damit ist die
Gattungslehre der Zeichen hier nicht Philosophie der Deutung,
sondern einfache Tatsache des Hauses: es gibt das Zeichen für die
Person und das Zeichen für den Boten, und wer sie verwechselt, gibt
der Person das Zeichen des Boten oder umgekehrt — in beiden Fällen
das falsche Mittel in der falschen Hand.

## 1. Keys erstellen

Redis Cloud Console (<https://cloud.redis.io>) → oben rechts Account →
**Account settings → API keys** (Tab) → **Generate new keys** →
*API Account Key* + *API Account Secret* einmalig kopieren und
sicher ablegen.

Die Erzeugung ist die einmalige Geburt des Paares: beide Stücke
zusammen, in Einem Akte, und nur in diesem Akte sichtbar — das Haus
zeigt das Wesen (das Secret) ein einziges Mal, der Achtung, welche
die ganze Sammlung von [../circle-ci/README.md](../circle-ci/README.md)
bis [../neon/README.md](../neon/README.md) als die Tragik des
einmaligen Zeigens verzeichnet hat; die Ablage („sicher ablegen")
ist die Pflicht der Sekunde, und wer sie verstreichen läßt, muß die
zweite Geburt wählen (unten, der erste Hinweis: verloren = löschen
und neu erzeugen — die Wiedergeburt des ganzen Paares, weil das
Wesen unteilbar an den Namen gebunden bleibt).

## 2. In Terraform einbinden

```bash
export REDISCLOUD_ACCESS_KEY="<api-key>"
export REDISCLOUD_SECRET_KEY="<secret>"
```

```hcl
provider "rediscloud" {}   # liest beide Env-Vars automatisch
```

Zwei Umgebungen, Ein leerer Block — die Form der Schlichtheit, und
der Kommentar belohnt sie mit der Zusicherung: der Provider liest
beide selbst; wer die Blockform mit den ausdrücklichen Variablen
vorzieht (das Beispiel in [TERRAFORM.md](TERRAFORM.md) zeigt sie),
hat dieselbe Scheidung in der Formelsprache — die Zweiheit des
Paares ist unzerstörbar, sie kehrt in jeder Form wieder.

## 3. Hinweise

- Das Secret wird **nur bei Generierung** angezeigt — verloren = Keys
  löschen und neu generieren.
  Der erste ist die bekannte Lehre, oben schon berührt: das Wesen zeigt
  sich einmal; die Folge (nicht das Eine ersetzen, sondern das Ganze neu
  gebären) ist strenger als bei manchen Häusern, welche das Secret allein
  erneuern — hier ist das Paar das Atom, unteilbar bis in den Untergang;
  es hat dies eine Logik: Name und Wesen wurden zusammen geboren und
  sterben zusammen — die Ehe der Zeichen ohne Scheidung, nur mit Witwenschaft
  und Wiederverheiratung.

- API-Keys ≠ Console-Login: Sie haben **volle Account-Rechte** am API-Konto,
  inkl. Anlage kostenpflichtiger Pro-Subscriptions. Nur den nötigsten
  Leuten/CI-Systemen geben.
  Der zweite ist der Katalog der Rechte: voll, am Ganzen, bis hinauf zum
  kostenpflichtigen Pro — das Boten-Zeichen trägt die Schlüssel zum
  Schatze, nicht nur zur Schulbank ([FREE-TIER.md](FREE-TIER.md) hat die
  Vorschule beschrieben); die Empfehlung der Enge („nur den nötigsten")
  ist die einzige Verteidigung, welche das Haus selbst anbietet, denn ein
  Schneiden (wie Cloudflare es lehrt,
  [../cloudflare/README.md](../cloudflare/README.md)) gibt es hier nicht
  — das Paar ist ganz oder gar nicht; die Sammlung hat diese Form die
  ungeteilte genannt ([../netlify/README.md](../netlify/README.md)) und
  ihre Würde und Gefahr gezeigt: Redis verbindet sie mit der besonderen
  Pointe, daß das Ganze auch das Geld umfaßt — der Boten-Schlüssel
  öffnet auch die Kasse, und der Rat der Enge ist damit kein
  Sicherheits-Geschmack, sondern Haftungspflicht.

- Paid-Features (Pro-Subscriptions) sind mit denselben Keys erreichbar —
  in Free-Tier-Projekten IaC-Reviews auf `rediscloud_subscription` achten.
  Der dritte zieht die Konsequenz in die Formel-Welt: dieselbe
  Ressource, welche das Umsonst verwaltet, verwaltet das Bezahlte —
  die Grenze zwischen beiden ist kein Attribut, sondern ein
  Gegenstandsbereich, und die Aufmerksamkeit muß sie halten
  („IaC-Reviews": die Prüfung der Formeln auf die verbotene Gattung —
  das Review als Zollstelle zwischen dem umsonsten und dem teueren
  Lande); es ist die besondere Schwierigkeit der Häuser, welche beide
  Welten in Einem Werkzeuge tragen: die Formel weiß nicht, was sie
  kostet, und der Nutzer muß es wissen.

- Für den 30-MB-Free-Plan gilt weiterhin: Konsole-Anlage + `terraform import`
  (siehe TERRAFORM.md).
  Der vierte endlich verweist auf den Sonderfall des Hauses: die
  Vorschul-Anlage ist handgemacht (Konsole) und wird erst nachträglich
  begriffen (import) — dieselbe Grenze, welche
  [TERRAFORM.md](TERRAFORM.md) ausführlich behandelt und welche
  [../netlify/TERRAFORM.md](../netlify/TERRAFORM.md) an der Site
  vorführte: der Anfang entzieht sich der Formel; hier ist es die
  Schulbank selbst, welche handgemacht bleibt, und man könnte milde
  darüber lächeln, wenn nicht der Grund ernst wäre: die Formel für
  das Umsonste verlangt die Zahlungsweise (die erste Gotcha von
  [TERRAFORM.md](TERRAFORM.md)) — das Werkzeug der Gnade setzt die
  Institution des Geldes voraus, und wo das Geld fehlt, versagt die
  Formel; die Ironie ist vollkommen, und das Haus hat sie nicht
  beseitigt, sondern umgangen: der Import als Brücke über die
  Voraussetzung.

## Quellen

- API-Keys: <https://redis.io/docs/latest/operate/rc/api/how-to/create-keys/>
- Provider: <https://registry.terraform.io/providers/RedisLabs/rediscloud/latest>

## Vermittelte Verhältnisse

Die Ausweise vermitteln zwischen der Vorschule ([FREE-TIER.md](FREE-TIER.md))
und ihrem Begriffe ([TERRAFORM.md](TERRAFORM.md)); die Form des
Paares stellt sie neben Modal ([../modal/README.md](../modal/README.md)),
die Enge der Rechte neben Netlify ([../netlify/README.md](../netlify/README.md)
— das ungeteilte Zeichen), und die Zweiheit der Welten (Login gegen
Paar) neben die Gattungslehren der ganzen Sammlung; die
besondere Lehre dieses Kapitels aber ist die letzte: daß die
Voraussetzungen der Werkzeuge tiefer liegen als ihre Gaben — die
Formel der Gnade braucht die Form des Geldes, und wo der Nutzer
beides zugleich sein will (umsonst und formelhaft), da muß er den
Umweg über die Hand nehmen: Konsole und Import, Anschauung und
Aneignung — der kleine Weg, welchen die ganze Sammlung geht, hier in
zwei Schritten vollendet.
