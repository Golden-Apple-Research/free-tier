# Azure — Auth fer Terraform

> Preferred: **`az login` (CLI)** locally, **service principal** (client secret
> or better OIDC) fer CI. The azurerm provider reads everything from
> `ARM_*` environment variables — like a first mate what knows all the
> secret handshakes already.

## 1. Plunder a Credential

**Option A — Azure CLI (recommended, local):**

```bash
az login                 # interactive browser login
az account set --subscription "<subscription-id>"
```

The easiest o' all — click a link in the browser, an' yer aboard. No
copyin' secrets, no guardin' keys; the login just happens, like the tide.

**Option B — Service principal (CI):**

```bash
az ad sp create-for-rbac --name "tf-free-tier" \
  --role Contributor \
  --scopes /subscriptions/<subscription-id>
```

Delivers `appId` (client ID), `password` (secret) an' `tenant` — the
ship's papers fer a robotic crew member. Issue 'em once, stow 'em safe.

**Option C — CI without a secret:** federated credentials (OIDC), e.g.
GitHub Actions via `azure/login` with client ID + tenant ID + subscription ID.
No secret to guard — just like buryin' treasure without a map, because
there be no treasure to bury at all. The machines vouch fer each other,
an' no password ever crosses the plank.

## 2. Hook it into Terraform

```bash
export ARM_CLIENT_ID="<appId>"
export ARM_CLIENT_SECRET="<password>"   # only for option B
export ARM_TENANT_ID="<tenant>"
export ARM_SUBSCRIPTION_ID="<subscription-id>"
# For option A (az login): export nothing
```

```hcl
provider "azurerm" {
  features {}
}
```

## 3. Notes

- `az login` takes precedence over any ARM_* vars: whoever mixes both,
  surprises himself. In CI always set the service principal. Two captains
  on one ship be a recipe fer mutiny — pick one an' stick to it.
- After the 30-day starting credit expires, the subscription be set to
  "disabled" — TF applies then run into errors; monitor the remaining life
  o' the 12-month services separately. That's not what you expected, eh?
  Aye, the free grog lasts but 30 days; after that, the taps run dry.
- Client secrets expire (default 6–24 months) — note the expiry in the
  calendar or use OIDC. And ye bloody landrat really thought ye had to pay
  fer it? Nay — the free loot be real, but only fer the first 30 days. Mark
  the calendar like ye'd mark a treasure map: X marks the expiry.

> *Old salt's tale:* Mary Read, the sharpest blade in these waters, kept a
> calendar carved into her cabin door — every secret, every charter, every
> free trial scratched in with her cutlass, each with its own X. "The secret
> what expires unmarked," she'd say, "be the one what costs ye the leg."
> She retired with both legs, three ships, an' a parrot what recites TTLs.
> Be like Mary, matey.

## Sources

- Provider auth: <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#authenticating-to-azure>
- Service principal: <https://learn.microsoft.com/azure/developer/terraform/authenticate-to-azure>
