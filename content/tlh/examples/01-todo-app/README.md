# Example 1: Todo-App (Vercel + Supabase + Cloudflare R2)

> JAMstack-project classic — tier Huch Hutlh-Daq Hoch, wej providers qaStaHvIS:
> Next.js-frontend — Vercel-Daq; Postgres/Auth — Supabase-Daq;
> avatar-uploads — Cloudflare R2-Daq (S3-compatible).

## Architecture

```
Browser ──▶ Vercel (Next.js, fra1)
              │  env: NEXT_PUBLIC_SUPABASE_URL / ANON_KEY
              ├──────▶ Supabase (eu-central-1) — Postgres + Auth
              │  env: R2_AVATAR_BUCKET
              └──────▶ Cloudflare R2 — S3-API (10 GB, Egress 0 $)
```

Terraform — **wej Hoch 'ej wiring** chenmoH — Vercel-Qu' Env-Vars:
Supabase-URL/key 'ej R2-bucket-name interpolate. Frontend-code — `git push`
via, deploy — standard.

## nuq 'ut (Auth)

| Env-Var / Var | nuqDaq | yIghoS |
|---|---|---|
| `SUPABASE_ACCESS_TOKEN` | Dashboard → Account → Tokens | [supabase/README.md](../../content/tlh/supabase/README.md) |
| `CLOUDFLARE_API_TOKEN` | Template pagh custom token — **R2:Edit** | [cloudflare/README.md](../../content/tlh/cloudflare/README.md) |
| `VERCEL_API_TOKEN` | Account → Tokens | [vercel/README.md](../../content/tlh/vercel/README.md) |
| `TF_VAR_supabase_org_id` | Dashboard-URL `/org/<slug>/…` | — |
| `TF_VAR_cloudflare_account_id` | Dashboard → Overview | — |
| `TF_VAR_vercel_git_repo` | GitHub-repo `owner/name` | Vercel-Daq Qumlu' 'ut |

## yIqet

```bash
cd examples/01-todo-app
terraform init
terraform plan
terraform apply
```

Supabase-Qu' chenmoH — tup law' poH. ghIq:

```bash
terraform output          # URLs, keys, bucket
git push                  # frontend deploy — Env-Vars lo'
```

Table `todos` — Supabase-SQL-editor-Daq, wa' poH neH, yIchenmoH (migrations —
provider Qu'be'; supabase/TERRAFORM.md Gotcha 5) yIlaD.

## Huch Hutlh notes

- **Vercel Hobby:** non-commercial neH; wa'vatlh GB transfer.
- **Supabase Free:** cha' Qu' active — wa' account-Daq. Qu' — Soch jaj
  lo'be'taHvIS, mev (apply/plan — diff-noise leghmoHlaH ghIq).
- **R2:** wa'maH GB storage Huch Hutlh; egress Huch Hutlh — R2, wa' poH neH,
  dashboard-Daq activate; Hutlhchugh — apply Qagh (Gotcha — cloudflare/TERRAFORM.md-Daq).
- Signed uploads — R2-access-keys (S3-tokens) 'ut: dashboard-Daq —
  *R2 → Manage API Tokens* — wa' poH, yIchenmoH, 'ej **manually** —
  Vercel-Env-Vars `R2_S3_*` — yIchel (TF chenmoHlaHbe' — state-Daq reHbe'
  tu'lu'meH).

## cleanup

```bash
terraform destroy
```

⚠️ Supabase-Qu' QIH (De' je!) 'ej **Vercel-Qu' deployments Hoch**.
reH qetmeHbogh: `prevent_destroy = true` — `vercel_project`-Daq yIchenmoH
(vercel/TERRAFORM.md Gotcha 3 yIlaD).
