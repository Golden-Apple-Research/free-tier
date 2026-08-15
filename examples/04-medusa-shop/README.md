# Example 4: Medusa Shop with Terranix + NixOS (Hetzner, Cloudflare, Supabase, Keycloak, CircleCI, Grafana Cloud, Stripe)

> The most complex example in the repo — and the first without HCL:
> **Terranix** generates the Terraform code from Nix modules. A Hetzner VPS
> boots itself into NixOS via **nixos-infect** and, on top of that, runs
> MedusaJS, Keycloak, Postgres, Redis and Caddy. CircleCI deploys the shop
> from a (hypothetical) GitHub repo, Google/Facebook login runs through
> Keycloak as an OIDC broker (harmonized with Medusa RBAC), two storefronts
> run on Cloudflare Workers, payment via Stripe, monitoring via Grafana
> Cloud.

## Architecture

```
                          ┌──────────────── Cloudflare ────────────────┐
Google/Facebook ─┐        │  shop.example.com  ──▶ Worker storefront-b2c│
  (social login) │        │  b2b.example.com   ──▶ Worker storefront-b2b│
                 ▼        └─────────────────────────────────────────────┘
        ┌─────────────────┐         ▲ Wrangler deploy from CircleCI
        │     Keycloak    │         │
        │  (OIDC broker)  │         │   ┌────────── CircleCI (Free) ──────────┐
        └────────┬────────┘         │   │ deploy-nixos   → nixos-rebuild ssh  │
                 │ JDBC             │   │ deploy-medusa  → rsync/npm/migrate  │
                 ▼                  │   │ deploy-storefronts → wrangler ×2    │
        ┌─────────────────┐         │   │ configure-monitoring → alloy creds │
        │ Supabase Postgres│  ←─────┼───│ Context "medusa-shop" [TF phase 1]  │
        │ (Free, eu-central)│       │   └─────────────────────────────────────┘
        └─────────────────┘         │
        ┌──────────────── Hetzner VPS (CX22, NixOS) ────────────────────┐
        │ Caddy ─ api.example.com ─▶ MedusaJS :9000 ─▶ PG + Redis (local)│
        │       └ auth.example.com ─▶ Keycloak :8080 ─▶ Supabase (above)│
        │ Alloy ─ metrics/journal ─▶ Grafana Cloud (Free)               │
        └───────────────────────────────────────────────────────────────┘
                 Stripe ◀── webhooks/plugin from /etc/medusa.env (CI)
```

## Why two Terranix phases?

| Phase | State | Contents | Runnable when? |
|---|---|---|---|
| 1 `infra` | `tf/infra/` | VPS, DNS, worker placeholders, Supabase, CircleCI context, Grafana stack | immediately |
| 2 `keycloak` | `tf/keycloak/` | Realm, roles, OIDC clients, Google/Facebook IdPs | only once `https://auth.<domain>` responds (~5 min after phase 1 — nixos-infect bootstrap) |

The Keycloak provider needs the running server — hence separate states
instead of `-target` acrobatics.

## Files

| File | Role |
|---|---|
| `flake.nix` | Terranix entry point: `nix run .#apply-infra` / `.#apply-keycloak` |
| `config.nix` | Phase 1 (Hetzner, Cloudflare, Supabase, CircleCI, Grafana) |
| `config-keycloak.nix` | Phase 2 (realm, RBAC roles, OIDC clients, social IdPs) |
| `nixos/configuration.nix` | lives **in the shop repo**; nixos-infect fetches it via raw URL |
| `.circleci/config.yml` | lives **in the shop repo**; four deploy jobs |

## Prerequisites (Auth)

| Env var / `TF_VAR_` | Source | Instructions |
|---|---|---|
| `HCLOUD_TOKEN` | Hetzner Console → Security → API Tokens | hetzner.com/docs (no free tier!) |
| `CLOUDFLARE_API_TOKEN` | My Profile → API Tokens | [../../content/de/cloudflare/README.md](../../content/de/cloudflare/README.md) |
| `SUPABASE_ACCESS_TOKEN` | Account → Access Tokens | [../../content/de/supabase/README.md](../../content/de/supabase/README.md) |
| `GRAFANA_CLOUD_ACCESS_POLICY_TOKEN` | Cloud-Portal → Access Policies | [../../content/de/grafana/README.md](../../content/de/grafana/README.md) |
| `TF_VAR_circleci_api_key` (+ `circleci_org_id`) | User Settings → Personal API Tokens | [../../content/de/circle-ci/README.md](../../content/de/circle-ci/README.md) |
| `TF_VAR_supabase_org_id`, `TF_VAR_root_domain`, … | see the variable blocks in `config.nix` | — |

## Running

```bash
cd examples/04-medusa-shop

# 1) Build the VPS (NixOS bootstrap ≈ 5 min, then Caddy fetches the Let's Encrypt certificates):
nix run .#apply-infra

# 2) Wait until https://auth.example.com is reachable, then set up the realm:
nix run .#apply-keycloak

# 3) Put the Medusa client secret into the CircleCI context (one-time, CLI —
#    the context belongs to phase 1, hence deliberately no second TF path):
circleci context store-env-var <org-slug> medusa-shop \
    MEDUSA_KEYCLOAK_CLIENT_SECRET "$(nix run .#tf-keycloak >/dev/null 2>&1; \
    terraform -chdir=tf/keycloak output -raw medusa_backend_client_secret)"
circleci context store-env-var <org-slug> medusa-shop MEDUSA_KEYCLOAK_CLIENT_ID medusa-backend

# 4) Create the Google/Facebook apps (redirect URLs: see config-keycloak.nix),
#    then: git push → CircleCI takes over the rest.
```

