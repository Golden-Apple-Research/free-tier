# Cloudflare + Terraform

> Official provider `cloudflare/cloudflare` (v5). Free-Plan complete (Workers,
> D1, R2, KV, Queues, Pages) — Terraform via provision-lu'laH. **v5 —
> resources law' renamed** — tutorials ngo', v4-names
> (`cloudflare_worker_script`), Qapbe'.

## Provider-setup

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

## Resources-mapping (Workers Free Plan)

| Free-Tier-service | Terraform-resource (v5) |
|---|---|
| Worker | `cloudflare_workers_script` (wa'bIp tlhobmey/jaj) |
| D1-database | `cloudflare_d1_database` (vagh GB total) |
| R2-bucket | `cloudflare_r2_bucket` (wa'maH GB, egress Huch Hutlh) |
| KV-namespace | `cloudflare_workers_kv_namespace` + `cloudflare_workers_kv` |
| Queue | `cloudflare_queue` |
| Pages-Qu' | `cloudflare_pages_project` (+ `cloudflare_pages_domain`) |
| Turnstile / Access / Tunnel | `cloudflare_turnstile_widget`, `cloudflare_access_application`, `cloudflare_tunnel` |

## Example: worker + D1 + R2 + KV

```hcl
variable "account_id" { type = string }

resource "cloudflare_workers_script" "api" {
  account_id         = var.account_id
  name               = "free-api"
  content            = file("dist/worker.js")
  compatibility_date = "2026-08-01"
  # Bindings (D1/R2/KV/peghmey/Cron) — bindings-block-Daq config-lu';
  # v5-syntax — registry-Docs-Daq yIlegh.
}

resource "cloudflare_d1_database" "main" {
  account_id = var.account_id
  name       = "app-db" # vagh'uy' reads + wa'bIp writes/jaj — Huch Hutlh
}

resource "cloudflare_r2_bucket" "assets" {
  account_id = var.account_id
  name       = "assets" # 10 GB/jar, egress 0 $
}

resource "cloudflare_workers_kv_namespace" "cache" {
  account_id = var.account_id
  title      = "cache" # wa'bIp reads + wa'SaD writes/jaj, wa' GB storage
}
```

## Gotchas

1. **v4→v5-renames:** `cloudflare_worker_script` → `cloudflare_workers_script`;
   KV-namespace — `title` 'oH, `name` Hutlh. guides ngo'-vo'
   copy-paste-chugh — resource-name yIqIm!
2. R2 — wa' poH, dashboard-Daq, "activate" 'ut — qaSpa' API (vaj Terraform)
   buckets chenmoHlaH.
3. wa'bIp-tlhobmey/jaj — account-Hoch, workers Hoch qaStaHvIS.
   `workers_script`-resources law' — yIqel.
4. peghmey — plaintext-bindings rur reHbe' commit. `cloudflare_workers_secret`
   pagh `wrangler secret put` yIlo'; TF-Daq — reference neH.
5. Free-limits — Hoch jaj 00:00 UTC-Daq choHqa'lu'. Daily-quota monitoring/alerting —
   GraphQL-API via Qap.

## Sources

- Provider: <https://registry.terraform.io/providers/cloudflare/cloudflare/latest>
- Workers Pricing: <https://developers.cloudflare.com/workers/platform/pricing/>
