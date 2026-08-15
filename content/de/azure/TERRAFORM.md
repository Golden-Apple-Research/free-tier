# Azure + Terraform

> Offizieller Provider `hashicorp/azurerm`. Die Always-Free-Angebote sind über
> spezielle Attribute/SKUs erreichbar (Cosmos-`free_tier_enabled`, Functions
> Consumption `Y1`, App Service `F1`); sie sind **nicht** Default.

Diese Vorbemerkung ist unter allen Warnungen dieser Sammlung die
bezeichnendste: das Umsonst ist hier — im strengen Gegensatze zu manchem
andern Provider — nicht die natürliche Gestalt der Dinge, sondern eine
abgeleitete, welche ausdrücklich gewählt, ja als Attribut gesetzt werden
muß; der Default, das anfängliche, unbe Fragte einer jeden Erzeugung, ist
das Kostenpflichtige, und die Gnade erscheint nur dem, welcher sie beim
Namen nennt. Es ist die Weltanschauung des Codex: alles ist verboten
(kostbar), was nicht ausdrücklich erlaubt (umsonst) ist — und wer die
Umkehrung wünscht, der findet sie in Wolken, deren Defaults das Kleine
gratis machen. Der Nutzer, welcher diese Seite liest, lernt also zuerst
ein Formprinzip: bei Azure wird das Freie nicht genommen, sondern
beansprucht, und der Anspruch hat eine Syntax (`free_tier_enabled`, `Y1`,
`F1`), welche zu lernen keine Schande, zu mißachten aber eine Rechnung ist.

## Provider-Setup

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  # Auth: az login (CLI) oder ARM_*-Umgebungsvariablen / Client Secret
}
```

Der Block ist der AWS-Entsprechung ([../aws/TERRAFORM.md](../aws/TERRAFORM.md))
ähnlich bis auf das auffällige `features {}` — ein leerer Block, welcher
nichts sagt und doch gesagt sein muß; die Erklärung dieses Wunders ist
historisch: der Provider hat seine Wachstumsstufen in Form von
Feature-Schaltern durchlaufen, und der leere Block ist die leere Tafel,
an welcher der Nutzer erklärt, alle entschiedenen Fragen als entschieden
zu übernehmen — ein Stillstand der Freiheit, der hier, im Bereiche der
Werkzeuge, dieselbe Rolle spielt wie die stillschweigende Anerkennung der
Gewohnheit im Bereiche der Sitten: man tut, was alle tun, und nennt es
Nichts. Der Kommentar unter dem Block verweist auf die beidän Ausweise —
Person oder Beauftragter —, deren Verhältnis [README.md](README.md) im
Zusammenhange entwickelt hat; hier genüge der Hinweis, dass auch der
beste Formelbrief nichts gilt, wenn der Bote sich nicht ausweisen kann.

## Ressourcen-Mapping (Always Free)

| Free-Tier-Service | Terraform-Ressource |
|---|---|
| Cosmos DB Free Tier (1.000 RU/s + 25 GB) | `azurerm_cosmosdb_account` mit `free_tier_enabled = true` |
| Functions (1 Mio. Executions) | `azurerm_service_plan` SKU `Y1` + `azurerm_linux_function_app` |
| App Service F1 (10 Apps) | `azurerm_service_plan` SKU `F1` + `azurerm_linux_web_app` |
| Static Web Apps Free | `azurerm_static_site` |
| AKS Free-Tier-Management | `azurerm_kubernetes_cluster` mit `sku_tier = "Free"` |
| Entra ID Free | (keine TF-Ressource nötig — Tenant-Feature) |

Die Tafel fügt dem schon Gesagten ([FREE-TIER.md](FREE-TIER.md)) die
Syntax der Ansprüche hinzu; ihre Lehre ist die vom Buchstaben: die Gnade
ist an Zeichen gebunden — ein Attribut hier (`free_tier_enabled = true`),
eine Stockwerke-Bezeichnung dort (`Y1`, `F1`) —, und die Zeichen sind
nicht willkürlich, sondern Abkürzungen von Geschichten: das `F1` des App
Service und das `Y1` der Functions sind die untersten Sprossen der
jeweiligen Leitern, und wer sie setzt, der setzt die Leiter an ihrer
untersten Sprosse, das heißt: am Beginne. Die letzte Zeile endlich, daß
Entra ID keiner Terraform-Ressource bedürfe, verdient ein Wort: das
Anerkennungswesen ist hier nicht etwas, was der Nutzer setzt, sondern
etwas, in welchem er sich schon immer befindet — der Tenant als die
vorhandene Welt der Identitäten, welche allen Setzungen vorhergeht; man
kann in Terraform keine Welt erschaffen, in welcher man schon ist, und
darum bleibt sie ungesetzt.

## Beispiel: Cosmos DB Free Tier + Static Web App

```hcl
resource "azurerm_resource_group" "rg" {
  name     = "free-rg"
  location = "germanywestcentral"
}

