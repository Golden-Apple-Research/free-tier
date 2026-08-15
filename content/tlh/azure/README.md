# Azure — Auth vaD Terraform

> **`az login` (CLI)** — local vaD; **Service Principal** (Client-Secret pagh
> OIDC) — CI vaD. azurerm-provider — `ARM_*` Env-Vars Hoch nIteb laD.

## 1. credential yIchenmoH

**DuH A — Azure CLI (QaQ, local):**

```bash
az login                 # browser-login — interactive
az account set --subscription "<subscription-id>"
```

**DuH B — Service Principal (CI):**

```bash
az ad sp create-for-rbac --name "tf-free-tier" \
  --role Contributor \
  --scopes /subscriptions/<subscription-id>
```

`appId` (Client-ID), `password` (Secret) 'ej `tenant` nob.

**DuH C — CI, Secret Hutlh:** federated credentials (OIDC) — e.g. GitHub
Actions via `azure/login` — Client-ID + Tenant-ID + Subscription-ID.

## 2. Terraform-Daq Qum

```bash
export ARM_CLIENT_ID="<appId>"
export ARM_CLIENT_SECRET="<password>"   # DuH B neH
export ARM_TENANT_ID="<tenant>"
export ARM_SUBSCRIPTION_ID="<subscription-id>"
# DuH A (az login): pagh yIexportQo'
```

```hcl
provider "azurerm" {
  features {}
}
```

## 3. yIqIm!

- `az login` — ARM_*-Vars qaSpa' vorrang ghaj. cha' lo'Qo' — Qagh. CI-Daq
  reH Service-Principal yIlo'.
- wejmaH jaj credit qaSpu'DI' — subscription "deactivated" chenmoHlu';
  TF-applies — Qagh. wa'maH cha'-jar-services — latlh poH yIlegh.
- Client-peghmey mev (standard jav–wa'maH loS jar). mevpoH — calendar-Daq
  yIqon, pagh OIDC yIlo'.

## Sources

- Provider-auth: <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#authenticating-to-azure>
- Service Principal: <https://learn.microsoft.com/azure/developer/terraform/authenticate-to-azure>
