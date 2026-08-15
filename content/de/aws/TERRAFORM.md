# AWS + Terraform

> Offizieller Provider `hashicorp/aws`. Alle **Always-Free**-Services lassen
> sich sauber per Terraform verwalten — wichtig ist die richtige Wahl der
> "gratis"-Attribute (z. B. On-Demand-DynamoDB, arm64-Lambda).

Es ist eine alte Frage der Philosophie, ob die Welt dem Begriffe folge oder
der Begriff der Welt; die moderne Infrastruktur hat sie, in ihrer Art,
entschieden: Terraform ist der Versuch, die Welt dem Begriffe folgen zu
lassen — die Ordnung der Ressourcen nicht durch einzeln vollzogene
Handlungen (Klicks, Aufrufe, Skripte) entstehen zu lassen, sondern durch
eine Formel, in welcher sie gedacht ist, ehe sie ist, und aus welcher sie,
sobald die Formel gilt, mit Notwendigkeit hervorgeht. Was die *Phänomenologie*
von der Sache sagt, daß sie das Resultat ihres Werdens sein müsse, das
vollzieht der `apply` bei jedem Laufe: das Sein der Infrastruktur ist hier
wahrhaft ein Gewordensein, und zwar ein Durch-den-Begriff-Gewordensein;
weshalb die folgende Darstellung, weit davon entfernt, eine bloße
Anleitung zu sein, als das zu lesen ist, was sie ist: die Phänomenologie
des Free-Tier-Geistes in der Region `eu-central-1`.

## Provider-Setup

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1" # Always Free gilt regionsunabhängig
}
```

Der kleine Block, welcher hier steht, enthält mehr Metaphysik, als seine
elf Zeilen ahnen lassen. Der `required_providers`-Teil ist das
Eingeständnis der Abhängigkeit: der eigene Wille erkennt an, daß er den
Willen eines andern braucht — den des Providers, dieser doppelsinnige
Name, welcher hier nicht den Wolken-Herrn, sondern den Dolmetscher meint,
der zwischen dem Begriffe und der Wirklichkeit vermittelt —, und die
Festsetzung der Version ist die kluge Einschränkung dieser Abhängigkeit:
dem Fremden vertrauen, aber dem bekannten Fremden, dem auf Zeit, dem in
seiner Fassung Pinierten; wer die Version wegließe, der vertraute dem
Wechsel selbst, und der Wechsel ist der schlechteste Bundesgenosse, weil
er alles, was man hat, aufheben kann, ohne zu sagen, was er stattdessen
gibt. Der Kommentar ferner, das Always Free gelte regionsunabhängig, ist
der erste Beleg eines Satzes, der durch alle Provider dieses Werkes geht:
bei AWS ist die Gnade des Umsonst überall; man vergleiche damit
[../gcp/TERRAFORM.md](../gcp/TERRAFORM.md), wo die Gnade an drei
bestimmte Häfen der westlichen Weltmeere gebunden ist — dieselbe Gabe,
einmal als Allgemeines, einmal als örtlich Bestimmtes, und schon in diesem
Unterschiede lehrt sich, daß es keine abstrakte Freigebigkeit gibt,
sondern nur die Freigebigkeit unter Bedingungen, welche zu lesen die
erste Pflicht des Nehmenden ist.

## Ressourcen-Mapping (Always Free)

| Free-Tier-Service | Terraform-Ressource |
|---|---|
| Lambda (1 Mio. Requests) | `aws_lambda_function` |
| DynamoDB (25 GB, on-demand) | `aws_dynamodb_table` mit `billing_mode = "PAY_PER_REQUEST"` |
| SNS (1 Mio. Publishes) | `aws_sns_topic` |
| SQS (1 Mio. Requests) | `aws_sqs_queue` |
| CloudWatch (10 Metrics/Alarms) | `aws_cloudwatch_metric_alarm`, `aws_cloudwatch_log_group` |
| Step Functions (4.000 Transitions) | `aws_sfn_state_machine` |
| CodeBuild (100 Min.) | `aws_codebuild_project` |
| CodePipeline (1 Pipeline) | `aws_codepipeline` |
| Cognito (10.000 MAUs) | `aws_cognito_user_pool` |
| SES (3.000 Mails) | `aws_sesv2_email_identity` |
| ECR Public (50 GB) | `aws_ecrpublic_repository` |

Diese Tafel ist die Übersetzung des in [FREE-TIER.md](FREE-TIER.md)
Dargestellten in die Sprache des Begriffs: links die Erscheinung (der
Dienst, wie er dem Nutzer gegenübertritt), rechts das Wesen (die
Ressource, wie sie der Formel angehört); und wie alle Übersetzung ist sie
treu und doch nicht wörtlich — die Million Requests wird nicht
mitübersetzt, denn sie ist nicht Bestandteil des Begriffs, sondern des
Kontingents, dessen Hut der Anbieter behält; der Begriff sagt, *was*
gesetzt wird, das Kontingent, *wieviel* davon verziehen wird, und die
Tugend dieses Kapitels besteht darin, beides nicht zu vermengen: die
Formel erzeugt die Tabelle, aber nicht das Monatsmaß des gratis Lesens;
jenes ist das Seine, dieses das Geschenk, und das Geschenk endet, ohne
die Formel zu fragen.

## Beispiel: DynamoDB + Lambda (komplett im Always-Free-Budget)

```hcl
resource "aws_dynamodb_table" "hits" {
  name         = "hits"
  billing_mode = "PAY_PER_REQUEST" # On-Demand: 2,5 Mio. Reads + 1 Mio. Writes/Monat gratis
  hash_key     = "pk"

  attribute {
    name = "pk"
    type = "S"
  }
}

