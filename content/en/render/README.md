# Render — Auth fer Terraform

> Preferred: **API key** from the account settings, provided via
> `RENDER_API_KEY` + `RENDER_OWNER_ID` (workspace ID). Two pieces o' the
> map — the key an' the harbor number — an' both be needed to find the
> treasure.

## 1. Forge an API Key

Render Dashboard → **Account Settings** (<https://dashboard.render.com/u/settings>)
→ *API Keys* → **Create API Key** → name (e.g. `terraform`) → copy the key once.
Stow it below decks, out o' reach o' the crew's prying eyes.

## 2. Find the Owner ID

The provider additionally needs the **workspace/owner ID**:
Dashboard → Workspace → *Team & Members* or Settings (or API:
`GET /v1/owners` → "List Workspaces" → `id` o' the target workspace).
Every fleet has its number — write it beside the key on the same chart.

## 3. Hook it into Terraform

```bash
export RENDER_API_KEY="rnd_…"
export RENDER_OWNER_ID="tev-…"   # alias: usr-… for solo workspaces
```

```hcl
provider "render" {}   # reads both env vars automatically
```

## 4. Notes

- The key applies to **all workspaces o' the account** — no workspace scoping;
  store it accordingly safely. A master key to every harbor under the flag
  — guard it like the cap'n's own seal.
- API keys don't **expire** automatically; CLI tokens (via `render login`) do —
  so fer CI take an API key, fer local work possibly the CLI. The iron key
  never rusts; the paper pass fades with the moon.
- `RENDER_OWNER_ID` wrong → typical 403/404 at the first apply —
  check the ID again against the workspace list. That's not what you
  expected, eh? Aye, a wrong map leads to a wrong island — an' the harbor
  master waves ye off with a 403.
- Free services can't be created via TF (see TERRAFORM.md) —
  the key only really becomes needed from Starter plans on. The free fleet
  be built by hand; the key comes out when the paid ships be commissioned.
  Until then, let it sleep in the vault like the good silver — a key what
  guards naught be a key what can't be lost.

## Sources

- Provider: <https://registry.terraform.io/providers/render-oss/render/latest/docs>
- API keys: <https://render.com/docs/api>
