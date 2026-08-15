# Example 4: Medusa-Shop — Terranix + NixOS (Hetzner, Cloudflare, Supabase, Keycloak, CircleCI, Grafana Cloud, Stripe)

> paq vamvo' Qu' tInqu' — 'ej wa'DIch, HCL Hutlh: **Terranix** —
> Terraform-code, Nix-modules-vo', chenmoH. Hetzner-VPS — **nixos-infect** via —
> nIteb NixOS boot, 'ej MedusaJS, Keycloak, Postgres, Redis, Caddy — qem.
> CircleCI — shop, GitHub-repo (hypothetical) -vo', deploy;
> Google/Facebook-login — Keycloak via, OIDC-broker (Medusa-RBAC rur);
> cha' storefronts — Cloudflare-workers-Daq qet; pay — Stripe via;
> monitoring — Grafana Cloud via.

## Architecture

```
                          ┌──────────────── Cloudflare ────────────────┐
Google/Facebook ─┐        │  shop.example.com  ──▶ Worker storefront-b2c│
  (Social Login) │        │  b2b.example.com   ──▶ Worker storefront-b2b│
                 ▼        └─────────────────────────────────────────────┘
        ┌─────────────────┐         ▲ Wrangler-deploy — CircleCI-vo'
        │     Keycloak    │         │
        │  (OIDC-Broker)  │         │   ┌────────── CircleCI (Free) ──────────┐
        └────────┬────────┘         │   │ deploy-nixos   → nixos-rebuild ssh  │
                 │ JDBC             │   │ deploy-medusa  → rsync/npm/migrate  │
                 ▼                  │   │ deploy-storefronts → wrangler ×2    │
        ┌─────────────────┐         │   │ configure-monitoring → alloy creds │
        │ Supabase Postgres│  ←─────┼───│ Context „medusa-shop" [TF-Phase 1]  │
        │ (Free, eu-central)│       │   └─────────────────────────────────────┘
        └─────────────────┘         │
        ┌──────────────── Hetzner VPS (CX22, NixOS) ────────────────────┐
        │ Caddy ─ api.example.com ─▶ MedusaJS :9000 ─▶ PG + Redis (lokal)│
        │       └ auth.example.com ─▶ Keycloak :8080 ─▶ Supabase (oben) │
        │ Alloy ─ metrics/journal ─▶ Grafana Cloud (Free)               │
        └───────────────────────────────────────────────────────────────┘
                 Stripe ◀── webhooks/plugin — /etc/medusa.env-vo' (CI)
```

## qatlh cha' Terranix-phases?

| phase | state | nuq tu'lu' pa'Daq | ghorgh qetlaH? |
|---|---|---|---|
| 1 `infra` | `tf/infra/` | VPS, DNS, worker-placeholders, Supabase, CircleCI-context, Grafana-stack | DaH |
| 2 `keycloak` | `tf/keycloak/` | realm, roles, OIDC-clients, Google/Facebook-IdP | `https://auth.<domain>` jange'DI' neH (~vagh tup — phase 1 qaSpu'DI'; nixos-infect-bootstrap) |

Keycloak-provider — server, qettaHbogh, 'ut — vaj states nIteb,
`-target`-acrobatics Hutlh.

## files

| file | role |
|---|---|
| `flake.nix` | Terranix-entry: `nix run .#apply-infra` / `.#apply-keycloak` |
| `config.nix` | phase 1 (Hetzner, Cloudflare, Supabase, CircleCI, Grafana) |
| `config-keycloak.nix` | phase 2 (realm, RBAC-roles, OIDC-clients, social-IdPs) |
| `nixos/configuration.nix` | **shop-repo-Daq** tu'lu'; nixos-infect — raw-URL via, laD |
| `.circleci/config.yml` | **shop-repo-Daq** tu'lu'; loS deploy-jobs |

## nuq 'ut (Auth)