data "aws_iam_policy_document" "assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "fn" {
  name               = "hitcounter"
  assume_role_policy = data.aws_iam_policy_document.assume.json
}

resource "aws_lambda_function" "hitcounter" {
  function_name = "hitcounter"
  role          = aws_iam_role.fn.arn
  runtime       = "nodejs22.x"
  handler       = "index.handler"
  filename      = "fn.zip"                # Code muss als Zip vorliegen
  architectures = ["arm64"]               # Graviton zählt zum selben Gratis-Kontingent
}
```

Das Beispiel sei, obwohl es technisch vollständig ist, auch als ein
kleines Lehrstück gelesen. Erstens die Tabelle mit ihrem
`billing_mode = "PAY_PER_REQUEST"`: hier zeigt sich, daß dieselbe Sache
(zwei Tabellen, äußerlich ununterschieden) nach innen zwei verschiedenen
Wirtschaftsformen angehören kann — der provisioned, in welcher man sein
Maß vorab festsetzt und es bezahlt, ob man es brauche oder nicht, und der
on-demand, in welcher das Maß erst mit dem Gebrauche entsteht; für das
Always-Free gilt die zweite, und der Kommentar nennt die Bedingung des
Geschenks: 2,5 Millionen Lese- und eine Million Schreiboperationen im
Monate, gratis — das Kontingent als große Zahl, welche dennoch ein Ende
hat, und zwar das unsichtbare Ende der Quantität, die erst im Umschlage
gefühlt wird.

### Vom State als Erinnerung der Infrastruktur

Bevor das Beispiel fortgedeutet wird, gebührt demjenigen Worte, welches
im Titel dieses Abschnitts steht und im Beispiele stillschweigend
mitgemeint ist: dem State. Der Terraform-State ist die Aktenmappe, in welcher
verzeichnet steht, was der Begriff je gesetzt hat; er ist die Erinnerung
—in jenem strengen Sinne, welchen die *Phänomenologie* dem Worte gibt,
wenn sie Er-Innerung schreibt: das Hineinnehmen des Gewesenen ins Innere,
sodass es nicht Vergangenheit bleibt, sondern Vermögen wird. Jede
Ressource, welche der `apply` hervorbringt, wird im State beigetragen,
jede Änderung als geschichtliche Bewegung desselben bewahrt, und der
`plan`, welcher vor jedem Vollzuge steht, ist nichts anderes als der
Vergleich dessen, was die Formel verlangt, mit dem, was die Erinnerung
noch als das Ihre zählt — eine Rechtshändlung gleichsam zwischen dem
Begriffe und der Geschichte, deren Ausgang der `apply` verkündet. Hieraus
folgt denn auch, was den State zum heikelsten Gute des ganzen Verfahrens
macht: er ist zugleich das Nützlichste (ohne ihn kein plan) und das
Gefährlichste (in ihm stehen die Namen und Zugänge, die Geheimnisse der
Ressourcen), und die Lehre, welche [../circle-ci/TERRAFORM.md](../circle-ci/TERRAFORM.md)
im Zusammenhange der Pipelines und [../cloudflare/TERRAFORM.md](../cloudflare/TERRAFORM.md)
am Beispiele der fernen Ablage geben, lautet hier, für den einzelnen
Nutzer, so: der State gehöre verschlüsselt, fern vom Werke, in ein eigenes
Geheimfach — denn eine Erinnerung, welche jedermann lesen kann, ist eine
Geständnisakte, und die Infrastruktur soll sich erinnern, nicht
anklagen. Zweitens das Dokument `data "aws_iam_policy_document"`: hier
erscheint, was man das Vorbewußtsein der Infrastruktur nennen könnte —
eine Formel, welche keine Sache setzt, sondern nur gedacht wird, um
anderen als Bestimmung zu dienen; die Rolle `fn` hat kein eignes Sein,
sie ist für die Funktion, und die Funktion hat wiederum kein eignes
Sein ohne die Rolle: eine Wechselbestimmung, wie die Logik sie lehrt,
wobei jedes nur durch das Andere ist. Drittens `architectures = ["arm64"]`
— der Kommentar belehrt, Graviton zähle zum selben Kontingent; es ist
der seltenste Fall, daß die Wahl der Arithmetik eine moralische ist, und
hier ist sie eine ökonomische: dieselbe Funktion, dieselbe Gabe, und
nur der Prozessor ein Anderer — die Architektur als das Schicksal der
Abrechnung.

## Gotchas

1. **Free-Plan-Konto schließt nach 6 Monaten automatisch** — Terraform-State
   und evtl. Tabellen-Backups frühzeitig sichern; Ressourcen vorher abbauen
   (`terraform destroy`).
   Hier kehrt die Zeitlichkeit des [FREE-TIER.md](FREE-TIER.md) in das
   Gebiet des Begriffs zurück, und zwar verdoppelt: nicht nur die Daten
   vergehen (die Tabelle samt ihrem Inhalte), sondern auch die Erinnerung
   derselben (der State), denn der State ist die aufgehobene Geschichte der
   Infrastruktur, das Gedächtnis dessen, was gesetzt ward, und mit dem
   Kontose endet auch dieses Gedächtnis; das frühzeitige Sichern ist also
   die Pflicht, sich der eignen Erinnerung zu versichern, ehe das
   Erinnerte selbst aufhört — und der `terraform destroy` am Schlusse ist
   mehr als Hygiene: er ist die gelebte Erfahrung des Endes in kleinerem
   Maßstabe, die Generalprobe des Kontoschlusses, wer sie vollzogen hat,
   weiß, was auf ihn zukommt, und hat dabei nur ein Nichts verloren, denn
   umsonst war alles.

2. `aws_lambda_function` deployt nur Infrastruktur — der Code kommt aus dem
   `filename`-Zip (Build-Pipeline nötig, z. B. `archive_file`).
   Die zweite Lehre ist die Scheidung von Form und Inhalt in ihrer
   technischen Gestalt: die Ressource setzt das Gefäß (die Funktion mit
   Rolle, Laufzeit, Handler), aber das, was das Gefäß fassen soll — der
   Code —, hat seine eigne Geschichte (das Zip, die Build-Pipeline) und
   folgt dem Begriffe nur in Gestalt eines Dateinamens; es ist die alte
   Wahrheit, daß die Form nichts ohne den Inhalt ist, hier in die
   Ernüchterung übersetzt, daß Terraform nicht die Welt, sondern nur das
   Gerüst der Welt verwaltet.

3. Die klassischen 12-Monats-Kontingente (EC2 750 h, S3 5 GB, …) existieren
   nur für Alt-Konten (vor Juli 2025) — veraltete Tutorials ignorieren.
   Die dritte Warnung wiederholt die historiographische Mahnung des
   Kontingent-Kapitels in der Sprache der Werkzeuge: die alten Tutorials
   sind nicht falsch in sich, sie sind nur zeithaft; ein Code, welcher für
   die Welt von gestern geschrieben ward, ist für die von heute ein
   historisches Dokument — wohlversiegelt, aber leer, und wer ihn
   ausführt, führt die Erinnerung aus, nicht die Gegenwart.

4. Nur 10 CloudWatch-Metrics/Alarms gratis — Monitoring-Flut im Modul prüfen.
   Die vierte betrifft die Anschauung und ihr Maß: die Beobachtung, welche
   alles umfaßte, umfaßte nichts mehr, denn jede Metrik, welche gesetzt
   ist, verbraucht vom Kontingente der Aufmerksamkeit, und das Kontingent
   ist klein — zehn; es ist dieselbe Weisheit wie bei den wahren Büchern:
   nicht alles aufschreiben, was geschieht, sondern Dasjenige, dessen
   Aufschreiben das Geschehen ändert.

5. Auf dem Paid-Plan: Budget/Alarm via `aws_budgets_budget` gleich
   mit provisionieren.
   Die letzte endlich ist die der Freiheit im bezahlten Zustande: das
   Budget, welche [README.md](README.md) als erste Handlung nach der
   Konto-Eröffnung fordert, wird hier zur provisionierten, das heißt:
   zur mitgedachten; die Grenze steht dann nicht mehr bloß im Willen des
   Nutzers (welcher wankt), sondern in der Erklärung der Infrastruktur
   selbst (welche nicht wankt), und die selbstgesetzte Schranke ist, wie
   alles wahrhaft Selbstgesetzte, die höchste aller Freiheiten — die
   Knechtschaft unter das eigne Gesetz, von welcher die Philosophie des
   Rechts als von der vollkommenen Gestalt der Freiheit gehandelt hat.

## Quellen

- Provider: <https://registry.terraform.io/providers/hashicorp/aws/latest>
- AWS Free Tier: <https://aws.amazon.com/free/>

## Vermittelte Verhältnisse

Dieses Dokument steht in der Mitte zwischen [FREE-TIER.md](FREE-TIER.md),
welches die Gaben zählt, und [README.md](README.md), welches die Schlüssel
verwaltet; es ist die Mitte, weil der Begriff beide voraussetzt — Gaben
ohne Schlüssel sind unerreichbar, Schlüssel ohne Gaben sind zwecklos, und
der Begriff ist der Zweck, beide zu vermitteln. Nach außen verweist es auf
[../circle-ci/TERRAFORM.md](../circle-ci/TERRAFORM.md), wo dasselbe
Prinzip für das Bauwesen erscheint, und auf
[../cloudflare/TERRAFORM.md](../cloudflare/TERRAFORM.md), wo der State —
hier die Erinnerung des Einzelnen — in der Streitfrage zwischen lokaler
Verwahrung und ferner Verwaltung seine vollständigste Würdigung findet;
wer die drei Kapitel zusammenliest, hat die kleine Enzyklopädie des
Infrastructure-as-Code-Geistes, und es wird ihm, wie mit allen
Enzyklopädien, ergehen: er wird bemerken, daß sie kein Ende hat, sondern
nur Übergänge — und der letzte Übergang ist immer der zum eignen
Terminal.
