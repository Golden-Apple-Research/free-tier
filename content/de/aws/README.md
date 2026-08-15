# AWS — Auth für Terraform

> Bevorzugt: **IAM Identity Center (SSO)** für lokale Arbeit, **OIDC/AssumeRole**
> für CI. Klassische Access Keys nur als Fallback.

Die Authentisierung ist, unter allen Kapiteln dieser Sammlung, das
philosophischste; denn hier handelt es sich um nichts Geringeres als um die
Frage, wie ein Wille sich einem andern zu erkennen gibt, ohne sich dabei
selbst aufzulösen. Der Schlüssel, das Token, das Credential — es sind die
Formen, in welchen das Selbstbewußtsein des Nutzers dem Dienste
gegenübertritt, und jede der drei Optionen, welche die folgende Darstellung
unterscheidet, ist eine eigene Stufe dieses Verhältnisses: die erste die
höchste und vermittelteste, die letzte die niedrigste und unmittelbarste,
und die Ordnung, in welcher sie hier aufgeführt sind, ist nicht die der
Bequemlichkeit, sondern die der Wahrheit — wie es sich für eine Darstellung
gehört, welche vom Besseren zum Geringeren absteigt, damit der Leser am
Ende weiß, was er wählt, wenn er das Bequemste wählt.

## 1. Credential erstellen

**Option A — IAM Identity Center / SSO (empfohlen, lokal):**

```bash
aws configure sso           # SSO-Session einrichten (Admin gibt Start-URL vor)
aws sso login --sso-session my-sso
```

Terraform/nichts weiter konfigurieren — der AWS-Provider liest die
SSO-Cached-Credentials automatisch.

Die erste Option ist die vermittelte Anerkennung im Vollsinne: der Nutzer
weist sich nicht selbst aus, sondern läßt sich von einer Instanz ausweisen,
welche ihm zugehört und doch über ihm steht — dem Identity Center, einem
Amt der eignen Organsiation, welches die Zeugnisse stellt, ohne daß der
Nutzer sie je in die Hand bekommt; was er hält, ist nicht der Schlüssel,
sondern die quittung über den Schlüssel, und die Cached-Credentials, welche
der Provider stillschweigend liest, sind gleichsam die Handschrift des
Amtes auf dem Zettel, den der Bot dem Tore vorzeigt. Es ist die Form der
Anerkennung, welche die *Phänomenologie* im Verhältnisse des Rechts
entwickelt: die Person, welche gilt, nicht weil sie sich geltend macht,
sondern weil eine allgemeine Instanz sie gelten läßt; und es ist keine
Anmaßung, hierin die vernünftigste Gestalt zu sehen, denn in ihr ist das
Geheimnis am wenigsten zerstreut — es wohnt an Einem Orte, bewacht, und
alle andern Orte sind ohne Geheimnis.

**Option B — IAM-User mit Access Keys (klassisch):**
AWS Console → IAM → Users → User wählen → *Security credentials* →
*Create access key* → Typ "Local code" o. Ä. → Access Key ID + Secret
**einmalig** sichtbar.

Die zweite Option ist die unmittelbare: der Schlüssel selbst, in zweien
Stücken, deren eines (die ID) gezeigt und deren anderes (das Secret)
verborgen werden muß, und zwar ein für allemal verborgen, denn es ist nur
einmalig sichtbar — eine Einrichtung, über welche man nicht genug
nachdenken kann: der Anbieter versagt sich selbst die Kenntnis des
Geheimnisses, er behält nur das Siegel, an welchem er es prüft; das
Geheimnis selbst existiert danach nur noch auf der Seite des Nutzers, und
zwar existiert es als verschwundene Schrift, welche der Nutzer, hat er sie
nicht auf der Stelle bewahrt, auf ewig verliert. Man hat dies die Tragik
des einmaligen Zeigens genannt; die Tragik ist es nicht, sondern die
Konsequenz, und wer sie vermeiden will, muß die dritte Option wählen.

**Option C — CI (GitHub Actions etc.):** keine statischen Keys —
`aws-actions/configure-aws-credentials` mit OIDC-Rolle
(`trust policy` auf das Repo).

Die dritte Option endlich ist die List der Vernunft in der Maschinerie
selbst: die CI weist sich nicht durch ein Haben (den Schlüssel), sondern
durch ein Wort aus — durch die Behauptung ihrer Identität, welche ein
Dritter (der OIDC-Aussteller) beglaubigt und welche der Empfangende (die
Trust Policy) gegen die Liste derer prüft, denen er traut; es wird also
nichts gegeben, was gegeben werden müßte, und die Maschine, welche
handelt, hat nie das Geheimnis getragen, mit welchem sie sich ausweist.
Man könnte sagen: statt des Schlüssels das Versprechen eines Schlüssels,
beglaubigt — und es ist die ganze Würde des neuzeitlichen gesellschaftlichen Verkehrs in
dieser Formel enthalten, nur daß der „Verkehr" hier aus Rechenzentren
besteht und die „Würde" aus JSON.

