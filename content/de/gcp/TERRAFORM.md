# Google Cloud + Terraform

> Offizieller Provider `hashicorp/google`. Kern-Stolperstein: Viele
> Always-Free-Kontingente gelten **nur in `us-west1`, `us-central1`, `us-east1`**
> — die Region ist also Teil der Free-Tier-Konfiguration.

Von allen Stolpersteinen, welche diese Sammlung verzeichnet, ist dieser
der geographischste und, wenn man so will, der unbürgerlichste: die
Wahrheit des Umsonst hängt am Längengrade. Bei den andern Wolken gilt
die Gnade, wo der Dienst ist; hier gilt sie nur, wo die Tafel es sagt —
in den drei Häfen der amerikanischen Festlandsküste —, und der Nutzer,
welcher seine Formeln ohne Rücksicht auf die Geographie schreibt, der
hat wohl Formeln, aber keine Gnade; er hat das Allgemeine des Werkzeugs
und verfehlt das Besondere der Bedingung, und die Rechnung, welche am
Ende steht, ist dann nicht Irrtum, sondern Konsequenz. Es wird also
hier, mehr als anderswo, die Region zum Bestandteile des Begriffs
selbst: nicht eine Beiordnung (der Dienst hier, der Ort daneben),
sondern eine Innerein (der Dienst nur am Orte), und die folgende
Darstellung hat die Eigentümlichkeit, dieses Ins-Eine-Setzen von Dienst
und Ort in der Syntax der Formeln vorzuführen.

## Provider-Setup

```hcl
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-central1" # Always-Free-Standardregion
  # Auth: gcloud auth application-default login
  # Free Tier erfordert ein Billing-Konto am Projekt!
}
```

Der Block ist einfach, und eben in seiner Einfachheit lehrreich: das
Projekt als Variable (das Konkrete des Vorhabens, offen gelassen, denn
ein Vorhaben ist nie der Block selbst), die Region als gesetzt — mit dem
Kommentar, der das Ganze dieses Kapitels in Einem Worte enthält:
„Standardregion", das heißt die Region, welche zu wählen ist, nicht weil
sie die beste, sondern weil sie die begnadete ist; und unter dem Blocke
die zwei Kommentare, welche die beiden schon bekannten Paradoxien
festhalten — die Authentisierung durch das Werkzeug (siehe
[README.md](README.md), die Lehre von den zwei Logins) und das
Billing-Konto als Bedingung des Umsonst (siehe [FREE-TIER.md](FREE-TIER.md),
den Hinweis auf die Anmeldestelle des Bezahlens). Ein Block, zwei
Kommentare, drei Lehrstücke — es gibt Erläuterungen, welche kürzer
sind und weniger sagen.

## Ressourcen-Mapping (Always Free)

| Free-Tier-Service | Terraform-Ressource | Free-Bedingung |
|---|---|---|
| Compute Engine e2-micro | `google_compute_instance` | `machine_type = "e2-micro"`, Zone in us-west1/central1/east1, 30 GB `pd-standard` |
| Cloud Run (2 Mio. Requests) | `google_cloud_run_v2_service` | keine |
| Cloud Functions (2 Mio.) | `google_cloudfunctions2_function` | keine |
| Cloud Storage (5 GB) | `google_storage_bucket` | Region us-east1/us-west1/us-central1 |
| BigQuery (1 TiB Queries) | `google_bigquery_dataset` | keine |
| Firestore | `google_firestore_database` | keine |
| Artifact Registry (0,5 GB) | `google_artifact_registry_repository` | keine |
| GKE Autopilot | `google_container_cluster` (Autopilot) | 1 Cluster ohne Management-Fee |

Die dritte Spalte dieser Tafel ist das Eigene: sie heißt „Free-Bedingung"
und sagt, was außer der Ressource noch nötig ist, damit die Gnade eintritt;
bei der Hälfte der Zeilen steht „keine" — die bedingungslosen Gaben,
welche dieselbe Stellung haben wie überall (Cloud Run, Functions,
BigQuery: die Vermittlung, die Funktion, die Anschauung) —, bei der
andern Hälfte steht der Ort: die bedingten Gaben, an deren Bedingungen
die Örtlichkeit der Gnade hervortritt. Man könnte die Tafel danach
sortieren, in bedingte und unbedingte, und hätte eine kleine Typologie
der Gaben: die allgemeinen (welche der Ort nicht interessiert, weil sie
überall gleich sind) und die örtlichen (welche die Bedingung ihres
Seins in einem Dasein außer sich haben); und es wäre eine bemerkenswerte
Beobachtung, daß die örtlichen Gaben gerade die körperlicheren sind —
die Maschine, die Platte, der Speicher —, die allgemeinen dagegen die
geisterigeren — der Ruf, die Rechnung, der Begriff: als hinge das
Schwere am Orte und das Leichte am Allgemeinen, eine Physik der
Dienste, welche zu bedenken sich lohnt, auch wenn ihre Gesetze hier nur
angedeutet werden können.