| Env-Var / `TF_VAR_` | nuqDaq | yIghoS |
|---|---|---|
| `HCLOUD_TOKEN` | Hetzner Console → Security → API Tokens | hetzner.com/docs (Huch Hutlh tu'lu'be'!) |
| `CLOUDFLARE_API_TOKEN` | My Profile → API Tokens | [cloudflare/README.md](../../content/tlh/cloudflare/README.md) |
| `SUPABASE_ACCESS_TOKEN` | Account → Access Tokens | [supabase/README.md](../../content/tlh/supabase/README.md) |
| `GRAFANA_CLOUD_ACCESS_POLICY_TOKEN` | Cloud-Portal → Access Policies | [grafana/README.md](../../content/tlh/grafana/README.md) |
| `TF_VAR_circleci_api_key` (+ `circleci_org_id`) | User Settings → Personal API Tokens | [circle-ci/README.md](../../content/tlh/circle-ci/README.md) |
| `TF_VAR_supabase_org_id`, `TF_VAR_root_domain`, … | variable-blocks — `config.nix`-Daq yIlaD | — |

## yIqet

```bash
cd examples/04-medusa-shop

# 1) VPS yIchenmoH (NixOS-bootstrap ≈ 5 min; ghIq Caddy — Let's-Encrypt-certificates qem):
nix run .#apply-infra

# 2) https://auth.example.com jange'DI' — vaj realm yIchenmoH:
nix run .#apply-keycloak

# 3) client-secret (Medusa vaD) — CircleCI-context-Daq yIqon (wa' poH, CLI —
#    context — phase 1 -Daj; deliberately — cha'DIch TF-way tu'lu'be'):
circleci context store-env-var <org-slug> medusa-shop \
    MEDUSA_KEYCLOAK_CLIENT_SECRET "$(nix run .#tf-keycloak >/dev/null 2>&1; \
    terraform -chdir=tf/keycloak output -raw medusa_backend_client_secret)"
circleci context store-env-var <org-slug> medusa-shop MEDUSA_KEYCLOAK_CLIENT_ID medusa-backend

# 4) Google/Facebook-apps yIchenmoH (redirect-URLs — config-keycloak.nix yIlegh),
#    ghIq: git push → CircleCI — latlh Hoch ra'.
```

Stripe: `STRIPE_API_KEY`/`STRIPE_WEBHOOK_SECRET` — TF-managed context-Daq;
`deploy-medusa` — `/etc/medusa.env`-Daq, VPS-Daq, qon. Medusa-stripe-plugin
(medusa-plugin-stripe, shop-repo-Daq) — pa'Daq laD.

## RBAC-harmonization: Keycloak ↔ MedusaJS

1. **Roles-alignment:** realm-roles `medusa-admin`, `medusa-member`,
   `storefront-customer` (phase 2) — Medusa user-roles (`admin`/`member`) 'ej
   customer-domain — rur.
2. **Claim-mapping:** `user_realm_role`-protocol-mapper — roles, claim
   `medusa_role` rur, access-/ID-tokens 'ej userinfo-Daq — 'ach
   backend-client-tokens neH (`medusa-backend`).
3. **Plugin-side:** `medusa-plugin-auth` (shop-repo-Daq) — generic
   OIDC-provider, `output.oidc_issuer`-Daq, config; `medusa_role` laD;
   Medusa-lo'wI'pu', role vetlh, chenmoH/choH. Storefront-customers — public
   `storefront`-client (cha' workers') 'ej default-role `storefront-customer` via.
4. **Broker — direct-call Hutlh:** Google/Facebook — Keycloak-Daq neH qonlu'.
   Tokens — shop-wide consistent (wa' issuer, wa' logout, wa' role-source) —
   admin 'ej storefront, Google-clients-chaj, ra'be'.

## Huch Hutlh-reality (honesty-table)

| service | status | note |
|---|---|---|
| Hetzner CX22 | ❌ paid | ~€4.30/Hoch jar (IPv4 je) — Huch Hutlh tu'lu'be' |
| Cloudflare Workers | ✅ Huch Hutlh | wa'bIp req/jaj — account-Hoch ([FREE-TIER.md](../../content/tlh/cloudflare/FREE-TIER.md)) |
| Supabase | ✅ Huch Hutlh | yIqIm: **cha' Qu'** neH — Hoch org; examples 1+3 — cha' je occupied-laH |
| Keycloak OSS | ✅ Huch Hutlh | self-hosted — VPS-Daq |
| MedusaJS | ✅ OSS | self-hosted; license — usage-fee Hutlh |
| CircleCI | ✅ Huch Hutlh | wejnetlh Huch ≈ javSaD tup ([FREE-TIER.md](../../content/tlh/circle-ci/FREE-TIER.md)) |
| Grafana Cloud | ✅ Huch Hutlh | wa'netlh series, vaghmaH GB logs ([FREE-TIER.md](../../content/tlh/grafana/FREE-TIER.md)) |
| Stripe | ⚠️ usage-based | base-price Hutlh; ~1.5% + €0.25 — EU-card-payment Hoch |

## Gotchas

1. **peghmey — `user_data`-Daq:** bootstrap-passwords — cloud-init-Daq; vaj
   Terraform-state-Daq **'ej** Hetzner-API via laDlu'laH. Demo vaD QaQ —
   production: CI/secret-store neH (e.g. `sops-nix`). Passwords — strictly
   alphanumeric (cloud-init/psql/URL-safe).
2. **Supabase direct-host — IPv6 neH:** `db.<ref>.supabase.co` — AAAA neH
   resolve. Hetzner-VPS — IPv6 ghaj; local test (laptop, WLAN, IPv6 Hutlh) —
   Qagh. Alternative: session-pooler (port 5432, host
   `aws-0-eu-central-1.pooler.supabase.com`) — 'ach IPv4-quota yIqIm
   (supabase/FREE-TIER.md).
3. **Supabase-autopause:** free-Qu'mey — Soch jaj lo'be'taHvIS, mev.
   Keycloak-JDBC-traffic — activity qelmeH — guaranteed Hutlh. cron-ping pagh
   Qu' mach yIqan; Hutlhchugh — login mev.
4. **`initialAdminPassword` — temporary:** phase 2 — initial-password via jol;
   Keycloak — wa'DIch login — choH 'e' nej. Demo vaD QaQ. Production:
   phase 2 qaSpa' — permanent admin, `kcadm.sh` via, yIchenmoH; TF-provider
   pa'Daq ghoS.
5. **Worker-drift — expected:** Terranix — placeholder-scripts neH chenmoH;
   Wrangler — overwrite. `lifecycle.ignore_changes = [content]` — plan clean.
   Script, TF-Daq ra'meHbogh — remove 'ut.
6. **nixos-infect — infection by design:** script — Debian, qettaHbogh,
   NixOS-Daq, replace. Snapshots qaSpa' — useless (infect qaSpu'DI' — Hoch
   choH); cleaner alternative — repeatability vaD: NixOS-image-lIj upload pagh
   `nixos-anywhere`.
7. **cha' States = `terraform.tfstate` cha':** `tf/infra/`-Daq 'ej
   `tf/keycloak/`-Daq — cha' yIqan (backend!); destroy — reverse order.
8. **CircleCI free — resource-class machqu':** `npm ci && build` — shop-Daq —
   wejnetlh Huch QIHlaH. Build-cache yIlo'.

## cleanup

```bash
nix run .#destroy-keycloak   # realm QIH (VPS — qet 'ut!)
nix run .#destroy-infra      # VPS, DNS, worker, Supabase, context — QIH
```

⚠️ `destroy-infra` — Supabase-**content** QIH (Keycloak-realms, lo'wI'pu') 'ej
CircleCI-context. Job, pa'Daq ghoSbogh, Hoch — ghIq Qagh. Medusa-De' —
VPS-Daq; VPS qaSpu'DI' — QIH je.

## Sources

- Terranix: <https://terranix.org> · repository <https://github.com/terranix/terranix>
- hcloud-provider: <https://registry.terraform.io/providers/hetznercloud/hcloud>
- nixos-infect: <https://github.com/elitak/nixos-infect>
- NixOS-options: <https://search.nixos.org/options> (services.keycloak, services.alloy, services.caddy)
- Keycloak-provider: <https://registry.terraform.io/providers/keycloak/keycloak>
- Cloudflare Workers (Terraform): <https://registry.terraform.io/providers/cloudflare/cloudflare>
- MedusaJS: <https://docs.medusajs.com> · medusa-plugin-auth: <https://github.com/Fodoj/medusa-plugin-auth>
- Keycloak as broker (Google): <https://www.keycloak.org/docs/latest/server_admin/#google>
