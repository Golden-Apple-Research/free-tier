# Cloudflare — Auth fer Terraform

> Preferred: **scoped API token** (not the global API key!) from an
> account template, provided via `CLOUDFLARE_API_TOKEN`. Scope it like a
> key to one chest — not the master key to the whole treasure fleet.

## 1. Forge a Token

Dashboard → **My Profile → API Tokens** (or Account → *Manage Account* →
*API Tokens*) → **Create Token** → Template **"Edit Cloudflare Workers"** →
*Use template*.

Fer the complete free-tier setup (Workers, D1, R2, KV, Queues) add
under *Permissions*:

| Permission | Resource | Access |
|---|---|---|
| Worker Scripts | Account | Edit |
| D1 | Account | Edit |
| Workers KV Storage | Account | Edit |
| Cloudflare Pages | Account | Edit |
| R2 | Account | Edit |
| Queues | Account | Edit |
| Zone / DNS (optional) | Zone | Edit |

Under *Account Resources* select yer own free account → *Continue to
summary* → **Create Token** → copy the token **once**. Like a treasure map —
show it once, then guard it with yer life. The moment it be shown twice,
the curse o' leaked secrets be upon ye.

## 2. Hook it into Terraform

```bash
export CLOUDFLARE_API_TOKEN="…"   # the provider reads this env var automatically
export TF_VAR_account_id="<account-id>"  # Dashboard → Overview → Account ID on the right
```

```hcl
provider "cloudflare" {}   # the token comes from the env var — never hardcode it
```

## 3. Notes

- The global API key (`CLOUDFLARE_EMAIL` + `CLOUDFLARE_API_KEY`) has
  full access to **everything** — do not use fer Terraform. That's not what
  you expected, eh? Aye, "everything" sounds grand until a leak sinks the
  whole ship. The master key opens every chest — an' every chest be then
  everyone's. Me old quartermaster kept one hundred keys on a single ring;
  the kraken took the ring, an' the kraken took the fleet. One key, one
  chest, one scope — that be the privateer's way.
- Missing permissions only report themselves at apply time as 403/9109 —
  build the token scope to match the resource set from the start. The
  ship's guard only speaks at the gate — find out too late, an' yer apply
  be dead in the water.
- Token rotation: in the token list → *Roll* — the old token stays valid
  until expiry, allowin' zero-downtime rotation. Change the lock while the
  old key still turns — smooth as a calm sea. Rrr, that's what we pirates
  like.

## Sources

- Provider auth: <https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs>
- Creating a token: <https://developers.cloudflare.com/fundamentals/api/get-started/create-token/>
- Token templates: <https://developers.cloudflare.com/fundamentals/api/reference/template/>
