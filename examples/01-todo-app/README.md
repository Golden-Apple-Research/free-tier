# Example 1: Todo App (Vercel + Supabase + Cloudflare R2)

> A classic JAMstack project, distributed entirely across the free tiers of
> three providers: Next.js frontend on Vercel, Postgres/auth on Supabase,
> avatar uploads in the S3-compatible Cloudflare R2.

## Architecture

```
Browser ──▶ Vercel (Next.js, fra1)
              │  env: NEXT_PUBLIC_SUPABASE_URL / ANON_KEY
              ├──────▶ Supabase (eu-central-1) — Postgres + Auth
              │  env: R2_AVATAR_BUCKET
              └──────▶ Cloudflare R2 — S3 API (10 GB, egress $0)
```

Terraform creates **all three parts and the wiring** — the Vercel project's
env vars interpolate the Supabase URL/key and the R2 bucket name. The
frontend code itself is deployed as usual via `git push`.

## Prerequisites (Auth)

| Env var / TF var | Source | Instructions |
|---|---|---|
| `SUPABASE_ACCESS_TOKEN` | Dashboard → Account → Tokens | [../../content/de/supabase/README.md](../../content/de/supabase/README.md) |
| `CLOUDFLARE_API_TOKEN` | Template or custom token with **R2:Edit** | [../../content/de/cloudflare/README.md](../../content/de/cloudflare/README.md) |
| `VERCEL_API_TOKEN` | Account → Tokens | [../../content/de/vercel/README.md](../../content/de/vercel/README.md) |
| `TF_VAR_supabase_org_id` | Dashboard URL `/org/<slug>/…` | — |
| `TF_VAR_cloudflare_account_id` | Dashboard → Overview | — |
| `TF_VAR_vercel_git_repo` | GitHub repo `owner/name` | must be connected in Vercel |

## Running

```bash
cd examples/01-todo-app
terraform init
terraform plan
terraform apply
```

Creating the Supabase project takes a few minutes. Afterwards:

```bash
terraform output          # URLs, keys, bucket
git push                  # deploy the frontend (uses the env vars)
```

Create the `todos` table once in the Supabase SQL editor (migrations are
not the provider's job, see supabase/TERRAFORM.md gotcha 5).

## Free tier notes

- **Vercel Hobby:** non-commercial use only; 100 GB data transfer.
- **Supabase Free:** 2 active projects per account; projects pause after
  7 days of inactivity (apply/plan may show diff noise afterwards).
- **R2:** 10 GB storage free, egress free of charge — activate R2 once in
  the dashboard, otherwise the apply fails (gotcha in
  cloudflare/TERRAFORM.md).
- Signed uploads need R2 access keys (S3 tokens): create them once in the
  dashboard under *R2 → Manage API Tokens* and add them **manually** as
  Vercel env vars `R2_S3_*` — creating them via TF is not possible, so
  they never land in the state.

## Cleanup

```bash
terraform destroy
```

⚠️ Deletes the Supabase project (including its data!) and **all deployments
of the Vercel project**. For long-running setups: set
`prevent_destroy = true` on `vercel_project` (see vercel/TERRAFORM.md
gotcha 3).
