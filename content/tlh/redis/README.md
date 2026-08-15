# Redis Cloud — Auth vaD Terraform

> **API Key + Secret Key** — pair, Redis-Cloud-console-vo';
> `REDISCLOUD_ACCESS_KEY` / `REDISCLOUD_SECRET_KEY` via noblu'.

## 1. keys yIchenmoH

Redis Cloud Console (<https://cloud.redis.io>) → account, top-right →
**Account settings → API keys** (tab) → **Generate new keys** →
*API Account Key* + *API Account Secret* — wa' poH neH yIcopy 'ej safely yIqan.

## 2. Terraform-Daq Qum

```bash
export REDISCLOUD_ACCESS_KEY="<api-key>"
export REDISCLOUD_SECRET_KEY="<secret>"
```

```hcl
provider "rediscloud" {}   # Env-Vars cha' — nIteb laD
```

## 3. yIqIm!

- Secret — **generation-poH neH** leghlu'; lost-chugh: keys yIQIH 'ej
  yIchenmoHqa'.
- API-keys ≠ console-login: **full account-rights** — API-account-Daq
  (paid Pro-subscriptions chenmoHlaH je). nob — people/CI-systems 'ut neH.
- Paid-features (Pro-subscriptions) — keys rap via reachable;
  Free-Tier-Qu'mey-Daq IaC-reviews — `rediscloud_subscription`-Daq yIqIm.
- wejmaH-MB-Free-Plan — still: console-creation + `terraform import`
  (TERRAFORM.md yIlaD).

## Sources

- API-keys: <https://redis.io/docs/latest/operate/rc/api/how-to/create-keys/>
- Provider: <https://registry.terraform.io/providers/RedisLabs/rediscloud/latest>
