# Modal — Auth für Terraform (bzw. SDK)

> Bevorzugt: **Token-Paar (Token ID + Secret)** — für den Community-Provider
> und das Python-SDK identisch via `MODAL_TOKEN_ID` + `MODAL_TOKEN_SECRET`
> oder `~/.modal.toml`.

Unter allen Ausweisen dieser Sammlung ist der Modalische der
paarige: nicht Ein Schlüssel, sondern Zwei, und zwar so, daß jeder
einzelne nichts ist — die ID (mit `ak-` beginnend) nennt nur den
Namen, das Secret (mit `as-` beginnend) birgt nur das Wesen, und erst
das Beisammensein beider ist die Macht. Man hat diese Form schon bei
Redis ([../redis/README.md](../redis/README.md) wird sie zeigen) und
kennt sie aus aller Kryptographie; ihre Bedeutung ist aber eine
logische: das Paar ist die äußere Darstellung des Satzes, daß
Anerkennung immer ein Verhältnis sei — ein Nennen und ein Bekräftigen,
ein Zeigen und ein Beweisen —, und daß kein Element des Verhältnisses
für sich dieselbe Funktion hat wie beide zusammen. Es ist die
zergliederte Zweiheit an der Stelle, wo andre Häuser die unzergliederte
Einfachheit setzen (der eine Token), und man wird sehen, daß die
Zergliederung die höhere Form ist: sie erlaubt das Nennen ohne das
Beweisen (die ID kann in Protokollen stehen), während das Beweisen
ohne das Nennen wertlos bleibt (das Secret allein kennt seinen
Herrn nicht).

## 1. Token erstellen

**Option A — CLI (empfohlen):**

```bash
pip install modal
modal token new    # öffnet Browser-Login und schreibt Token nach ~/.modal.toml
```

**Option B — Dashboard:**
<https://modal.com/settings> → **API Tokens** → *Workspace Secret* oder
*User Token* erstellen → `ak-…` (ID) + `as-…` (Secret) einmalig kopieren.

Die erste Option ist die bequeme Ganzheit: der Browser-Login vollzieht
die Anerkennung (Person am Tore — die Stufe, welche
[../gcp/README.md](../gcp/README.md) die personale nannte), und die
Konfigurationsdatei (`~/.modal.toml`) empfängt das Paar heimlich, ohne
daß es durch die Hände des Nutzers ginge — die Maschine schreibt dem
Nutzer sein eignes Geheimnis nieder; es ist dasselbe Arrangement,
welches die Cloud-Shell ([../gcp/FREE-TIER.md](../gcp/FREE-TIER.md))
mit ihrem wöchentlichen Gedächtnis macht, nur ohne das Vergessen. Die
zweite Option hingegen ist die ausdrückliche Wahl: das Dashboard
unterscheidet nämlich zwischen zwei Gattungen des Paares — dem
Workspace-Secret (dem Amte) und dem User-Token (der Person) —, und
die Wahl zwischen ihnen ist die erste staatsrechtliche Entscheidung
des Nutzers: will er bevollmächtigen (dann das Workspace-Secret, der
dritte Hinweis unten empfiehlt es für CI) oder nur sich selbst
ausweisen (dann das User-Token, für die eigene Maschine)? Die
Gattungslehre der Token — Person und Amt, wie sie
[../aws/README.md](../aws/README.md) und [../azure/README.md](../azure/README.md)
entwickelt haben — ist hier in die Ausstellungsform selbst gelegt.

## 2. In Terraform einbinden

```bash
export MODAL_TOKEN_ID="ak-…"
export MODAL_TOKEN_SECRET="as-…"   # hat Vorrang vor ~/.modal.toml
```

```hcl
provider "modal" {}   # Community-Provider liest beide Env-Vars
```

Für das idiomatische IaC (Python-SDK) gelten dieselben Env-Vars:

```bash
modal deploy app.py   # authentifiziert sich mit demselben Token-Paar
```

