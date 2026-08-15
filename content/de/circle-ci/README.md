# CircleCI — Auth für Terraform

> Bevorzugt: **Personal API Token** aus den User-Settings. Achtung: Der
> offizielle Provider `CircleCI-Public/circleci` hat **keine Umgebungsvariable**
> — der Token wird per Variable/TF_VAR in den Provider-Block gereicht.

Die Vorbemerkung enthält eine Kuriosität, welche über den Einzelfall
hinausweist: der offizielle Provider kennt keine Umgebungsvariable — die
üblichste, bequemste und überall sonst ([../aws/README.md](../aws/README.md),
[../azure/README.md](../azure/README.md)) geübte Form, das Geheimnis dem
Werke fernzuhalten, ist hier nicht gegeben, und der Token muß durch die
Vordertür des Provider-Blocks hereingereicht werden. Es ist die
Ausnahmesituation, an der die Regel sich bewährt: wenn die bequeme Form
fehlt, muß die saubere Form herhalten, und es wird sich zeigen, daß die
saubere Form — die deklarative Variable mit `TF_VAR` — dasselbe leistet
und mehr Klarheit gibt; der Mangel als Anlaß der Einsicht, eine
Erfahrung, welche die Geschichte der Werkzeuge oft macht und die hier,
im kleinen, einmal mehr bestätigt wird.

## 1. Token erstellen

CircleCI → User avatar → **User Settings → Personal API Tokens** →
*Create New Token* → Name (z. B. `terraform`) → Token einmalig kopieren.

Zusätzlich benötigt: die **Organization-ID** (UUID) — Org →
**Organization Settings → Overview → Organization ID**.

Das Schöpfungsverfahren ist das bekannte: der persönliche Token, einmalig
gezeigt, fortan zu bewahren — die Monade des Ausweises, an welcher alles
Hängen hat (siehe die allgemeine Lehre in [../helpers.md](../helpers.md),
wie von der Einmaligkeit des Zeigens). Das Zusätzliche aber, die
Organization-ID, verdient ihr Wort: denn sie ist nicht Geheimnis, sondern
Name — die UUID, welche die Organisation bezeichnet, ohne sie zu
verschließen; der Nutzer muß also zweierlei mitgeben, um sich zu
beglaubigen: den Schlüssel (den Token) und die Hausnummer (die ID), und
die Zweiheit hat ihren guten Grund, denn der Token sagt nur, wer kommt,
nicht wohin; die ID sagt, wohin, aber nicht, wer kommt; erst beide
zusammen sind die volle Adresse der Anerkennung — Subjekt und Objekt
des Zugriffs, hier in zwei Daten zerlegt, wie sie in den höhern Formen
(föderierten) aus Einem Zeugnis hervorgehen.

## 2. In Terraform einbinden

Da es keine `CIRCLECI_*`-Env-Var gibt, sauber über eine deklarative Variable:

```hcl
variable "circleci_api_key" {
  type      = string
  sensitive = true
}

provider "circleci" {
  host = "https://circleci.com/api/v2"
  key  = var.circleci_api_key
}
```

```bash
export TF_VAR_circleci_api_key="…"   # so bleibt der Wert aus dem Code raus
```

Die Zeile des Kommentars ist die ganze Moral: „so bleibt der Wert aus
dem Code raus". Man bedenke die Vermittlung, welche hier statthat: der
Wert wandert aus dem offenen Texte (dem Code) in die unsichtbare
Umgebung (die Shell), und der Code behält nur die Form — den Namen der
Variablen —, nicht den Inhalt; das System der TF_VAR ist also die
Scheidung von Form und Inhalt, am Werkzeuge selbst vollzogen, und es
wiederholt in Kleinem die große Scheidung des Öffentlichen und Privaten,
von welcher [../aws/README.md](../aws/README.md) im Zusammenhange
gehandelt hat. Dazu die zwei Attribute: `type = string` (die Form ist
vorgesagt, der Inhalt nicht) und `sensitive = true` (der Wert wird in
Plänen und Ausgaben verschwiegen) — die Maschine verhält sich zum
Geheimnisse, wie es sich gehört: sie kennt es, und sie zeigt es nicht.

## 3. Hinweise

- Personal Tokens haben die **Rechte des Users** in allen Orgs, denen er
  angehört — für Automationen einen dedizierten Bot-User + dessen Token
  nutzen.
  Der erste Hinweis ist die klassische Warnung der Persönlichkeit: wer
  das eigne Ich als Ausweis der Maschine gibt, der gibt mehr, als er
  wollte — die Rechte des Users überall, nicht am bestimmten Orte; die
  Empfehlung des Bot-Users ist die Konsequenz: ein zweites, ärmeres Ich
  schaffen, welches nur die Rechte der Automation hat, damit die
  Automation nicht die Rechte der Person erbt — dieselbe Lehre vom
  engen Amte (least privilege), welche [../aws/README.md](../aws/README.md)
  am Root-Accounte entwickelte, hier am eignen Bilde wiederholt; der
  Bot als das asketische Selbst der Maschine, geschaffen, um weniger zu
  können, und eben darin brauchbar.

