# CircleCI + Terraform

> Offizieller Provider `CircleCI-Public/circleci` (noch 0.x). Verwaltet
> Projekte, Contexts (+ Env-Vars), Trigger, Webhooks und Self-Hosted-Runner —
> also Organisation, nicht Pipelines selbst (`config.yml` bleibt im Repo).

Die Vorbemerkung zieht die Grenze, an welcher alle Vergleiche der
Werkzeuge scheitern oder gelingen: Terraform verwaltet hier die
Organisation — das Gefüge, die Namen, die Rechte, die Verbindungen —,
nicht aber die Pipelines, deren Inhalt (`config.yml`) im Repositorium
bleibt. Es ist die Scheidung von Verfassung und Gesetzgebung, um einen
staatsrechtlichen Vergleich zu wagen: die Verfassung (wer besteht, wer
darf, womit verbunden) kann hier gesetzt werden; die Gesetze des Bauens
(was wann und wie gebaut wird) bleiben dem Orte überlassen, an welchem
der Bau beschlossen wird — dem Repositorium. Wer diese Grenze nicht
kennt, wird vom Provider mehr erwarten, als er verspricht, und vom
Repositorium weniger, als es vermag; wer sie kennt, hat die Arbeitsteilung
des modernen Betreibens in ihrer reinsten Gestalt: die Struktur im
Begriffe, das Geschehen im Texte.

## Provider-Setup

```hcl
terraform {
  required_providers {
    circleci = {
      source  = "CircleCI-Public/circleci"
      version = "~> 0.4"
    }
  }
}

provider "circleci" {
  host = "https://circleci.com/api/v2"
  key  = var.circleci_api_key # Personal API Token (CircleCI → User Settings)
}
```

Der Block gleicht dem Muster der Sammlung; das Eigene ist die Vordertür
des Schlüssels (siehe [README.md](README.md): keine Env-Variable, also
die deklarative Variable), und der Kommentar am Schlüssel, welcher an
die User-Settings erinnert — die höfliche Fußnote des Providers, der
den Nutzer an den Ursprungsort seiner selbstgemachten Ausweise zurück-
verweist, wie es sich für ein Werkzeug gehört, welches weiß, daß die
Ausweise älter sind als die Formeln.

## Ressourcen-Mapping

| Objekt | Terraform-Ressource |
|---|---|
| Projekt | `circleci_project` |
| Context | `circleci_context` (+ `circleci_context_restriction`) |
| Context-Env-Var | `circleci_context_environment_variable` |
| Projekt-Env-Var | `circleci_project_environment_variable` |
| Pipeline-Trigger | `circleci_trigger` (GitHub App/Scheduled) |
| Webhook | `circleci_webhook` |
| Self-Hosted Runner | `circleci_runner_resource_class`, `circleci_runner_token` |

Die Tafel ist ein Verzeichnis der Organisationsbegriffe: das Projekt
(das Vorhaben), der Context (die Umgebung der Geheimnisse), die Env-Var
(das Geheimnis in der Umgebung), der Trigger (der Anlaß), der Webhook
(die Rückmeldung) und der Runner (die eigne Maschine); wer will, kann
in dieser Reihe die Grundbegriffe jeder Organisation wiederfinden —
Werk, Umstand, Mittel, Anlaß, Bericht, Kraft —, und es ist kein Zufall,
daß sie sich in einer Tafel ordnen lassen; die Organisationslehre ist
überall dieselbe, ob sie eine Werkstatt, ein Reich oder eine Pipeline
verwaltet.

## Beispiel: Projekt + Context + Secret

```hcl
variable "org_id" { type = string } # Org-ID: CircleCI → Org Settings → Overview

resource "circleci_project" "app" {
  name            = "github/org/app" # VCS-Project-Slug/-Name (siehe Doku)
  organization_id = var.org_id
}

resource "circleci_context" "deploy" {
  organization_id = var.org_id
  name            = "deploy"
}

resource "circleci_context_environment_variable" "tf_token" {
  context_id = circleci_context.deploy.id
  name       = "TERRAFORM_TOKEN"
  value      = var.tf_token
}
```

