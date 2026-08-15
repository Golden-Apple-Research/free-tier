# Modal + Terraform

> ⚠️ **Official Modal-provider tu'lu'be'.** Early community-provider neH
> (`deevus/modal`, 0.2.x) — account-objects ra' (environments, peghmey,
> volumes, dicts, queues) — apps/functions **ra'be'**. Idiomatic "IaC" vaD
> Modal — Python-SDK 'oH.

## DuH 1: community-provider (account-objects)

```hcl
terraform {
  required_providers {
    modal = {
      source  = "deevus/modal"
      version = "~> 0.2"
    }
  }
}

provider "modal" {} # Auth: env via — MODAL_TOKEN_ID / MODAL_TOKEN_SECRET
```

Manageable: `modal_secret`, `modal_volume`, `modal_queue`, `modal_dict`,
environments. Typical use-case: peghmey/volumes — TF-ecosystem-vo' noblu';
app-definition — Python-Daq taH. (Argument-schemas — early/maturing; lo'pa'
registry-Docs yIlegh.)

## DuH 2: Python-SDK as IaC (QaQ way)

Modal-apps, functions, images, schedulers — **Python-code-Daq** defined;
`modal deploy` via qIHlu'. Functionally — Terraform rur (declarative +
diff-apply):

```python
import modal

app = modal.App("my-free-app")

@app.function(
    image=modal.Image.debian_slim().pip_install("requests"),
    secrets=[modal.Secret.from_name("api-keys")],  # Modal-account-Daq ra'lu'
    schedule=modal.Period(hours=6),                # cron-rur
)
def task():
    ...
```

```bash
modal secret create api-keys OPENAI_API_KEY=sk-...
modal deploy app.py
```

## Gotchas

1. Community-provider — young ('op downloads). Production vaD — critical yIlegh.
   Official Modal-recommendation — SDK 'oH.
2. `$30/Hoch jar Huch` — account-Hoch. TF pagh Python — deploy-lu'chugh je.
   Usage — `modal app logs`/metrics via yIlegh.
3. TF + Python-SDK mixed — Qagh Hutlh, chugh: TF — account-objects neH
   (peghmey/volumes) ghaj 'ej modal-app — SDK-Daj.
4. Deployed-app-limits (cha'vatlh apps, vagh crons, Starter-Daq) — yIqIm.

## Sources

- Community-provider: <https://registry.terraform.io/providers/deevus/modal>
- Modal IaC with Python: <https://modal.com/docs/guide>
