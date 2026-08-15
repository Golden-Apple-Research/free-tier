# Azure + Terraform

> Official provider `hashicorp/azurerm`. The Always-Free offers be reachable
> via special attributes/SKUs (Cosmos `free_tier_enabled`, Functions
> Consumption `Y1`, App Service `F1`); they be **not** the default. Like a
> treasure that hides unless ye know the secret password — speak the magic
> words, an' the free chest swings open.

## Provider Setup

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
  # Auth: az login (CLI) or ARM_* environment variables / client secret
}
```

## Resource Mapping (Always Free)

The free bounty, mapped to its Terraform twin:

| Free-tier service | Terraform resource |
|---|---|
| Cosmos DB free tier (1,000 RU/s + 25 GB) | `azurerm_cosmosdb_account` with `free_tier_enabled = true` |
| Functions (1 Mio. executions) | `azurerm_service_plan` SKU `Y1` + `azurerm_linux_function_app` |
| App Service F1 (10 apps) | `azurerm_service_plan` SKU `F1` + `azurerm_linux_web_app` |
| Static Web Apps free | `azurerm_static_site` |
| AKS free-tier management | `azurerm_kubernetes_cluster` with `sku_tier = "Free"` |
| Entra ID free | (no TF resource needed — tenant feature) |

## Example: Cosmos DB Free Tier + Static Web App

A database that stores forever free, an' a static site hoisted beside it —
the classic pirate pairing, like rum an' a loaded pistol: one keeps the
ledger, one shows the flag, an' neither costs a farthing.

```hcl
resource "azurerm_resource_group" "rg" {
  name     = "free-rg"
  location = "germanywestcentral"
}

resource "azurerm_cosmosdb_account" "db" {
  name                = "free-cosmos-demo" # globally unique
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  free_tier_enabled   = true # 1,000 RU/s + 25 GB for life — only 1x per subscription!

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
  name                = "free-static-demo" # Free SKU is the default
  resource_group_name = azurerm_resource_group.rg.name
  location            = "westeurope"
}
```

## Gotchas

1. `free_tier_enabled = true` works **only once per subscription** —
   the second Cosmos account with the flag fails. Rrr, that's what we pirates
   like — but only once, so make it count. One free Cosmos per crew, an'
   no second helpin's. Greed sank more ships than the Navy ever did: the
   bosun what tries `free_tier_enabled` a second time gets a cannonball
   named `Conflict`, an' no amount o' grog will sweeten it.
2. `azurerm_function_app` be deprecated (azurerm 4.x) — the current resources
   be `azurerm_linux_function_app` / `azurerm_windows_function_app`. The old
   names be sunken wrecks; sail with the new charts.
3. Consumption functions additionally need a storage account
   (`azurerm_storage_account`) — that one costs a wee bit o' money (~cents).
   A few copper coins fer the dockmaster — the price o' anchorage.
4. 12-month services (B1S/B2ats VMs, SQL 250 GB) keep running **paid** after
   expiry — Terraform stops nothing automatically; keep the end date in the
   code as a comment/comment review. That's not what you expected, eh? Aye,
   the free year ends, an' the ship sails on — burnin' coin with every wave
   unless ye scuttle it yerself.
5. Always provision via the free SKUs: standard defaults (e.g. S1 App
   Service) generate invoices immediately. And ye bloody landrat really
   thought ye had to pay fer it? Nay — the free SKUs be there, ye just have
   to use 'em. The free flag flies only when ye raise it yerself.

## Sources

- Provider: <https://registry.terraform.io/providers/hashicorp/azurerm/latest>
- Creating free services: <https://learn.microsoft.com/azure/cost-management-billing/manage/create-free-services>