Das Beispiel zeigt die Dreiheit, von welcher die Tafel spricht, in
ihrem Zusammenhange: das Projekt (das Vorhaben, benannt nach dem
Repositorium, aus welchem es lebt — der Name als die Adresse des
Werdens), der Context (die Umgebung, hier „deploy" getauft, das ist die
Umgebung des Auslieferns) und die Env-Var (das Geheimnis des Vorhabens,
im Schoße der Umgebung geborgen). Die Verweis-Kette `context_id =
circleci_context.deploy.id` ist die gesetzte Beziehung: das Geheimnis
gehört zur Umgebung, die Umgebung gehört zur Organisation — und die
Organisation (die `org_id` der Variablen) ist das Bleibende, in welchem
alle Beziehungen ruhen; man hat das ganze Verhältnis von Allgemeinem,
Besonderem und Einzelnem in sieben Zeilen: die Organisation als das
Allgemeine, der Context als das Besondere, die Variable als das
Einzelne, und der Ausweis am Eingange (die `variable "org_id"`) als die
Bedingung, unter welcher das Ganze gilt.

## Gotchas

1. Die `organization_id` ist eine **UUID** (Org Settings), nicht der Org-Slug.
   Die erste Lehre ist die vom doppelten Namen: die Organisation hat
   einen Slug (den Namen, welchen die Menschen lesen) und eine UUID
   (den Namen, welchen die Maschinen lesen), und der Provider will den
   zweiten; wer den ersten gibt, gibt einen Namen, aber nicht den
   rechten — die Diskrepanz der zwei Namenswelten, welche überall in
   der Technik wiederkehrt, wo Lesbarkeit und Eindeutigkeit einander
   die Wage halten (der Mensch liest das Eine, die Maschine braucht das
   Andere), und es ist dieselbe Struktur, welche [README.md](README.md)
   als die Zweiheit von Schlüssel und Hausnummer entwickelte: hier ist
   die Hausnummer einmalig, dort der Slug; die Wahrheit des Zugriffs
   braucht beide Welten, und die Formel spricht nur die maschinenlesbare.

2. Env-Var-Werte stehen im State — State verschlüsseln; Rotation über
   `terraform apply` mit neuer Variable statt Wert-Edit im Code.
   Die zweite ist die bekannte Koppelung von Geheimnis und Erinnerung
   ([README.md](README.md), dritter Hinweis; [../aws/TERRAFORM.md](../aws/TERRAFORM.md),
   Abschnitt vom State): was gesetzt ist, wird erinnert, und die
   Erinnerung muß verschwiegen werden — das verschlüsselte Backend —,
   während die Rotation die zeitliche Seite derselben Sorge besorgt;
   die Empfehlung, den Wechsel über die Variable zu vollziehen statt
   über das Wert-Edit im Code, ist dabei mehr als Stil: der Code bleibt
   sauber (er enthält nie den Wert), und der Wechsel ist ein Ereignis
   der Umgebung, nicht des Textes — das Geheimnis hat dann eine
   Geschichte außerhalb seines Gesetzes, und das ist der einzig
   wünschenswerte Zustand.

3. Provider ist 0.x: Schema kann sich ändern — Version pinnen, Upgrades
   mit `terraform plan` reviewen.
   Die dritte ist die Lehre von der Jugend der Werkzeuge: vor der Eins
   ist alles versprechbar und nichts verpflichtend — das Schema darf
   sich ändern, das ist der Sinn der Null —, und der Nutzer hat die
   Klugheit zu üben, welche [../aws/TERRAFORM.md](../aws/TERRAFORM.md)
   am Versions-Pinne entwickelte, hier in verschärftem Maße: das Pinne
   ist die Bedingung des Friedens mit einem jungen Provider, und das
   Review des Upgrades (`terraform plan`) ist der Vergleich, welcher
   dem Frieden gilt — man sieht die künftigen Änderungen, ehe man sie
   hat, und eben dieses Vorhersehen ist der ganze Vorteil des Begriffs
   vor dem Handwerke.

