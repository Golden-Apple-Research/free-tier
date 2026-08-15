# Redis Cloud + Terraform

> Official provider `RedisLabs/rediscloud` (maintained by Redis itself).
> Covers Essentials an' Pro — but the **free 30-MB plan be the special case**:
> easiest to create via the console, then adopt via `terraform import`. The
> free wee barrel be best forged by hand an' then brought under code's wing.

## Provider Setup

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

## Resource Mapping

| Object | Terraform resource |
|---|---|
| Essentials subscription (incl. free) | `rediscloud_essentials_subscription` |
| Essentials database | `rediscloud_essentials_database` |
| Essentials plans (read) | `data.rediscloud_essentials_plan` |
| Pro subscription | `rediscloud_subscription` (+ `rediscloud_database`) |
| Payment method (read) | `data.rediscloud_payment_method` |

## Example: Look Up an Essentials Plan

Consult the plan charts before ye commission anything:

```hcl
# look up the available Essentials plans (size/region/provider):
data "rediscloud_essentials_plan" "plan" {
  name           = "Single-Zone_30MB" # free plan; check the available names via the API
  cloud_provider = "AWS"
  region         = "us-west-1"
}

output "plan_id" {
  value = data.rediscloud_essentials_plan.plan.id
}
```

Create the free subscription in the console an' import it — the free ship
be launched by hand, then taken into the fleet registry:

```bash
terraform import rediscloud_essentials_subscription.free sub-xxxxxxxxxxxx
```

## Gotchas

1. **The free plan via TF be finicky:** `rediscloud_essentials_subscription`
   usually expects a payment-method ID (data source) — fer the free
   30-MB plan, the console+import path be the stress-free one. Code wants
   papers o' payment even fer the free barrel — so skip the scribe an'
   forge it by hand. That's not what you expected, eh? Aye, the free chest
   be easier opened by hand than by script.
2. Auth needs **API key + secret** from the console (not the login creds).
   The key pair, not the cap'n's password — different locks, different keys.
3. Essentials databases be single-instance without HA — the gotchas from
   FREE-TIER.md (100 ops/s, 30 connections) also apply via TF. The free
   ship be single-hulled, code or no code — the limits sail with her.
4. Pro resources (`rediscloud_subscription`) can trigger **real costs** —
   don't touch 'em in a free context. Rrr, that's what we pirates like —
   free loot only, thank ye kindly. The paid hold be chained; keep yer
   hands off the lock.

## Sources

- Provider: <https://registry.terraform.io/providers/RedisLabs/rediscloud/latest>
- TF guide: <https://redis.io/docs/latest/integrate/terraform-provider-for-redis-cloud/>
