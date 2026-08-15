# Redis Cloud + Terraform

> Official provider `RedisLabs/rediscloud` (Redis nIteb ra'). Essentials 'ej Pro
> cover — 'ach **Free-wejmaH-MB-plan — Sonderfall**: creation — console via easiest;
> ghIq `terraform import` via qem.

## Provider-setup

```hcl
terraform {
  required_providers {
    rediscloud = {
      source  = "RedisLabs/rediscloud"
      version = "~> 2.0"
    }
  }
}

provider "rediscloud" {
  api_key    = var.redis_api_key    # env: REDISCLOUD_ACCESS_KEY
  secret_key = var.redis_secret_key # env: REDISCLOUD_SECRET_KEY
  # Keys: Redis Cloud Console → Account Settings → API Keys
}
```

## Resources-mapping

| object | Terraform-resource |
|---|---|
| Essentials-subscription (Free je) | `rediscloud_essentials_subscription` |
| Essentials-database | `rediscloud_essentials_database` |
| Essentials-plans (legh) | `data.rediscloud_essentials_plan` |
| Pro-subscription | `rediscloud_subscription` (+ `rediscloud_database`) |
| payment-method (legh) | `data.rediscloud_payment_method` |

## Example: Essentials-plan yIlegh

```hcl
# Essentials-plans (size/region/provider) tu'lu'bogh — yIlegh:
data "rediscloud_essentials_plan" "plan" {
  name           = "Single-Zone_30MB" # Free-plan; names tu'lu'bogh — API via yIlegh
  cloud_provider = "AWS"
  region         = "us-west-1"
}

output "plan_id" {
  value = data.rediscloud_essentials_plan.plan.id
}
```

Free-subscription — console-Daq chenmoH 'ej import:

```bash
terraform import rediscloud_essentials_subscription.free sub-xxxxxxxxxxxx
```

## Gotchas

1. **Free-plan — TF-Daq fussy:** `rediscloud_essentials_subscription` —
   payment-method-ID (data-source) 'ut, usually; free-wejmaH-MB-plan: console+import
   — stress-free path.
2. Auth — **API-key + secret**, console-vo' ('ut — login-credentials 'oHbe').
3. Essentials-databases — single-instance, HA Hutlh — FREE-TIER.md Gotchas
   (wa'vatlh ops/lup, wejmaH connections) — TF via je apply.
4. Pro-resources (`rediscloud_subscription`) — **real costs** qaSmoHlaH —
   free-context-Daq yIqIpQo'.

## Sources

- Provider: <https://registry.terraform.io/providers/RedisLabs/rediscloud/latest>
- TF-guide: <https://redis.io/docs/latest/integrate/terraform-provider-for-redis-cloud/>