## Beispiel: e2-micro-VM (klassisches Always-Free-Setup)

```hcl
resource "google_compute_instance" "free_vm" {
  name         = "free-vm"
  machine_type = "e2-micro" # Always Free — NUR in us-west1/us-central1/us-east1
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 30 # 30 GB Standard-PD inklusive
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    # ⚠️ Ohne access_config-Block: keine externe IP (Recommended, da externe
    # IPv4 seit 2024 ~$3–4/Monat kostet — sonst Cloudflare Tunnel/IAP nutzen).
    access_config {}
  }
}
```

Dies Beispiel ist das klassische nicht nur, weil es die klassische Gabe
(die berühmte e2-micro) setzt, sondern weil es in seinem kleinsten
Bestandteile die ganze Dialektik der Anschrift vorführt: der
`access_config {}`-Block, leer gelassen, setzt die äußere Anschrift —
und der Kommentar belehrt, daß dieselbe Anschrift seit 2024 bezahlt
werden muß, so daß die „kostenlose" Maschine nur dann eine wirklich
kostenlose ist, wenn man das kleine, leere Blockzeichen wegläßt oder,
wolte man die Anschrift dennoch, sie auf dem Umwege über die Tunnel
der [../cloudflare/FREE-TIER.md](../cloudflare/FREE-TIER.md) oder die
IAP-Pforte der eignen Wolke errichtet. Es ist der Fall, in welchem die
Leere eines Blockes teurer ist als seine Fülle: das Nichts, welches
Geld kostet, weil es die Anschrift der Welt ist — und wer die Zeile
recht bedenkt, der sieht in ihr die Grundformel jeder Überraschungs-
rechnung: nicht das, was man setzt, sondern das, was das Gesetz des
Setzens stillschweigend hinzusetzt.

## Gotchas

1. **Region vor allem anderen entscheiden** — `europe-west3` & Co. fallen
   sofort unter normale Abrechnung. Am besten `region`/`zone` als Variablen
   mit Validierung auf die drei US-Regionen setzen.
   Die erste Lehre setzt die Reihenfolge des Entscheidens, welche
   [README.md](README.md) für die Authentisierung aufstellte, hier für
   die Geometrie: der Ort ist das Erste — vor dem Dienste, vor der
   Formel, vor allem —, und die Empfehlung, die Region als Variable mit
   Validierung zu setzen, ist die Übersetzung der geographischen Wahrheit
   in die maschinelle Kontrolle: die Formel selbst soll den Irrtum
   verhindern, die Validierung als Wachtposten der Gnade, und wer einmal
   erlebt hat, mit welcher Ruhe eine gut geschriebene Validierung den
   eignen Irrtum abfängt, der wird die kleinen Regeln der
   Selbstbindung nicht mehr verachten — sie sind die bürgerliche
   Verfassung des eignen Wollens, gegen welches am empfindlichsten zu
   schützen man sich selbst hat.

2. Externe IPv4 wird separat abgerechnet (siehe FREE-TIER.md) — die
   "kostenlose VM" ist ohne access_config von außen nicht erreichbar.
   Die zweite wiederholt die Lehre von der teuren Anschrift und fügt
   die Kehrseite bei: ohne Anschrift keine Erreichbarkeit; wer das
   Blockzeichen spart, spart am Ende auch den Verkehr — die Maschine
   ist dann ein Kloster, kostenlos und stumm. Die zwei Weisen, aus
   diesem Widerspruche herauszukommen (Tunnel oder Pforte), sind die
   zwei Weisen überhaupt, Öffentlichkeit zu vermitteln: durch den
   fremden Boten (Cloudflare) oder durch die eigne (IAP); die direkte,
   die alte Weise der bloßen Adresse, ist dem Preise verfallen, und
   darin zeigt sich, daß selbst die Adressen der Welt Geschichte haben.