4. TF verwaltet keine `config.yml` — Credit-Verbrauch (30 k/Monat Free)
   bleibt Verantwortung der Pipeline-Konfiguration im Repo.
   Die vierte wiederholt die Grenze der Vorbemerkung in der Sprache der
   Verantwortung: die Verfassung kann gesetzt werden, das Geschehen
   nicht; der Credit-Verbrauch — das Schicksal der 30.000
   ([FREE-TIER.md](FREE-TIER.md)) — entscheidet sich in der `config.yml`,
   das ist: im Texte, welchen der Provider verschont; die Sorge ist
   also geteilt nach der Arbeitsteilung, und wer die eine Hälfte
   verwaltet und die andre vergißt, der verwaltet die Hälfte und
   verliert das Ganze — das Wahre ist das Ganze, auch in der Sorge.

5. `circleci_trigger` mit `scheduled`-Block = Cron-Pipelines — Credit-Burn
   durch häufige Schedules mitbedenken.
   Die letzte endlich ist die Lehre von der Uhr: der geplante Anlaß
   (der Trigger mit dem `scheduled`-Blocke) ist die Zeit als Ursache —
   das Werk geschieht nicht, weil gebaut oder gefordert wird, sondern
   weil die Uhr es sagt —, und die Uhr kennt keine Müdigkeit: sie
   triggert auch den Schlafenden, und zwar auf seine Credits. Der
   Credit-Burn durch häufige Schedules ist die moderne Form des
   Mühlsteins, den der eigne Automatismus um die eigne Rechnung dreht;
   die Klugheit besteht darin, die Uhr so zu stellen, daß sie nur das
   Notwendige weckt — dieselbe Lehre, welche [../triggerdev/FREE-TIER.md](../triggerdev/FREE-TIER.md)
   im Zusammenhange des Task-Laufens und jede Cron-Ordnung der Sammlung
   ([../vercel/FREE-TIER.md](../vercel/FREE-TIER.md) Hobby-Crons!)
   von neuem lehrt: die Zeit ist umsonst, ihr Wecken nicht.

## Quellen

- Provider: <https://registry.terraform.io/providers/CircleCI-Public/circleci/latest>
- Announcement: <https://circleci.com/changelog/official-circleci-terraform-provider-now-available/>

## Vermittelte Verhältnisse

Dies Kapitel vermittelt die Ausweise ([README.md](README.md)) mit den
Gaben ([FREE-TIER.md](FREE-TIER.md)) des Fürstentums; nach außen gehört
es zur Gattung der Bau-Begriffe — [../aws/TERRAFORM.md](../aws/TERRAFORM.md)
(CodeBuild/CodePipeline), [../gcp/TERRAFORM.md](../gcp/TERRAFORM.md)
(Cloud Build) — und zur Lehre vom State als Erinnerung, welche
[../cloudflare/TERRAFORM.md](../cloudflare/TERRAFORM.md) am fern
verwahrten Beispiele vollendet; wer alle vier Bau-Kapitel nacheinander
liest, der hat die kleine Typologie des Bau-Begriffs: die Verfassung
hier, das Werkzeug dort, die Anstalt dort, das Bau-Zeitalter dort —
und die Wahrheit dieser Typologie ist, daß alle vier dasselbe tun:
das Werden des Baus in den Begriff nehmen, damit es wiederholt und
geprüft werden kann; die Wiederholbarkeit als die Würde des Bauens,
das ist der letzte Satz dieser ganzen Materie.
