# Cloudflare + Terraform

> Official provider `cloudflare/cloudflare` (v5). The entire Free Plan
> (Workers, D1, R2, KV, Queues, Pages) be provisionable via Terraform.
> **v5 renamed many resources** — old tutorials with v4 names
> (`cloudflare_worker_script`) no longer work. The old charts be obsolete;
> sail by the new stars. An' the whole edge fleet — every last sloop o'
> it — be free o' charge, which suits a penniless privateer right down to
> the keel.

## Provider Setup

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

## Resource Mapping (Workers Free Plan)

The free fleet, resource by resource:

| Free-tier service | Terraform resource (v5) |
|---|---|
| Worker | `cloudflare_workers_script` (100 k requests/day) |
| D1 database | `cloudflare_d1_database` (5 GB total) |
| R2 bucket | `cloudflare_r2_bucket` (10 GB, free egress) |
| KV namespace | `cloudflare_workers_kv_namespace` + `cloudflare_workers_kv` |
| Queue | `cloudflare_queue` |
| Pages project | `cloudflare_pages_project` (+ `cloudflare_pages_domain`) |
| Turnstile / Access / Tunnel | `cloudflare_turnstile_widget`, `cloudflare_access_application`, `cloudflare_tunnel` |

## Example: Worker + D1 + R2 + KV

The full free stack, all at once — worker, database, cargo hold an' flag
locker, declared in one go:

```hcl
variable "account_id" { type = string }

resource "cloudflare_workers_script" "api" {
  account_id         = var.account_id
  name               = "free-api"
  content            = file("dist/worker.js")
  compatibility_date = "2026-08-01"
  # Bindings (D1/R2/KV/Secrets/Cron) go in the bindings block —
  # check the v5 syntax in the registry docs.
}

resource "cloudflare_d1_database" "main" {
  account_id = var.account_id
  name       = "app-db" # 5M reads + 100k writes/day free
}

resource "cloudflare_r2_bucket" "assets" {
  account_id = var.account_id
  name       = "assets" # 10 GB/month, egress $0
}

resource "cloudflare_workers_kv_namespace" "cache" {
  account_id = var.account_id
  title      = "cache" # 100k reads + 1k writes/day, 1 GB storage
}
```

## Gotchas

1. **v4→v5 renames:** `cloudflare_worker_script` → `cloudflare_workers_script`,
   the KV namespace still uses `title`, not `name`. When copy-pastin' from
   old guides, mind the resource names. A name what be wrong be a ship what
   sails to the wrong island.
2. **R2 must be "activated" once in the dashboard** before the API
   (an' therefore Terraform) can create buckets. One ceremonial keel-layin'
   in the dashboard, an' the hold opens to the API. The Crown — er, the
   cloud — insists on one courtesy call afore the plunder begins; 'tis only
   proper manners, even among thieves.
3. The 100-k requests/day apply **account-wide** across all workers —
   plan accordingly with several `workers_script` resources. Rrr, that's
   what we pirates like — but the daily barrel be shared by the whole crew,
   so count every swig.
4. Never commit secrets as plaintext `bindings`: use `cloudflare_workers_secret`
   or `wrangler secret put` and only reference 'em in TF. A secret written
   in plaintext be a treasure map printed in the gazette — everyone reads it.
5. Free limits reset daily at 00:00 UTC — monitor/alert the daily quotas
   via the GraphQL API. That's not what you expected, eh? Aye, the chest
   refills at midnight, so keep watch — an' don't empty it before noon.

## Sources

- Provider: <https://registry.terraform.io/providers/cloudflare/cloudflare/latest>
- Workers pricing: <https://developers.cloudflare.com/workers/platform/pricing/>
