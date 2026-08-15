# Cloudflare + Terraform

> Offizieller Provider `cloudflare/cloudflare` (v5). Der komplette Free-Plan
> (Workers, D1, R2, KV, Queues, Pages) ist per Terraform provisionierbar.
> **v5 hat viele Ressourcen umbenannt** — alte Tutorials mit v4-Namen
> (`cloudflare_worker_script`) funktionieren nicht mehr.

Die Umbenennung, von welcher der Kasten spricht, ist mehr als eine
Versionsnotiz; sie ist ein kleiner Sprachwandel, und wie alle
Sprachwandel hat er Opfer — die alten Tutorials, welche die alten Namen
lehren, und mit ihnen die Leser, welche den alten Namen glauben. Das
Haus hat in der fünften Fassung die Mehrzahl gesetzt, wo die vierte die
Einzahl hatte (`worker_script` → `workers_script`), und diese scheinbar
grammatische Kleinigkeit — der Stamm wächst um Einen Buchstaben —
teilt die Welt der Anleitungen in die zwei Reiche des Geltens und des
Verklungenen; wer dies erfahren hat, der kennt das Gefühl: die Formel
sieht richtig aus, die Anleitung verspricht Erfolg, und die Maschine
antwortet mit dem Namen der neuen Ordnung. Es ist die bekannte Lehre
vom Bekannten, welches nicht erkannt ist ([FREE-TIER.md](FREE-TIER.md)
entwickelt sie am Beispiele der AWS-Umstellung), hier in der
Werkzeugwelt wiederholt; und wie dort ist das Heilmittel dasselbe: die
Quelle lesen, nicht die Erinnerung.

## Provider-Setup

```hcl
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token # env: CLOUDFLARE_API_TOKEN
}
```

Der Block ist die Mitte zwischen der Strenge und der Bequemlichkeit:
das Token als Variable gesetzt (nicht als Klartext, nicht als Env im
Blocke — die Scheidung von Form und Inhalt, welche
[README.md](README.md) als die Verfassung dieses Randes entwickelte),
der Kommentar aber verweist auf die Env-Form, welche der Provider
zudem liest; der Nutzer hat also zwei rechtmäßige Wege, denselben
Inhalt zu bringen, und die Wahl zwischen ihnen ist Geschmack — ein
seltener Zustand in dieser Sammlung, wo sonst immer nur Ein Weg der
rechte war.

## Ressourcen-Mapping (Workers Free Plan)

| Free-Tier-Service | Terraform-Ressource (v5) |
|---|---|
| Worker | `cloudflare_workers_script` (100 k Requests/Tag) |
| D1-Datenbank | `cloudflare_d1_database` (5 GB gesamt) |
| R2-Bucket | `cloudflare_r2_bucket` (10 GB, Egress gratis) |
| KV-Namespace | `cloudflare_workers_kv_namespace` + `cloudflare_workers_kv` |
| Queue | `cloudflare_queue` |
| Pages-Projekt | `cloudflare_pages_project` (+ `cloudflare_pages_domain`) |
| Turnstile / Access / Tunnel | `cloudflare_turnstile_widget`, `cloudflare_access_application`, `cloudflare_tunnel` |

Die Tafel führt die Gaben des Kontingent-Kapitels in den Formeln der
fünften Fassung auf; zwei Kleinigkeiten sind es wert, hervorgehoben zu
werden. Erstens die eingeklammerten Zahlen — 100 k Requests, 5 GB,
10 GB —, welche das Kontingent an die Ressource heften: die Formel
selbst erzeugt das Unbegrenzte (der Worker kann alles leisten, was
Workers leisten), das Kontingent wohnt nicht in ihr, sondern neben
ihr, im Anmerkungswesen der Tafel — dieselbe Scheidung von Formel und
Gabe, welche [../aws/TERRAFORM.md](../aws/TERRAFORM.md) am
Ressourcen-Mapping entwickelte, hier in die Zeilen selbst
eingeschrieben. Zweitens die letzte Zeile, welche drei staatsrechtliche
Produkte (Turnstile, Access, Tunnel) in Einem Atem aufführt: die
Prüfung, die Tür und der Gang — und daß alle drei formelbar sind,
heißt: der ganze Rand, bis in seine Verfassung hinein, ist Begriff
geworden.

