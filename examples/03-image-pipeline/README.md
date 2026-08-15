# Example 3: Image Pipeline (Supabase + Modal + CircleCI)

> A serverless processing pipeline as hybrid IaC: Terraform provisions the
> Supabase database and the CircleCI deploy context and distributes **all
> credentials** in them — the Modal function itself is deployed,
> idiomatically, via the Python SDK from CI (cf.
> ../../content/de/modal/TERRAFORM.md).

## Architecture

```
git push ─▶ CircleCI (Free: 30k credits ≈ 6,000 min/month)
              │  Context "image-pipeline" [managed by TF]
              │   MODAL_TOKEN_ID/SECRET · SUPABASE_URL · SERVICE_ROLE_KEY
              ├─▶ modal deploy app.py
              │        │
              │        ▼
              │   Modal (Free: $30 credits/month)  ── make_thumbnail()
              │        │  Secret "supabase"
              │        ▼
              └─▶ Supabase (Free, eu-central-1)   ── table "thumbnails"
```

**Division of roles:** Terraform = infrastructure + credential broker ·
Python SDK = app definition · CircleCI = deploy pipeline.

## Prerequisites (Auth)

| Env var / TF var | Source | Instructions |
|---|---|---|
| `SUPABASE_ACCESS_TOKEN` | Dashboard → Account → Tokens | [../../content/de/supabase/README.md](../../content/de/supabase/README.md) |
| `TF_VAR_supabase_org_id` | Dashboard URL `/org/<slug>/…` | — |
| `TF_VAR_circleci_api_key` | User Settings → Personal API Tokens | [../../content/de/circle-ci/README.md](../../content/de/circle-ci/README.md) |
| `TF_VAR_circleci_org_id` | Org Settings → Overview → Organization ID | — |
| `TF_VAR_modal_token_id` / `_secret` | `modal token new` (workspace secret for CI) | [../../content/de/modal/README.md](../../content/de/modal/README.md) |

## Running

```bash
cd examples/03-image-pipeline
terraform init && terraform apply

# 1) Fill the Modal secret from the TF outputs (one-time):
modal secret create supabase \
    SUPABASE_URL=$(terraform output -raw supabase_url) \
    SUPABASE_SERVICE_ROLE_KEY=$(terraform output -raw supabase_service_role_key)

# 2) Create the table (Supabase SQL editor):
#    create table thumbnails (
#      id bigint generated always as identity primary key,
#      source_url text, width int, height int, bytes int,
#      created_at timestamptz default now()
#    );

# 3) Test locally or deploy via git push CI:
modal run app.py --url https://picsum.photos/1200/900
```

For this, the repo (with `app.py` + `.circleci/config.yml`) must be on
GitHub and followed in CircleCI as a project.

## What this example shows

- **Terraform as credential broker:** no secret is maintained manually in
  CI — rotation = feed in new values, `terraform apply`, done.
- **Know TF's limits:** Modal apps belong to the SDK; TF only manages the
  account level around them (recommendation from modal/TERRAFORM.md). The
  deevus community provider would be an option for secrets/volumes —
  check its schema status there before using it in production.
- **Write-only values:** `circleci_context_environment_variable.value` is
  not readable via the API after being set; the provider stores only a
  hash in the state (details: circle-ci/README.md).

## Free tier notes

- **Supabase Free:** 2 active projects (examples 1 + 3 = both slots
  taken!), pause after 7 days of inactivity.
- **Modal:** $30/month credits account-wide — image builds and CPU seconds
  add up there; watch consumption via `modal app logs`.
- **CircleCI Free:** 30k credits ≈ 6,000 min/month (smallest Docker
  resource class only) — the deploy job is comfortably budgeted at
  ~1–2 min.

## Cleanup

```bash
terraform destroy   # deletes the Supabase project + CircleCI context (no more CI secrets!)
modal app stop image-pipeline && modal app list   # clean up the Modal app separately
```

⚠️ `terraform destroy` also removes the CircleCI context — every job that
references it fails afterwards. Modal apps are independent of TF and must
be stopped/deleted separately.
