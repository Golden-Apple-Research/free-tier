# Render — Auth vaD Terraform

> **API Key** — account-settings-vo'; `RENDER_API_KEY` + `RENDER_OWNER_ID`
> (workspace-ID) via noblu'.

## 1. API-key yIchenmoH

Render Dashboard → **Account Settings** (<https://dashboard.render.com/u/settings>)
→ *API Keys* → **Create API Key** → name (e.g. `terraform`) → key — wa' poH
neH yIcopy.

## 2. Owner-ID yIlegh

Provider — **workspace-/owner-ID** 'ut latlh: Dashboard → Workspace →
*Team & Members* pagh Settings (pagh API: `GET /v1/owners` → "List Workspaces"
→ target-workspace `id`).

## 3. Terraform-Daq Qum

```bash
export RENDER_API_KEY="rnd_…"
export RENDER_OWNER_ID="tev-…"   # alias: usr-… — solo-workspaces
```

```hcl
provider "render" {}   # Env-Vars cha' — nIteb laD
```

## 4. yIqIm!

- Key — **Hoch workspaces**, account-Daq — workspace-scoping Hutlh — vaj
  safely yIqan.
- API-keys — **nIteb mevbe'**; CLI-tokens (`render login` via) — mev. CI vaD:
  API-key yIlo'; local: CLI.
- `RENDER_OWNER_ID` Qagh-chugh — apply wa'DIch-Daq 403/404 typical — ID —
  workspace-list-Daq yIleghqa'.
- services Huch Hutlh — TF via chenmoHlu'laHbe' (TERRAFORM.md yIlaD); key —
  starter-plans-vo' neH 'ut.

## Sources

- Provider: <https://registry.terraform.io/providers/render-oss/render/latest/docs>
- API-keys: <https://render.com/docs/api>