## 2. In Terraform einbinden

Provider-Block möglichst **ohne** Credentials; Standard-Env-Variablen nutzen:

```bash
export AWS_ACCESS_KEY_ID="AKIA…"
export AWS_SECRET_ACCESS_KEY="…"
export AWS_REGION="eu-central-1"
# SSO/CLI-Login: nichts exportieren
```

```hcl
provider "aws" {
  region = "eu-central-1"
}
```

Die Forderung, den Provider-Block ohne Credentials zu halten, ist mehr als
ein Stilgebot; sie ist die Konsequenz dessen, was oben über das Verhältnis
von Haben und Gelten gesagt ward. Der Code, welcher die Region benennt,
ist öffentlich — er lebt im Repositorium, wird gelesen, geforkt, kopiert —,
und was in ihm stände, wäre allem diesem Preisgegeben; die Env-Variable
hingegen ist die unsichtbare Umgebung, welche auf jedem Rechner neu
gesetzt werden muß und im Quelltexte nirgends erscheint. Die Teilung von
öffentlicher Formel und privatem Werte ist also keine Äußerlichkeit des
Tools, sondern die Technische Wiederholung der alten Scheidung des
Allgemeinen (das bekannt sein darf) vom Besondern (das ein Geheimnis sein
muß, solange es eines ist); wer beide vermischt — Credentials im
Provider-Block —, der hat das Besondere dem Allgemeinen einverleibt und
kann nicht einmal mehr sagen, er sei beraubt worden, denn er hat den Raub
selbst veröffentlicht.

## 3. Hinweise

- Access Keys im Provider-Block = Landkarte für geleakte Secrets — immer
  Env-Vars/SSO nutzen, Secrets in `.tfvars` nie committen.
  Das Bild von der Landkarte sei festgehalten, denn es ist besser als sein
  Ruf: die Karte ist nicht der Schatz, aber sie zeigt, wo er vergraben
  liegt, und wer die Karte hat, spart das Suchen; ein geleakter Provider-
  Block mit Credentials ist die Karte an der Kirchentür, und es bedarf
  nur Eines, welcher sie liest.
- Root-Account-Credentials gehören nie in Terraform (IAM-User mit
  least privilege, für Free-Tier-Tests reicht `PowerUserAccess` o. geringer).
  Das Verbot des Wurzel-Accounts ist das Verbot der absoluten Macht im
  Kleinen: der Root ist der Monarch des Kontos, unbeschränkt in allem,
  unverantwortlich gegen nichts, und ein solcher gehört nicht in die Hand
  dessen, was nur arbeiten soll; die Arbeit aber, um zu arbeiten, braucht
  nicht den Monarchen, sondern das Amt mit der engsten Zuständigkeit — das
  least privilege, welches die Rechte der Werkzeuge nach dem Maße ihrer
  Aufgaben zumißt, ist die bürgerliche Verfassung im Reiche der Skripte,
  und wer sie verachtet, der verwandelt jedes Werkzeug in einen möglichen
  Usurpator.
- Free-Plan-Konten schließen nach 6 Monaten — Keys/State vor Ablauf sichern.
  Der letzte Hinweis knüpft an das Ende des [FREE-TIER.md](FREE-TIER.md)
  an: was an Fristen dort gelehrt ward, kehrt hier als Pflicht des
  Sicherns wieder; der State — jene Erinnerung der Infrastruktur, von
  welcher [TERRAFORM.md](TERRAFORM.md) im Zusammenhang handelt — und die
  Keys sind das Bleibende eines Kontos, welches selbst nicht bleibt, und
  die Weisheit besteht darin, das Bleibende vom Vergänglichen zu scheiden,
  ehe das Vergängliche vergeht.

## Quellen

- Provider-Auth: <https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration>
- IAM Access Keys: <https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html>

Wer diesen drei Quellen folgt, folgt dem Worte des Anbieters selbst; die
Darstellung dieser Seite ist die Auslegung jenes Wortes, und wie alle
Auslegung ist sie dem Worte nachgeordnet — aber sie ist es nur, weil sie
das Wort verstanden hat.

## Vermittelte Verhältnisse

Die Authentisierung endet nicht an der Schwelle dieses Dokuments;
[FREE-TIER.md](FREE-TIER.md) lehrt, wozu die Schlüssel da sind,
[TERRAFORM.md](TERRAFORM.md) wozu sie im Begriffe der Infrastruktur
taugen; das allgemeine Verzeichnis dieser Verhältnisse im Ganzen der
Sammlung aber ist [../helpers.md](../helpers.md), welches dieselbe
Dreiteilung — Anweisung, Werkzeug, Anerkennung — auf der Ebene der Agenten
wiederholt, und wer beide liest, wird bemerken, daß die Formen sich
entsprechen: was hier SSO, Key und Rolle heißen, heißt dort Skill, Server
und OAuth, und die Wahrheit dieser Entsprechung ist, daß es überall
dieselbe Frage ist — wie der Wille sich ausweise, ohne sich zu verlieren.
