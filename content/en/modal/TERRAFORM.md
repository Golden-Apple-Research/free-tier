# Modal + Terraform

> ⚠️ **No official Modal provider.** Only an early community provider
> (`deevus/modal`, 0.2.x) exists, managing account objects
> (environments, secrets, volumes, dicts, queues) — **not** apps/functions.
> The idiomatic "IaC" fer Modal be the Python SDK itself. No official
> chartmaker — the free maps come from friendly fellow pirates. Aye, an'
> like all charts drawn by brethern hands: kind, useful, an' to be checked
> against yer own spyglass 'afore ye trust yer hull to 'em.

## Option 1: Community Provider (Account Objects)

```hcl
terraform {
  required_providers {
    modal = {
      source  = "deevus/modal"
      version = "~> 0.2"
    }
  }
}

provider "modal" {} # Auth via env: MODAL_TOKEN_ID / MODAL_TOKEN_SECRET
```

Manageable: `modal_secret`, `modal_volume`, `modal_queue`, `modal_dict`,
environments. Typical use case: hand out secrets/volumes from the TF
ecosystem; the app definition stays in Python. (Argument schemas be
early/maturing — check the registry docs before use.) The provider minds
the stores; the app stays the Python crew's own craft.

## Option 2: Python SDK as IaC (recommended path)

Modal apps, functions, images an' schedulers be defined **in the Python
code** an' rolled out with `modal deploy` — functionally equivalent to
Terraform (declarative + diff apply). Same map, drawn in a different hand:

```python
import modal

app = modal.App("my-free-app")

@app.function(
    image=modal.Image.debian_slim().pip_install("requests"),
    secrets=[modal.Secret.from_name("api-keys")],  # managed in the Modal account
    schedule=modal.Period(hours=6),                # cron-like
)
def task():
    ...
```

```bash
modal secret create api-keys OPENAI_API_KEY=sk-...
modal deploy app.py
```

## Gotchas

1. The community provider be young (few downloads) — assess it critically
   fer productive use; the official Modal recommendation be the SDK. A
   dinghy what few have sailed — inspect her timbers before ye trust the
   cargo to her.
2. `$30/month credits` apply account-wide — regardless o' whether deployed
   via TF or Python; monitor consumption via `modal app logs`/metrics.
   The month's ration be shared by the whole fleet, whichever ship ye sail
   — watch the stores like a quartermaster.
3. Mixed operation TF + Python SDK be unproblematic as long as TF only
   owns account objects (secrets/volumes) an' the Modal app belongs to the
   SDK. Two quartermasters, one cargo — as long as each minds his own
   ledger, no mutiny. Rrr, that's what we pirates like.
4. Also mind the deployed-app limits (200 apps, 5 crons on Starter).
   That's not what you expected, eh? Aye — the free bounty has its bounds:
   two hundred ships on station, five bells a-ringin', an' no more.

## Sources

- Community provider: <https://registry.terraform.io/providers/deevus/modal>
- Modal IaC with Python: <https://modal.com/docs/guide>
