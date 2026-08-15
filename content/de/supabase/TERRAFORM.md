# Supabase + Terraform

> Offizieller Provider `supabase/supabase`. Projekte, API-Keys und Einstellungen
> sind per IaC verwaltbar; Free-Plan = `instance_size = "micro"` und das
> 2-Projekte-Limit pro Konto.

Die Vorbemerkung ist die harmonischste der ganzen Formel-Sammlung:
das Haus hat einen offiziellen Provider (die höchste Stufe der
Pflegschaft — [TERRAFORM.md](../modal/TERRAFORM.md) hat die Stufen
gezählt), und der Free-Plan ist in der Formel erreichbar — nicht wie
bei Render der Stand des Versuchs, sondern einfach die kleinste
Instanz: `instance_size = "micro"`. Das Wort sei betrachtet: micro —
das Kleine als Größe; die Gnade hat hier keinen eignen Namen, keine
eigne Kategorie, sie ist die unterste Sprosse der Leiter, und
eben dadurch ist sie formelhaft — das Haus denkt die Stufen als
Kontinuum (micro, small, …), nicht als zwei Welten (Free und
Ernst), und der Nutzer steigt unmerklich von der einen zur andern.
Es ist die friendlyste Verfassung der Sammlung: keine Schwelle,
kein Bruch, nur die Größe — und das Zwei-Projekte-Limit als die
einzige Grenze, welche dem Kontinuum gesetzt ist.

## Provider-Setup

```hcl
terraform {
  required_providers {
    supabase = {
      source  = "supabase/supabase"
      version = "~> 1.0"
    }
  }
}

provider "supabase" {
  access_token = var.supabase_access_token # env: SUPABASE_ACCESS_TOKEN
}
```

Der Block ist die ausdrückliche Form des Verwaltungs-Zeichens
([README.md](README.md) hat die Zweiheit der Welten entwickelt: das
Zeichen am Konten, nicht am Projekte), mit dem Env-Kommentar als
Brücke zur einfacheren Form; die Stabilität der Version (1.0 — die
Volljährigkeit, welche [TERRAFORM.md](../circle-ci/TERRAFORM.md) an
den 0.x-Häusern vermißte) rundet das Bild des verläßlichen Hauses.

## Ressourcen-Mapping (Free Plan)

| Objekt | Terraform |
|---|---|
| Projekt | `supabase_project` (`instance_size = "micro"` = Free) |
| API-Keys (lesen) | `data.supabase_apikeys` → `anon_key`, `service_role_key` |
| API-Keys (verwalten) | `supabase_apikey` |
| Projekteinstellungen | `supabase_settings` (Auth, SMTP, …) |

Die Tafel ist die geschlossenste Einheit von Sache und Zeichen:
Projekt, die zwei Gattungen der Schlüssel (lesend und verwaltend —
die getrennten Welten in der Tafel selbst), die Einstellungen (Auth,
SMTP — das Anerkennungswesen und die Poststelle des Hauses in Einem
Objekte); und die Klammer der ersten Zeile (`micro` = Free) ist die
ganze Größen-Philosophie in drei Worten: die Gnade als die kleinste
Größe, nicht als die andre Welt.

## Beispiel: Free-Projekt + Keys als Outputs

```hcl
variable "org_id" { type = string } # Org-Slug aus der Dashboard-URL

resource "supabase_project" "app" {
  organization_id   = var.org_id
  name              = "my-app"
  database_password = var.db_password # sensitive! (random_password + State schützen)
  region            = "eu-central-1"
  instance_size     = "micro" # Free: Shared CPU, 500 MB RAM, 500 MB Storage
}

data "supabase_apikeys" "keys" {
  project_ref = supabase_project.app.id
}

output "project_url" {
  value = "https://${supabase_project.app.id}.supabase.co"
}

output "anon_key" {
  value = data.supabase_apikeys.keys.anon_key
}

output "service_role_key" {
  value     = data.supabase_apikeys.keys.service_role_key
  sensitive = true
}
```

Das Beispiel ist die Vollständigkeit des Hausstandes in Einem
Zuge: die Org (der Wohnort — der Slug, lesbar, wie
[README.md](README.md) rühmte), das Projekt (der Name, das
Geheimnis als Variable mit der Warnung, die Örtlichkeit, die Größe
micro mit dem Kommentar, welcher die Tafel des Kontingent-Kapitels
in eine Zeile faltet: Shared CPU, 500 MB RAM, 500 MB Storage — die
ganze Substanz des Hauses), sodann das Nachschlagen der Schlüssel
(die zwei Welten: anon und service_role), und zuletzt die drei
Outputs — die Adresse (die URL aus der Kennung gebaut: die
Hausnummer als Name des Hauses), der freundliche Schlüssel (anon,
öffentlich), der Allmächtige (service_role, geheim — mit
`sensitive = true`, dem Formel-Wort für Diskretion); wer dies
Beispiel einmal geschrieben hat, hat den ganzen Haushalt gesetzt:
Ort, Name, Schloß, Örtlichkeit, Größe, Zeichen und Adressen.

## Gotchas