resource "azurerm_cosmosdb_account" "db" {
  name                = "free-cosmos-demo" # global eindeutig
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  free_tier_enabled   = true # 1.000 RU/s + 25 GB lebenslang — nur 1× pro Subscription!

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
    zone_redundant    = false
  }
}

resource "azurerm_static_site" "web" {
  name                = "free-static-demo" # Free-SKU ist Default
  resource_group_name = azurerm_resource_group.rg.name
  location            = "westeurope"
}
```

Auch dies Beispiel, wie das AWS-Lehrstück ([../aws/TERRAFORM.md](../aws/TERRAFORM.md)),
sei über seine technische Vollständigkeit hinaus gedeutet. Das
`free_tier_enabled = true` ist der formallyste Augenblick des Ganzen: ein
Wahrheitswert, an welchem ein lebenslängliches Recht hängt — der
ausgesprochene Wille, in die Gnade einzutreten, vermittels eines
einzigen Wortes, und der Kommentar erinnert die Bedingung: nur Einmal
pro Subscription; wer den Satz zum zweitenn Male spricht, dem antwortet
nicht die Gnade, sondern der Fehler. Die `consistency_policy` mit ihrem
`Session`-Werte gibt die kleine Wiederholung dessen, was das Kontingent-
Kapitel über die wählbare Wahrheit der Cosmos DB sagte: der Nutzer setzt
hier die Stufe der Übereinstimmung, welche seiner Welt genügt, und setzt
sie im Beispiele auf die Mitte (Session — die Attitüde dessen, welcher
das Nicht ganz Genau und das Nicht ganz Gleich gilt läßt, solange die
eigne Sitzung wachsam bleibt); `zone_redundant = false` endlich ist die
absagende Entsprechung: die Zones-Ausführung, das Mehrfach-Sein am Orte,
bleibt dem Bezahlten vorbehalten, und das Umsonst ist Einfach — was, wie
alles Einfache, auch sein Wahres hat. Die Static Web App mit dem Kommentar,
die Free-SKU sei hier Default, gibt den Kontrast zum Anfangskapitel: bei
dieser Einen Ressource ist das Umsonst die natürliche Gestalt, und der
Nutzer muß nichts erklären; es ist, als gäbe es im Codex auch einen
Paragraphen der Großmut, und man erkennt ihn daran, daß er ungebraucht
am Rande steht.

## Gotchas

1. `free_tier_enabled = true` funktioniert **nur einmal pro Subscription** —
   der zweite Cosmos-Account mit dem Flag schlägt fehl.
   Die erste Lehre ist die vom einmaligen Recht: die Gnade ist nicht
   Teil der Naturgesetze, sondern ein Privileg mit Zähler; es liegt darin
   eine bemerkenswerte Härte, denn der Fehler zeigt sich erst am
   zweiten Versuche — der erste hat ja gegolten —, und wer den zweitenn
   Account in gutem Glauben setzt, der erfährt die Grenze nicht als
   Warnung, sondern als Vollzug. Die Klugheit besteht also im
   Vorauswissen der Formel: Ein Subscription, Ein Account, Einmal —
   und wer mehrere braucht, der braucht mehrere Subscriptions oder das
   bezahlte Maß, aber nicht die Wiederholung des Geschenks, welche nur
   die Wiederholung des Fehlers wäre.

2. `azurerm_function_app` ist deprecated (azurerm 4.x) — aktuelle Ressourcen
   sind `azurerm_linux_function_app` / `azurerm_windows_function_app`.
   Die zweite Lehre ist die vom Wechsel der Namen: dieselbe Sache, der
   App, hat zu verschiedenen Zeiten verschiedene Ressourcen geheißen,
   und der alte Name gilt noch — als Erinnerung, welche warnt, ohne zu
   hindern —; das ist die historische Schicht des Werkzeugs, das
   Ablagerungsgestein vergangener Versionen, und wer die Schichten liest,
   lernt die Geschichte des Providers wie eine Stadt aus ihren
   Grundmauern: das Bestimmte (linux, windows) hat das Allgemeine
   (schlechthin function_app) abgelöst, die ungetrennte Vermischung ist
   der Sonderung gewichen, und es ist dieselbe Bewegung, welche aller
   Geschichte eigen ist — die einfache Gattung entzweit sich in ihre
   Arten, und die Arten sind die Wahrheit.

3. Consumption-Functions brauchen zusätzlich ein Storage-Account
   (`azurerm_storage_account`) — dieses kostet minimal Geld (~Cent).
   Die dritte ist die feinste und die unangenehmeste: das Umsonst hat
   ein Füßchen im Bezahlten; die Function, welche gratis läuft, braucht
   den Storage, welcher Cents kostet, und zwar nicht als Ausnahme,
   sondern als Bedingung — der kleine wahre Preis des großen Schein-
   Geschenks, die Apanage, welche das freie Amt vom Amtsinhaber zieht.
   Man wird nicht behaupten können, dies sei Betrug (die Cents sind
   genannt), aber man wird es die ehrlichste Kleinigkeit dieser Wolke
   nennen dürfen: sie lehrt, daß es kein absolut Umsonstiges gibt,
   sondern nur ein Umsonst, das an einem kleinen Bezahlt hängt — die
   Aufhebung der Rechnung ist selbst eine Rechnung, wenn auch die
   kleinste.

4. 12-Monats-Services (B1S/B2ats-VMs, SQL 250 GB) laufen nach Ablauf
   **kostenpflichtig weiter** — Terraform stoppt nichts automatisch; End-Datum
   im Code als Kommentar/Kommentar-Review pflegen.
   Die vierte wiederholt die große Zeitwarnung des Kontingent-Kapitels
   in der Sprache des Begriffs und fügt die wichtigste Zutat hinzu:
   der Code weiß nichts von der Frist. Die Formel, welche die VM setzte,
   enthält ihr Ende nicht — das Ende ist eine Bestimmung, welche der
   Kalender des Anbieters hat, nicht der Text des Nutzers —, und darum
   kann die Formel nicht erinnern, was sie nicht weiß; die Empfehlung,
   das End-Datum als Kommentar zu pflegen, ist also mehr als Stil: sie
   ist die einzige Weise, die Zeitlichkeit des Anbieters in die
   Gedächtnislosigkeit des Codes einzutragen, ein handschriftlicher
   Zusatz im gedruckten Buche, der einzige Kalender, welchen das Buch
   hat, ist der des Lesers, welcher ihn hineinschrieb.

5. Immer über die Free-SKUs provisionieren: Standard-Defaults (z. B. S1 App
   Service) erzeugen sofort Rechnungen.
   Die letzte Lehre ist die Summe: der Default ist kostbar, das Freie
   ist ein Anspruch; wem dies einmal begriffen ist, dem ist das ganze
   Verhältnis begriffen, und die vier Lehren zuvor sind nur die
   Einzelheiten dieser Einen — Azure als die Wolke, in welcher das
   Umsonst kein Zustand, sondern eine Kunstfertigkeit ist, geübt in
   Zeichen und Fristen, und die Meisterschaft besteht darin, die Zeichen
   immer zu setzen und die Fristen immer zu stellen.

## Quellen

- Provider: <https://registry.terraform.io/providers/hashicorp/azurerm/latest>
- Free Services anlegen: <https://learn.microsoft.com/azure/cost-management-billing/manage/create-free-services>

## Vermittelte Verhältnisse

Wie jedes TERRAFORM-Dokument dieser Sammlung ist auch dieses die Mitte
zwischen [FREE-TIER.md](FREE-TIER.md) (den Gaben) und [README.md](README.md)
(den Ausweisen); nach außen verweist es auf die Geschwister der Gattung:
[../aws/TERRAFORM.md](../aws/TERRAFORM.md) für die Wolke der Credits,
[../gcp/TERRAFORM.md](../gcp/TERRAFORM.md) für die Wolke der drei Häfen,
und, für die Kleinern Verwandten, auf [../supabase/TERRAFORM.md](../supabase/TERRAFORM.md)
— welches das Postgres-Moment derselben Substanz in kleinerem Maßstabe
aufführt. Der Kreis, den diese Verweise beschreiben, ist kein Irrgarten,
sondern die Einrichtung selbst: jede Seite setzt voraus, was die andre
lehrt, und das Ganze ist nur, wenn alle gelesen sind — auch das eine
Formel des Wahren als des Ganzen, hier in das Praktische eines
Kreuzlesens übersetzt.