Die Einbindung ist doppelt belehrend. Erstens der Vorrang der
Umgebung vor der Datei (das Secret „hat Vorrang vor ~/.modal.toml"):
die flüchtige Form (Env-Var) besiegt die bleibende (Datei) — die
Sicherheit des Vergänglichen gegen die Bequemlichkeit des Bleibenden,
ein Verhältnis, dessen volle Lehre [../helpers.md](../helpers.md) an
der Zweiheit remote/lokal entwickelt hat. Zweitens die
Zweiseitigkeit derselben Zeichen für beide Welten (Terraform wie
Python-SDK): das Paar gilt, ob der Nutzer es dem Provider oder dem
SDK gibt — die Anerkennung ist dieselbe, welches Werkzeug sie auch
vollzieht; es ist die konsequenteste Form der Interoperabilität, und
sie kommt nicht von ungefähr: wo das Werkzeug selbst fehlt (Modal
hat ja keinen offiziellen Terraform-Provider, siehe
[TERRAFORM.md](TERRAFORM.md)), da muß der Ausweis das Bleibende sein,
welches über die Wechsel der Werkzeuge hinausgeht — das Zeichen als
das Kontinuierliche gegenüber dem Diskontinuierlichen der Formen.

## 3. Hinweise

- **Workspace-Secrets** (`Secret-…`) gelten org-weit und eignen sich für
  CI; **User-Tokens** nur für persönliche Maschinen.
  Der erste ist die Gattungslehre im Kurzsatze: das Amt, welches überall
  gilt, und die Person, welche nur für das Eigene steht; die Empfehlung
  ist die bekannte Arbeitsteilung (Amt für die Maschinen, Person für
  die Person — siehe die Bot-User-Lehre von
  [../circle-ci/README.md](../circle-ci/README.md)), und es ist
  bezeichnend, daß Modal die Unterscheidung in die Namen der Zeichen
  selbst gelegt hat: `Secret-…` gegen den andern Anfang — die
  Buchstabenkunde ([../grafana/README.md](../grafana/README.md):
  `glc_` gegen `glca_`) hat hier ihr drittes Beispiel.

- Seit Modal 0.56 gibt es das **Paar** `MODAL_TOKEN_ID`/`MODAL_TOKEN_SECRET` —
  alte Guides mit einer einzelnen `MODAL_TOKEN`-Variable sind veraltet und
  schlagen stillschweigend fehl.
  Der zweite Hinweis ist der geschichtlichste und der lehrreichste: die
  Version 0.56 ist der Einschnitt, an welchem aus dem Einen Token das
  Paar wurde — die Zergliederung als Fortschritt —, und die alten
  Anleitungen, welche die Eine Variable lehren, schlagen fehl; nicht
  laut, sondern still („schlagen stillschweigend fehl"), das ist das
  Furchtbare daran. Der laute Fehler belehrt, der stille verwirrt: die
  Maschine nimmt den alten Namen, findet nichts darin und schweigt —
  das Werkzeug versagt, ohne zu klagen, und der Nutzer sucht den
  Fehler bei sich. Es ist die dunkelste Form des Bekannten, welches
  nicht erkannt ist, und die Sammlung hat sie in vielen Gestalten
  getroffen ([FREE-TIER.md](FREE-TIER.md) über die veralteten
  AWS-Tutorials; [../cloudflare/TERRAFORM.md](../cloudflare/TERRAFORM.md)
  über die v4-Namen): überall die Lehre vom Wandel, welcher die alten
  Wege still legt, und nirgends dringlicher als hier, wo das Stille
  selbst zur Falle wird.

- Token in `~/.modal.toml` nicht committen (liegt außerhalb des Repos,
  aber .dotfiles-Setups prüfen).
  Der dritte ist die Sorge um die Bleibenden: die Datei liegt außerhalb
  des Repositoriums (gut!), aber die Ordnung der eigenen Umgebung
  (.dotfiles — die Mode, sein Haus im Repositorium zu führen) kann sie
  einschleppen; die Prüfung ist also eine Prüfung der eignen
  Ordnungsliebe gegen die eigne Sicherheit — der Fall, in welchem
  eine Tugend die andere bestiehlt, und die Aufklärung darüber
  verdiente stünde sie nicht hier — in jedem Dotfiles-Leitfaden zu
  stehen.

- Der Community-Provider verwaltet nur Account-Objekte (Secrets, Volumes,
  Queues, Dicts) — Apps/Functions laufen über das SDK (siehe TERRAFORM.md).
  Der vierte endlich setzt die Grenze, welche [TERRAFORM.md](TERRAFORM.md)
  im ganzen entwickelt: die Formeln regieren das Verzeichnis (was da
  ist), nicht das Werk (was läuft); die Aufgabenteilung zwischen
  Terraform und Python ist also keine Not, sondern Ordnung — dieselbe
  Scheidung von Verfassung und Gesetzen, welche
  [../circle-ci/TERRAFORM.md](../circle-ci/TERRAFORM.md) lehrte, hier
  mit der Besonderheit, daß die Gesetze in der Sprache des Hauses
  selbst geschrieben sind.

## Quellen

- Token-CLI: <https://modal.com/docs/cli/latest/token>
- Config/Auth-Referenz: <https://modal.com/docs/sdk/py/latest/config>

## Vermittelte Verhältnisse

Die Ausweise dieses Hauses vermitteln zwischen den Gaben
([FREE-TIER.md](FREE-TIER.md)) und dem Begriffe ([TERRAFORM.md](TERRAFORM.md));
ihre Eigenart — das Paar, die Gattungen, der Vorrang der Umgebung —
stellt sie in die große Reihe der Ausweis-Lehren dieser Sammlung, von
der Person ([../gcp/README.md](../gcp/README.md)) über das Amt
([../azure/README.md](../azure/README.md)) bis zum geschnittenen
Rechte ([../cloudflare/README.md](../cloudflare/README.md)); und wer
am Ende der Reihe noch [../helpers.md](../helpers.md) liest, der
findet dort die ganze Lehre noch einmal auf der Stufe der Agenten —
denn auch sie weisen sich aus, auch sie haben ihre Paare (Key und
Secret), und auch für sie gilt, was hier zu lernen war: daß das
Zeichen nur im Verhältnisse lebt und das Verhältnis nur im
Gebrauche.
