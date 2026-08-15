# Modal — Auth fer Terraform (or SDK)

> Preferred: **token pair (token ID + secret)** — fer the community provider
> an' the Python SDK identically via `MODAL_TOKEN_ID` + `MODAL_TOKEN_SECRET`
> or `~/.modal.toml`. Two halves o' one key — the lock needs both, an'
> both must be kept from prying hands.

## 1. Forge a Token

**Option A — CLI (recommended):**

```bash
pip install modal
modal token new    # opens the browser login and writes the token to ~/.modal.toml
```

The easiest o' all — the CLI opens the browser, ye nod, an' the token
buries itself in `~/.modal.toml` like a message in a bottle.

**Option B — Dashboard:**
<https://modal.com/settings> → **API Tokens** → create *Workspace Secret* or
*User Token* → copy `ak-…` (ID) + `as-…` (secret) once. Shown but the
once — scribe 'em into the vault, not onto a sticky note.

## 2. Hook it into Terraform

```bash
export MODAL_TOKEN_ID="ak-…"
export MODAL_TOKEN_SECRET="as-…"   # takes precedence over ~/.modal.toml
```

```hcl
provider "modal" {}   # the community provider reads both env vars
```

Fer the idiomatic IaC (Python SDK), the same env vars apply — the same
papers work fer both ships:

```bash
modal deploy app.py   # authenticates with the same token pair
```

## 3. Notes

- **Workspace secrets** (`Secret-…`) apply org-wide an' suit CI;
  **user tokens** only fer personal machines. The fleet seal vs. the
  single sailor's mark — choose by the voyage.
- Since Modal 0.56 there be the **pair** `MODAL_TOKEN_ID`/`MODAL_TOKEN_SECRET` —
  old guides with a single `MODAL_TOKEN` variable be outdated an' fail
  silently. That's not what you expected, eh? Aye — the old single key be
  sunken, an' the ship sails on with the pair. Old charts, old keys — no
  good.
- Don't commit tokens in `~/.modal.toml` (it sits outside the repo,
  but check dotfiles setups). Even the cabin boy's sea chest gets searched
  when the repo be public — keep the token out o' the cargo manifest.
- The community provider only manages account objects (secrets, volumes,
  queues, dicts) — apps/functions run via the SDK (see TERRAFORM.md).
  The provider keeps the stores; the SDK sails the ships. Rrr, that's what
  we pirates like — each tool to its own duty, an' no cabin boy does the
  bosun's job twice.

## Sources

- Token CLI: <https://modal.com/docs/cli/latest/token>
- Config/auth reference: <https://modal.com/docs/sdk/py/latest/config>
