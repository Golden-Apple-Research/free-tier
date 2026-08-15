# Redis Cloud — Auth fer Terraform

> Preferred: **API key + secret key** pair from the Redis Cloud Console,
> provided via `REDISCLOUD_ACCESS_KEY` / `REDISCLOUD_SECRET_KEY`. Two keys
> to one chest — the lock needs both, an' both must be guarded.

## 1. Forge the Keys

Redis Cloud Console (<https://cloud.redis.io>) → account top right →
**Account settings → API keys** (tab) → **Generate new keys** →
copy *API Account Key* + *API Account Secret* once an' stow 'em safely.
Shown but the once — after that, they live only in the vault.

## 2. Hook it into Terraform

```bash
export REDISCLOUD_ACCESS_KEY="<api-key>"
export REDISCLOUD_SECRET_KEY="<secret>"
```

```hcl
provider "rediscloud" {}   # reads both env vars automatically
```

## 3. Notes

- The secret be shown **only at generation** — lost = delete the keys
  an' generate anew. The chest opens but the once; lose the sight o' the
  key, an' ye must forge a new pair. Aye, an' keep the two keys in two
  separate pockets, like any sensible smuggler — one pickpocket at the
  tavern should never get the whole lock.
- API keys ≠ console login: they have **full account rights** on the API
  account, incl. creating paid Pro subscriptions. Only hand 'em to the
  most necessary people/CI systems. Dead men tell no tales, an' leaked
  keys tell tales o' yer whole treasure — one loose key, an' someone
  commissions a paid warship in yer name.
- Paid features (Pro subscriptions) be reachable with the same keys —
  in free-tier projects, watch IaC reviews fer `rediscloud_subscription`.
  The same key that opens the free barrel also opens the paid hold —
  keep yer hands off the second.
- Fer the 30-MB free plan, the rule stays: create in console + `terraform import`
  (see TERRAFORM.md). Rrr, that's what we pirates like — but the free
  database be born by hand an' adopted by code.

## Sources

- API keys: <https://redis.io/docs/latest/operate/rc/api/how-to/create-keys/>
- Provider: <https://registry.terraform.io/providers/RedisLabs/rediscloud/latest>