- Der Community-Fork `mrolla/circleci` liest `CIRCLECI_TOKEN` automatisch —
  aber offiziell ist `CircleCI-Public/circleci` (siehe TERRAFORM.md); nicht
  mischen.
  Der zweite Hinweis ist ein kleiner Bürgerkrieg der Werkzeuge: der
  inoffizielle Fork ist bequemer (er liest die Env-Variable, welche der
  offizielle verschmäht), der offizielle ist der, welcher gilt; die
  Empfehlung, nicht zu mischen, ist die Friedensformel — jede der beiden
  Ordnungen ist für sich brauchbar, die Vermischung beider aber erzeugt
  den Zustand, in welchem niemand weiß, welcher Wille eigentlich wirkt,
  und das ist, wie [../azure/README.md](../azure/README.md) bei der
  Vermengung von CLI-Login und ARM-Variablen lehrte, der schlechteste
  Zustand aller Anerkennungsverhältnisse: die Ungewißheit über das
  handelnde Ich.

- `context_environment_variable`-Werte aus der Konfiguration landen im
  State (Standard-Terraform-Verhalten) — verschlüsseltes Backend nutzen;
  Rotation per `terraform apply` mit neuem Wert.
  Der dritte Hinweis koppelt die Ausweisordnung an die Erinnerungsordnung:
  die Werte, welche der Nutzer in den Contexts verschließt, erscheinen
  wieder im State, denn der State ist die Erinnerung alles Gesetzen, und
  die Erinnerung verschweigt nichts von selbst; sie muß zum Schweigen
  gebracht werden — das verschlüsselte Backend, von welchem
  [../aws/TERRAFORM.md](../aws/TERRAFORM.md) im Abschnitte vom State
  gehandelt hat —, und die Rotation ist die zeitliche Ergänzung: das
  Geheimnis, welches getragen wird, muß gewechselt werden können, ohne
  daß die Ordnung sich ändert; der `apply` mit dem neuen Werte ist der
  Wechsel des Schlosses ohne den Wechsel des Hauses.

- Context-Env-Var-Werte sind über die API **write-only** — der Provider
  speichert nur einen Hash im State (Änderungserkennung funktioniert
  trotzdem). Nur nach `terraform import` zeigt der erste Plan einen Diff
  `null → value`; das Apply schreibt denselben Wert per Upsert zurück.
  Der vierte endlich ist der philosophischste Hinweis dieser Seite und
  vielleicht der ganzen Sammlung: die Werte sind der API nach nur
  schreibbar — lesen kann sie niemand, auch der Eigentümer nicht —, und
  der Provider behilft sich, indem er statt des Wertes dessen Abdruck
  (Hash) bewahrt; der State enthält also nicht das Geheimnis, sondern
  sein Siegel, und die Änderungserkennung vergleicht die Siegel, nicht
  die Sachen. Man hat hier — in unschuldiger Technik — die vollständige
  Lehre vom Zeichen an der Stelle der Sache: der Abdruck, welcher die
  Sache vertritt, ohne sie zu enthalten; die Urkunde, welche beglaubigt,
  ohne zu verraten; ja, wenn man will, das ganze Verhältnis von Wesen
  und Erscheinung in einem JSON-Felde, denn der Hash ist die Erscheinung
  des Wertes für alle, welche den Wert selbst nicht sehen dürfen — und
  der kleine Schnörkel am Schlusse, daß nach dem Importe der erste Plan
  einen Scheinunterschied zeigt (`null → value`), welchen das Apply
  durch Zurückschreiben des Selben tilgt, ist die Komödie der
  Anerkennung im Kleinen: die Maschine muß einmal laut sagen, was sie
  längst still weiß, und danach schweigen die Pläne wieder — das
  feierliche Neubenennen des Alten, die Bestätigungszeremonie des
  Begriffs, hier als `upsert` implementiert.

## Quellen

- Provider: <https://registry.terraform.io/providers/CircleCI-Public/circleci/latest/docs>
- Personal API Tokens: <https://circleci.com/docs/managing-api-tokens/>

## Vermittelte Verhältnisse

Die Ausweise dieses Fürstentums vermitteln zwischen den Gaben
([FREE-TIER.md](FREE-TIER.md)) und dem Begriffe ([TERRAFORM.md](TERRAFORM.md))
seines Bauwesens; die allgemeine Lehre von Token, Hash und State gehört
aber in den größern Zusammenhang, welchen [../helpers.md](../helpers.md)
(Anerkennung der Agenten) und [../aws/TERRAFORM.md](../aws/TERRAFORM.md)
(der State als Erinnerung) tragen, und wer diesen Hinweisen nachgeht,
der findet denselben Zug in allen: das Geheimnis soll wirken, ohne
vorhanden zu sein — die tätige Abwesenheit, welche das Höchste ist,
was die Sicherheitstechnik erreicht hat und das Rätsel, welches sie
der Philosophie hinterläßt.
