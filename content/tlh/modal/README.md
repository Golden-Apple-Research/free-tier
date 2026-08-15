# Modal — Auth vaD Terraform ('ej SDK)

> **Token-pair (Token-ID + Secret)** — community-provider 'ej Python-SDK vaD
> identical: `MODAL_TOKEN_ID` + `MODAL_TOKEN_SECRET` pagh `~/.modal.toml` via.

## 1. token yIchenmoH

**DuH A — CLI (QaQ):**

```bash
pip install modal
modal token new    # browser-login poSmoH; token — ~/.modal.toml-Daq — qon
```

**DuH B — Dashboard:**
<https://modal.com/settings> → **API Tokens** → *Workspace Secret* pagh
*User Token* yIchenmoH → `ak-…` (ID) + `as-…` (Secret) — wa' poH neH yIcopy.

## 2. Terraform-Daq Qum

```bash
export MODAL_TOKEN_ID="ak-…"
export MODAL_TOKEN_SECRET="as-…"   # ~/.modal.toml Dung
```

```hcl
provider "modal" {}   # community-provider Env-Vars cha' laD
```

idiomatic IaC (Python-SDK) — Env-Vars rap lo'lu':

```bash
modal deploy app.py   # token-pair rap via auth
```

## 3. yIqIm!

- **Workspace-peghmey** (`Secret-…`) — org-wide; CI vaD QaQ. **User-tokens** —
  machines-lIj neH vaD.
- Modal 0.56-vo' — **pair** `MODAL_TOKEN_ID`/`MODAL_TOKEN_SECRET` tu'lu'. guides
  ngo', wa' `MODAL_TOKEN`-var ghajbogh — ngo' 'oH; silently Qapbe'.
- `~/.modal.toml`-Daq token reHbe' commit (repo-vo' latlh; 'ach .dotfiles-setups
  yIlegh).
- Community-provider — account-objects neH ra' (peghmey, volumes, queues,
  dicts). Apps/functions — SDK via qet (TERRAFORM.md yIlaD).

## Sources

- Token-CLI: <https://modal.com/docs/cli/latest/token>
- Config/auth-reference: <https://modal.com/docs/sdk/py/latest/config>
