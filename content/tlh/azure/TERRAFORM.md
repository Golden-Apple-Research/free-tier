# Azure + Terraform

> Official provider `hashicorp/azurerm`. Always-Free offers — special
> attributes/SKUs via lo'laH (Cosmos-`free_tier_enabled`, functions-consumption
> `Y1`, app-service `F1`); default **'oHbe'**.

## Provider-setup

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
  # Auth: az login (CLI) pagh ARM_* Env-Vars / Client-Secret
}
```

## Resources-mapping (Always Free)

| Free-Tier-service | Terraform-resource |
|---|---|
| Cosmos DB Free Tier (wa'SaD RU/s + cha'maH vagh GB) | `azurerm_cosmosdb_account` — `free_tier_enabled = true` |
| Functions (wa'maH bIp executions) | `azurerm_service_plan` SKU `Y1` + `azurerm_linux_function_app` |
| App Service F1 (wa'maH apps) | `azurerm_service_plan` SKU `F1` + `azurerm_linux_web_app` |
| Static Web Apps Free | `azurerm_static_site` |
| AKS free-tier management | `azurerm_kubernetes_cluster` — `sku_tier = "Free"` |
| Entra ID Free | (TF-resource 'utbe' — tenant-feature) |

## Example: Cosmos DB Free Tier + Static Web App

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
  free_tier_enabled   = true # wa'SaD RU/s + cha'maH vagh GB reH — wa' subscription-Daq wa' neH!

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
  name                = "free-static-demo" # Free-SKU — default
  resource_group_name = azurerm_resource_group.rg.name
  location            = "westeurope"
}
```

## Gotchas

1. `free_tier_enabled = true` — **wa' subscription-Daq wa' neH** Qap;
   cha'DIch cosmos-account, flag ghajbogh — Qagh.
2. `azurerm_function_app` — deprecated (azurerm 4.x); DaH —
   `azurerm_linux_function_app` / `azurerm_windows_function_app` yIlo'.
3. consumption-functions — storage-account je 'ut (`azurerm_storage_account`) —
   Huch mach neH (cents).
4. wa'maH cha'-jar-services (B1S/B2ats-VMs, SQL cha'vatlh vaghmaH GB) — mev qaSpu'DI' **taH 'ej
   Huch 'ut** — Terraform pagh nIteb mevmoH; end-date — code-Daq
   comment/comment-review yIqon.
5. reH free-SKUs provision; standard-defaults (e.g. S1 app-service) — DaH
   Huchmey chenmoH.

## Sources

- Provider: <https://registry.terraform.io/providers/hashicorp/azurerm/latest>
- Free services create: <https://learn.microsoft.com/azure/cost-management-billing/manage/create-free-services>
