# Supabase — Auth vaD Terraform

> **Personal Access Token (PAT)** — management-API, `SUPABASE_ACCESS_TOKEN` via.
> Token — Qu'mey 'ej keys ra'. Qu'-database-login — Qumbe'.

## 1. token yIchenmoH

<https://supabase.com/dashboard/account/tokens> → **Generate new token** → name
(e.g. `terraform`) → **Generate** → token (`sbp_…`) — wa' poH neH yIcopy.

## 2. Terraform-Daq Qum

```bash
export SUPABASE_ACCESS_TOKEN="sbp_…"   # nIteb laDlu'
```

```hcl
provider "supabase" {}
```

latlh 'ut: **Organization-ID** (org-slug, dashboard-URL-vo', e.g.
`supabase.com/dashboard/org/<slug>/…`) — `supabase_project.organization_id` vaD.

## 3. yIqIm!

- PAT — user-account rur, rights rap — Qu'mey Hoch QIHlaH je. password rur
  yIqan; reHbe' commit.
- yIqIm — Qaghbe': PAT (management) 'ej project-keys (`anon`/`service_role`,
  `data.supabase_apikeys`-vo') — latlh 'oH. keys vam — Qu'-Daq tu'lu';
  lo'wI'-Daq tu'lu'be'.
- `database_password` — state-Daq plaintext. `random_password` yIlo' +
  encrypted remote-state-backend.
- Free-Plan: cha' Qu' neH — Qu' wej-Daq apply Qapbe' (API-Qagh, clear).

## Sources

- Provider: <https://registry.terraform.io/providers/supabase/supabase/latest>
- Management-API & PAT: <https://supabase.com/docs/reference/api/introduction>
- TF-reference: <https://supabase.com/docs/guides/deployment/terraform/reference>
