# Example 3: Image-Pipeline (Supabase + Modal + CircleCI)

> Serverless processing-pipeline — hybrid-IaC: Terraform — Supabase-database
> 'ej CircleCI-deploy-context — provision; **credentials Hoch** pa'Daq ngeH.
> Modal-function — CI-vo', Python-SDK via, idiomatic deploy (../../content/tlh/modal/TERRAFORM.md yIlaD).

## Architecture

```
git push ─▶ CircleCI (Free: Huch 30k ≈ 6,000 min/Hoch jar)
              │  Context "image-pipeline" [TF ra']
              │   MODAL_TOKEN_ID/SECRET · SUPABASE_URL · SERVICE_ROLE_KEY
              ├─▶ modal deploy app.py
              │        │
              │        ▼
              │   Modal (Free: Huch $30/Hoch jar)  ── make_thumbnail()
              │        │  Secret "supabase"
              │        ▼
              └─▶ Supabase (Free, eu-central-1)   ── table "thumbnails"
```

**Role-split:** Terraform = infrastructure + credential-broker · Python-SDK =
app-definition · CircleCI = deploy-pipeline.

## nuq 'ut (Auth)

| Env-Var / Var | nuqDaq | yIghoS |
|---|---|---|
| `SUPABASE_ACCESS_TOKEN` | Dashboard → Account → Tokens | [supabase/README.md](../../content/tlh/supabase/README.md) |
| `TF_VAR_supabase_org_id` | Dashboard-URL `/org/<slug>/…` | — |
| `TF_VAR_circleci_api_key` | User Settings → Personal API Tokens | [circle-ci/README.md](../../content/tlh/circle-ci/README.md) |
| `TF_VAR_circleci_org_id` | Org Settings → Overview → Organization ID | — |
| `TF_VAR_modal_token_id` / `_secret` | `modal token new` (workspace-secret, CI vaD) | [modal/README.md](../../content/tlh/modal/README.md) |

## yIqet

```bash
cd examples/03-image-pipeline
terraform init && terraform apply

# 1) Modal-secret, TF-outputs-vo', yIchenmoH (wa' poH neH):
modal secret create supabase \
    SUPABASE_URL=$(terraform output -raw supabase_url) \
    SUPABASE_SERVICE_ROLE_KEY=$(terraform output -raw supabase_service_role_key)

# 2) table yIchenmoH (Supabase SQL-editor):
#    create table thumbnails (
#      id bigint generated always as identity primary key,
#      source_url text, width int, height int, bytes int,
#      created_at timestamptz default now()
#    );

# 3) local test pagh git push via CI deploy:
modal run app.py --url https://picsum.photos/1200/900
```

repo (`app.py` + `.circleci/config.yml`) — GitHub-Daq tu'lu' 'ut 'ej
CircleCI-Daq Qu'-Daq pab 'ut.

## nuq example vam leghmoH

- **Terraform — credential-broker:** secret, CI-Daq, manually — reHbe' ra'lu'.
  Rotation: values chu' yIqon; `terraform apply` — Qap.
- **TF boundary — yIghoj:** Modal-apps — SDK-Daq. TF — account-level neH ra'
  (recommendation — modal/TERRAFORM.md). deevus-community-provider —
  peghmey/volumes vaD DuH; schema-status pa'Daq yIlegh — production lo'pa'.
- **values qon-neH:** `circleci_context_environment_variable.value` — set
  qaSpu'DI', API via, laDlu'laHbe'. Provider — hash neH state-Daq qon
  (details: circle-ci/README.md).

## Huch Hutlh notes

- **Supabase Free:** cha' Qu' active (example 1 + 3 — cha' je occupied!);
  mev — Soch jaj lo'be'taHvIS.
- **Modal:** Huch $30/Hoch jar — account-Hoch; image-builds 'ej CPU-seconds
  pa'Daq qet; usage — `modal app logs` via yIlegh.
- **CircleCI Free:** wejnetlh Huch ≈ javSaD tup/Hoch jar (machqu'
  Docker-resource-class neH); deploy-job — ~wa'–cha' tup, budget QaQ.

## cleanup

```bash
terraform destroy   # Supabase-project + CircleCI-context QIH (CI-peghmey reHbe'!)
modal app stop image-pipeline && modal app list   # Modal-app — nIteb QIH
```

⚠️ `terraform destroy` — CircleCI-context je QIH. Job, pa'Daq ghoSbogh, Hoch —
ghIq Qagh. Modal-apps — TF-vo' independent; mev/QIH — nIteb 'ut.