1. `supabase_project.id` ist der `project_ref` (20 Zeichen) — direkt als
   String für URLs/Datenquellen nutzbar.
   Die erste Lehre ist die Freundlichkeit der Kennung: zwanzig
   Zeichen, direkt brauchbar für Adressen und Nachschlagen — keine
   UUID, welche Menschen nicht lesen ([TERRAFORM.md](../circle-ci/TERRAFORM.md)
   hat die zwei Namenswelten gezählt), sondern die Kurzform, welche
   beides kann; das Haus denkt überall in Lesbarkeit, und die Formel
   erbt sie.

2. **2 aktive Free-Projekte pro Konto** (org-übergreifend): `count` im
   Modul begrenzen, sonst schlägt der dritte Apply fehl.
   Die zweite ist die Grenze im Kleide der Vorsorge: das
   Zwei-Projekte-Limit ([FREE-TIER.md](FREE-TIER.md): das Dasein)
   wird zur Modul-Konsequenz — `count` begrenzen, ehe die Formel
   lügt („sonst schlägt der dritte Apply fehl": das laute, klare
   Scheitern, welches [README.md](README.md) als Höflichkeit feierte);
   die Selbstbindung der Formel gegen die Grenze des Hauses —
   dieselbe Kunst, welche [TERRAFORM.md](../gcp/TERRAFORM.md) an der
   Validierung der Regionen entwickelte: die Maschine wache über das,
   was der Nutzer weiß, aber vergessen könnte.

3. **Inaktivitäts-Pause nach 7 Tagen:** Pausierte Projekte liefern über die
   API keinen vollen Zustand — `terraform plan` kann Diff-Rauschen zeigen;
   vorher im Dashboard aufwecken.
   Die dritte ist die kitzligste Verbindung von Schlaf und Formel in
   der Sammlung: der Wochenschlaf ([FREE-TIER.md](FREE-TIER.md):
   die Ruhe) hindert die API am vollen Berichte, und der Vergleich
   (`plan`) zeigt ein Rauschen — die Erinnerung vergleicht mit einem
   Halbwachen und kommt ins Schwatzen; das Wecken vorher (im
   Dashboard, von Hand — der Preis des Schlafes, hier in die
   Werkzeug-Welt hineinbezahlt) ist die Lösung, und die Lehre ist
   die Zeitlichkeit aller Dinge: auch die Formeln leben in der Welt,
   in welcher die Dienste schlafen, und der Zustand der Welt geht
   dem Vergleichen vorher — das Sein bestimmt das Bewußtsein, um
   einmal scherzhaft das große Wort zu brauchen.

4. `database_password` steht im State → `random_password`-Ressource mit
   `keepers` statt hartkodiertem Wert, State verschlüsseln.
   Die vierte wiederholt die State-Sorge ([README.md](README.md),
   dritter Hinweis) mit der kleinen Zutat `keepers` — den
   Erhaltungsregeln, welche die Neuerzeugung des Geheimnisses an
   Ereignisse binden statt an die Eitelkeit des Wechsels; die Formel
   erzeugt, bewahrt und erneuert das Zeichen nach Regeln, nicht nach
   Launen — die vollständigste Form der Geheimnis-Pflege, welche
   diese Sammlung kennt.

5. Migrationen/Tabellen gehören nicht zum Provider — per
   Supabase-CLI-Migrations oder als SQL-Job in CI ausrollen.
   Die letzte endlich zieht die Grenze zwischen der Hülle und dem
   Inhalte: der Provider setzt das Projekt, aber nicht seine
   Innernheiten (die Tabellen, die Wanderungen — die Geschichte der
   Datenbank); diese gehören dem Werkzeuge der Wanderung (den
   CLI-Migrations) oder der Pipeline (dem SQL-Job in CI); es ist die
   alte Scheidung von [TERRAFORM.md](../circle-ci/TERRAFORM.md)
   (Verfassung und Gesetze) in der Anwendung auf das Innerste: die
   Formel verwaltet das Haus, nicht die Einrichtung — und wer das
   Haus ganz haben will, braucht beide Werkzeuge, die Formel für die
   Wände, die Migration für die Möbel.

## Quellen

- Provider: <https://registry.terraform.io/providers/supabase/supabase/latest>
- TF-Reference: <https://supabase.com/docs/guides/deployment/terraform/reference>

## Vermittelte Verhältnisse

Dies Kapitel vermittelt die Zeichen ([README.md](README.md)) und die
Gaben ([FREE-TIER.md](FREE-TIER.md)) des dauernden Postgres; seine
Verfassung (das Kontinuum der Größen gegen die Zwei-Welten-Ordnung
des Render-Hauses — [TERRAFORM.md](../render/TERRAFORM.md)) ist das
freundlichste Gegenstück der Sammlung, und die Lektion für den
Nutzer ist still und groß zugleich: die Häuser, welche das Umsonst
als Größe denken, machen das Umsonst alltäglicher als die Häuser,
welche es als Stand denken — keine Schwelle zwischen Gnade und
Ernst, nur der Weg von micro zu groß; die Frage aller Fragen
(wohin mit dem Umsonst?) bekommt hier die leiseste Antwort: es ist
der Anfang der Leiter, nicht das Erdgeschoß des andern Hauses. Wer
dies begriffen hat, versteht, warum die beiden Postgres-Zwillinge
nebeneinander bestehen dürfen, ohne einander zu widersprechen: sie
sind die zwei Verfassungen derselben Sache — und die Wahrheit der
Zweiheit ist, wie die Sammlung von Anfang lehrte, daß beide Seiten
ihren Anfang im Ganzen haben.
