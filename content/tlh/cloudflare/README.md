# Cloudflare — Auth vaD Terraform

> **Scoped API token** (global API key Qo'!) — account-template-vo';
> `CLOUDFLARE_API_TOKEN` via noblu'.

## 1. token yIchenmoH

Dashboard → **My Profile → API Tokens** (pagh Account → *Manage Account* →
*API Tokens*) → **Create Token** → template **"Edit Cloudflare Workers"** →
*Use template*.

Free-Tier-setup Hoch (Workers, D1, R2, KV, Queues) vaD — *Permissions*-Daq
yIchel:

| Permission | Resource | Access |
|---|---|---|
| Worker Scripts | Account | Edit |
| D1 | Account | Edit |
| Workers KV Storage | Account | Edit |
| Cloudflare Pages | Account | Edit |
| R2 | Account | Edit |
| Queues | Account | Edit |
| Zone / DNS (optional) | Zone | Edit |

*Account Resources*-Daq accountlIj (Free) yIwIv → *Continue to summary* →
**Create Token** → token — wa' poH neH copy.

## 2. Terraform-Daq Qum

```bash
export CLOUDFLARE_API_TOKEN="…"   # provider — Env-Var vam nIteb laD
export TF_VAR_account_id="<account-id>"  # Dashboard → Overview → right: Account ID
```

```hcl
provider "cloudflare" {}   # token — Env-Var-vo' (pagh hardcode)
```

## 3. yIqIm!

- Global API key (`CLOUDFLARE_EMAIL` + `CLOUDFLARE_API_KEY`) — Hoch access.
  Terraform vaD yIlo'Qo'.
- Permissions Hutlh — apply-poH neH 403/9109 jange'. token-scope —
  resource-set pab, wa'DIch-vo', yIchenmoH.
- Token-rotation: token-list-Daq → *Roll* — token ngo' — mevpa' Qap;
  zero-downtime-rotation 'oH.

## Sources

- Provider-auth: <https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs>
- Token erstellen: <https://developers.cloudflare.com/fundamentals/api/get-started/create-token/>
- Token-Templates: <https://developers.cloudflare.com/fundamentals/api/reference/template/>