Stripe: `STRIPE_API_KEY`/`STRIPE_WEBHOOK_SECRET` live in the TF-managed
context; `deploy-medusa` writes them to `/etc/medusa.env` on the VPS — the
Medusa Stripe plugin (medusa-plugin-stripe, in the shop repo) reads them
there.

## RBAC harmonization: Keycloak ↔ MedusaJS

1. **Role alignment:** the realm roles `medusa-admin`, `medusa-member` and
   `storefront-customer` (phase 2) mirror Medusa's user roles
   (`admin`/`member`) and the customer domain respectively.
2. **Claim mapping:** a `user_realm_role` protocol mapper packs the roles
   into access/ID tokens and the userinfo as the claim `medusa_role` — but
   only into tokens of the backend client (`medusa-backend`).
3. **Plugin side:** `medusa-plugin-auth` (in the shop repo) configures the
   generic OIDC provider to `output.oidc_issuer`, reads `medusa_role` and
   creates/updates Medusa users with exactly that role. Storefront
   customers run through the public `storefront` client (both workers) and
   the default role `storefront-customer`.
4. **Broker instead of direct calls:** Google/Facebook are registered
   **only** in Keycloak — tokens stay consistent across the whole shop
   (one issuer, one logout, one source of roles), instead of admin and
   storefront each maintaining their own Google clients.

## Free tier reality (honesty table)

| Service | Status | Note |
|---|---|---|
| Hetzner CX22 | ❌ paid | ~€4.30/month (incl. IPv4) — no free tier |
| Cloudflare Workers | ✅ Free | 100k req/day account-wide ([FREE-TIER.md](../../content/de/cloudflare/FREE-TIER.md)) |
| Supabase | ✅ Free | note: only **2 projects** per org — examples 1+3 may already occupy both |
| Keycloak OSS | ✅ Free | self-hosted on the VPS |
| MedusaJS | ✅ OSS | self-hosted, license without usage fees |
| CircleCI | ✅ Free | 30k credits ≈ 6,000 min ([FREE-TIER.md](../../content/de/circle-ci/FREE-TIER.md)) |
| Grafana Cloud | ✅ Free | 10k series, 50 GB logs ([FREE-TIER.md](../../content/de/grafana/FREE-TIER.md)) |
| Stripe | ⚠️ usage-based | no base fee, ~1.5% + €0.25 per EU card payment |

## Gotchas

1. **Secrets in `user_data`:** the bootstrap passwords sit in the
   cloud-init and therefore in the Terraform state **and** are readable
   via the Hetzner API. Fine for the demo — in production: CI/secret
   store only (e.g. `sops-nix`). Hence keep the passwords strictly
   alphanumeric (cloud-init/psql/URL-safe).
2. **The Supabase direct host is IPv6-only:** `db.<ref>.supabase.co`
   resolves to AAAA only. Hetzner VPSes have IPv6 — testing locally
   (laptop on Wi-Fi without IPv6) fails. Alternative: the session pooler
   (port 5432, host `aws-0-eu-central-1.pooler.supabase.com`), but then
   watch the IPv4 quota (supabase/FREE-TIER.md).
3. **Supabase autopause:** free projects pause after 7 days of
   "inactivity" — whether Keycloak JDBC traffic counts as activity is not
   guaranteed. A cron ping or keeping a little current flowing through
   the project; otherwise the login stalls.
4. **`initialAdminPassword` is temporary:** phase 2 logs in with the
   initial password, which Keycloak wants changed on first login. Leave
   it as is for the demo; in production, create a permanent admin via
   `kcadm.sh` before phase 2 and point the TF provider at it.
5. **Worker drift is factored in:** Terranix only creates placeholder
   scripts; Wrangler overwrites them. `lifecycle.ignore_changes =
   [content]` keeps the plan clean — remove it if you do want to manage
   the script in TF.
6. **nixos-infect = infection by design:** the script replaces the
   running Debian with NixOS. Snapshots beforehand are pointless (after
   the infect everything is different); the cleaner alternative for
   reproducibility: upload your own NixOS image or use `nixos-anywhere`.
7. **Two states = two `terraform.tfstate` files:** in `tf/infra/` and
   `tf/keycloak/` — back up both (use a backend!), destroy in reverse
   order.
8. **CircleCI free = smallest resource class:** the shop's
   `npm ci && build` can eat into the 30k credits noticeably; use the
   build cache.

## Cleanup

```bash
nix run .#destroy-keycloak   # realm gone (the VPS must still be running for this!)
nix run .#destroy-infra      # VPS, DNS, workers, Supabase, context gone
```

⚠️ `destroy-infra` deletes the Supabase **contents** (Keycloak realms,
users) and the CircleCI context — every job that references the context
fails afterwards. Medusa data lives on the VPS and disappears with it.

## Sources

- Terranix: <https://terranix.org> · repository <https://github.com/terranix/terranix>
- hcloud provider: <https://registry.terraform.io/providers/hetznercloud/hcloud>
- nixos-infect: <https://github.com/elitak/nixos-infect>
- NixOS options: <https://search.nixos.org/options> (services.keycloak, services.alloy, services.caddy)
- Keycloak provider: <https://registry.terraform.io/providers/keycloak/keycloak>
- Cloudflare Workers (Terraform): <https://registry.terraform.io/providers/cloudflare/cloudflare>
- MedusaJS: <https://docs.medusajs.com> · medusa-plugin-auth: <https://github.com/Fodoj/medusa-plugin-auth>
- Keycloak as broker (Google): <https://www.keycloak.org/docs/latest/server_admin/#google>