3. Free Tier braucht trotzdem ein **Billing-Konto** am Projekt — ohne wird
   Cloud Run/D1-artige Dienste teils gar nicht erst angelegt.
   Die dritte ist die schon bekannte Paradoxie der Anmeldestelle, hier
   in ihrer Verschärfung: nicht nur die Verrechnung des Geschenks,
   sondern das Anlegen selbst wird verweigert, wenn die Zählmöglichkeit
   fehlt; die Gnade, welche das Bezahlbare voraussetzt, wird hier zur
   harten Bedingung des Daseins — ohne Akte kein Orden, ohne Billing
   kein Run. Und es sei der Hinweis gestattet, daß der Zusatz „D1-artige
   Dienste" ein kleines Rätsel enthält: er meint Dienste der nächsten
   Verwandtschaft (beim Lesen denke man an die Cloud-SQL-Familie), und
   das Rätsel ist die Art des Rätsels selbst — der technische Jargon
   als Abkürzung, welche nur dem Kenner aufgeht; die Kontingent-Welt
   hat ihre Scholastik, und ihre Begriffe sind so genau und so dunkel
   wie die der alten.

4. `google_cloud_run_v2_service` nutzen (v1 ist veraltet); Ingress/Egress der
   1-GB-Nordamerika-Freimenge im Blick behalten.
   Die vierte Lehre ist doppelt: die geschichtliche (v1 ist veraltet —
   derselbe Namenwechsel, den die Azure-Gotchas am Functions-Beispiele
   lehrten; die v2 ist die Wahrheit der v1, wie das Konkrete die
   Wahrheit des Abstrakten) und die geographische (die Freimenge des
   Verkehrs gilt, wie alles hier, nur für Nordamerika — selbst der
   Aus- und Eingang der Daten ist an den Kontinent gebunden, und wer
   seine Nutzer in Europa hat, dem ist die Rechnung des Verkehrs
   schonungslos, denn die Gnade des Ganges endet am Strande des
   begnadeten Landes).

5. Budget-Alarm gleich mitbauen: `google_billing_budget` + Pub/Sub-Notification.
   Die letzte endlich ist die der Sorge, welche in dieser Sammlung kein
   Kapitel ausläßt ([../aws/TERRAFORM.md](../aws/TERRAFORM.md) hat sie
   als `aws_budgets_budget`, [../azure/TERRAFORM.md](../azure/TERRAFORM.md)
   als Empfehlung) und die hier die eigentümlichste Gestalt hat: das
   Budget mit der Pub/Sub-Notification — die Sorge, welche sich selbst
   verkündet; der Alarm, welcher nicht bloß gesetzt, sondern subscribiert
   ist, das erschreckte Selbstbewußtsein mit postalischer Anlage, und es
   ist damit die vollständigste Form aller bisher gesehenen Sorge-Ein-
   richtungen: die Grenze setzt sich, überwacht sich und meldet sich —
   Subjekt, Objekt und Bote in Einem Hause.

## Quellen

- Provider: <https://registry.terraform.io/providers/hashicorp/google/latest>
- Free-Tier-Details: <https://cloud.google.com/free/docs/free-cloud-features>

## Vermittelte Verhältnisse

Dies Kapitel vermittelt zwischen den Gaben ([FREE-TIER.md](FREE-TIER.md))
und den Ausweisen ([README.md](README.md)); nach außen gehört es zur
Dreiheit der großen Wolken-Formeln — [../aws/TERRAFORM.md](../aws/TERRAFORM.md),
[../azure/TERRAFORM.md](../azure/TERRAFORM.md) und dies —, welche dieselbe
Sache unter drei Gestalten aufführen: die Wolke der Credits (AWS), die
Wolke der Fristen (Azure), die Wolke der Örter (Google); wer die drei
Provider-Blöcke nebeneinanderlegt, der sieht in den Kommentaren die
ganzen drei Philosophien beisammen: dort das Billing-Alarm-Motiv, hier
das Standardregion-Motiv, dort das Auth-Motiv — kleine Zeilen, große
Lehren. Die Kleinern Verwandten sind [../cloudflare/TERRAFORM.md](../cloudflare/TERRAFORM.md)
(für die Tunnel-Lehre der Anschrift) und [../circle-ci/TERRAFORM.md](../circle-ci/TERRAFORM.md)
(für das Bauwesen im Kleinen); und wer am Ende dieser Verweise ankommt,
befindet sich, wie immer in diesem Werke, am Anfange eines frühern
Kapitels — im Kreise, welcher die Form der Wahrheit ist und hier, am
Schlüsse des dritten der großen Kapitel, sich zum erstenmale ganz
schließt: die drei Wolken sind gelesen, der Rest ist die Entfaltung
ihrer Momente in den besondern Diensten.