## Beispiel: Worker + D1 + R2 + KV

```hcl
variable "account_id" { type = string }

resource "cloudflare_workers_script" "api" {
  account_id         = var.account_id
  name               = "free-api"
  content            = file("dist/worker.js")
  compatibility_date = "2026-08-01"
  # Bindings (D1/R2/KV/Secrets/Cron) werden im bindings-Block
  # konfiguriert — v5-Syntax in der Registry-Doku prüfen.
}

resource "cloudflare_d1_database" "main" {
  account_id = var.account_id
  name       = "app-db" # 5 Mio. Reads + 100 k Writes/Tag gratis
}

resource "cloudflare_r2_bucket" "assets" {
  account_id = var.account_id
  name       = "assets" # 10 GB/Monat, Egress 0 $
}

resource "cloudflare_workers_kv_namespace" "cache" {
  account_id = var.account_id
  title      = "cache" # 100 k Reads + 1 k Writes/Tag, 1 GB Storage
}
```

Das Beispiel versammelt die vier Geschwister in Einem Dateikörper — das
Rechnen (Script), die Substanz (D1), die Aufbewahrung (R2), das
flüchtige Gedächtnis (KV) —, und es lehrt in seiner Anordnung die
Architektur des Randes: alles hängt am Account (die `account_id`, viermal
wiederholt als das Bleibende), alles hat Namen (die Namen als die
Adressen der Dinge im Konten), und die Verbindungen (Bindings) sind
ausdrücklich zu setzen — der Kommentar verweist auf den bindings-Block,
in welchem der Worker seine Geschwister zugesprochen bekommt; es ist
die alte Lehre der Wechselbestimmung ([../aws/TERRAFORM.md](../aws/TERRAFORM.md)
am IAM-Beispiele): keines der Dinge ist für sich, jedes ist es durch
die Beziehung, und der Begriff setzt die Beziehungen, ehe die Dinge
arbeiten. Die `compatibility_date` endlich — hier auf den August
des Jahres 2026 gesetzt — ist die kleinste und feinste Einrichtung des
Hauses: der Arbeiter bekommt das Verhalten des Tages, an welchem er
geschaffen ward, zugesagt; die Zeit als Bestandteil der Formel, der
Wandel der Plattform als etwas, welches den Bestand nicht trifft —
die Maschine verspricht, was sie am Stichtage war, und dieses Versprechen
ist es, welches die Scripts über Jahre trägt; man möchte sagen: die
compatibility_date ist die geschichtliche Zusage im technischen Dokumente,
die Gnade der Dauer, welche sonst nur die Toten genießen.

## Gotchas

1. **v4→v5-Renames:** `cloudflare_worker_script` → `cloudflare_workers_script`,
   KV-Namespace heißt weiterhin `title`, nicht `name`. Bei Copy-Paste aus
   alten Guides auf den Ressourcennamen achten.
   Die erste Lehre ist die zweifache vom Namen: die große Umbenennung
   (worker → workers) und die kleine Beharrung (KV heißt `title`, nicht
   `name`) — der Wandel und das Widerstrebende im Wandel; die
   Empfehlung, beim Abschreiben auf den Namen zu achten, ist die
   nüchternste Form der Sprachgeschichte: Wörter wandeln sich, und die
   Werkzeuge hören nicht auf die Wörter, sondern auf die Welt, welche
   die Wörter trägt.

2. **R2 muss einmalig im Dashboard "aktiviert"** werden, bevor die API
   (und damit Terraform) Buckets anlegen kann.
   Die zweite ist die Lehre von der ersten Hand: das Haus verlangt, daß
   der Nutzer einmal persönlich erscheint — im Dashboard, mit der Hand
   am Knopfe —, ehe die Boten (API, Terraform) das Ihrige tun dürfen;
   es ist der Rest der Persönlichkeit in der Welt der Formeln, das
   Once-Only der Gegenwart, und wer darüber klagt, der bedenke nicht
   die Bequemlichkeit, sondern die Bedeutung: das Haus will gesehen
   haben, wer da ist, ehe es die Türen den Zeichen öffnet — die
   Anerkennung der Person als Grundlage der Anerkennung des Zeichens,
   wie sie recht ist.

3. Die 100-k-Requests/Tag gelten **kontoweit** über alle Worker — bei
   mehreren `workers_script`-Ressourcen einplanen.
   Die dritte wiederholt die Commune der Tätigkeiten aus dem
   Kontingent-Kapitel ([FREE-TIER.md](FREE-TIER.md), dritte Gotcha)
   in der Sprache der Formeln: wer mehrere `workers_script`-Ressourcen
   setzt, der setzt mehrere Esser an den einen Tisch, und das Einplanen
   ist die Arithmetik der Gastfreundschaft — dieselbe Lehre von der
   Teilung, welche die Sammlung von den VM-Stunden bis zu den Anrufen
   verfolgt hat, und deren letzte Fassung immer dieselbe ist: das
   Kontingent gehört dem Hause, nicht dem Kinde.

4. Secrets nie als Klartext-`bindings` committen: `cloudflare_workers_secret`
   bzw. `wrangler secret put` und im TF nur referenzieren.
   Die vierte ist die Sicherheitslehre in Einem Satze: das Geheimnis
   hat zwei rechtmäßige Orte — die Ressource (`cloudflare_workers_secret`)
   oder das Werkzeug (`wrangler secret put`) —, aber der KlarText im
   Repositorium gehört nicht dazu; das Referenzieren statt des
   Setzens ist die Formel des Schweigens, und wer sie hält, der hat
   das Verhältnis von Rede und Verschweigen in die Technik übertragen:
   man spricht über das Geheimnis (man referenziert), ohne es zu
   sprechen (ohne den Wert zu nennen) — die ganze Rhetorik der
   Diskretion in Einem `wrangler`-Befehl.

5. Free-Limits resetten täglich 00:00 UTC — Monitoring/Alerting der
   Tages-Kontingente via GraphQL-API möglich.
   Die letzte endlich verbindet die Tagesform der Gnade (das
   Mitternachts-Resetten, von welchem das Kontingent-Kapitel ausging)
   mit der Sorge: auch das tägliche Maß will überwacht sein, und die
   GraphQL-API ist das Ohr, welches die Grenzen des Tages vernehmbar
   macht; wer die zwei Uhrzeiten im Auge behält — die seines Verbrauchs
   und die der Mitternacht —, der lebt mit dem Rande im Takte, und das
   ist der einzige Rhythmus, welcher hier paßt: der Tag als die Frist
   der Gnaden, die Nacht als ihre Erneuerung.

## Quellen

- Provider: <https://registry.terraform.io/providers/cloudflare/cloudflare/latest>
- Workers Pricing: <https://developers.cloudflare.com/workers/platform/pricing/>

## Vermittelte Verhältnisse

Dies Kapitel ist der Begriff des Randes, wie [FREE-TIER.md](FREE-TIER.md)
seine Gaben und [README.md](README.md) seine Ausweise sind; nach außen
verweist es auf die Gattungsgeschwister — [../aws/TERRAFORM.md](../aws/TERRAFORM.md)
für die Mitte, deren State-Lehre hier mit der fernen Ablage (Backends)
ihr ferneres Kapitel hat, [../gcp/TERRAFORM.md](../gcp/TERRAFORM.md)
für die örtliche Gnade, deren Tunnel-Lehre das Rand-Kapitel
([FREE-TIER.md](FREE-TIER.md)) beantwortet —, und für die Namenlehre
(v4→v5) auf [../azure/TERRAFORM.md](../azure/TERRAFORM.md), wo
derselbe Wandel unter andern Namen (azurerm 4.x) liegt. Wer alle
Namenslehren der Sammlung sammelt, der hat das Wörterbuch des Wandels:
Ressourcen heißen um, Häuser zählen neu, und nur die Wahrheit bleibt,
daß die Formeln der letzten Fassung gelten — bis zur nächsten; die
Eule der Minerva fliegt auch über den Registries, und wer dies weiß,
liest die Dokumente dieser Sammlung, wie sie gelesen sein wollen: als
die Ordnung eines Tages im Gange der Geschichte.
