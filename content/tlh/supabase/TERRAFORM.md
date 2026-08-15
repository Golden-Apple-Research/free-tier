# Supabase + Terraform

> Official provider `supabase/supabase`. Qu'mey, API-keys, DuHmey — IaC via
> ra'lu'laH. Free-Plan = `instance_size = "micro"` 'ej limit: cha' Qu' —
> wa' account-Daq.

## Provider-setup

```hcl
terraform {
  required_providers {
    supabase = {
      source  = "supabase/supabase"
      version = "~> 1.0"
    }
  }
}

provider "supabase" {
  access_token = var.supabase_access_token # env: SUPABASE_ACCESS_TOKEN
}
```

## Resources-mapping (Free Plan)

| object | Terraform |
|---|---|
| Qu' | `supabase_project` (`instance_size = "micro"` = plan Huch Hutlh) |
| API-keys (laD) | `data.supabase_apikeys` → `anon_key`, `service_role_key` |
| API-keys (ra') | `supabase_apikey` |
| Qu'-DuHmey | `supabase_settings` (Auth, SMTP, …) |

## Example: Free-Qu' + keys — outputs

```hcl
variable "org_id" { type = string } # org-slug, dashboard-URL-vo'

resource "supabase_project" "app" {
  organization_id   = var.org_id
  name              = "my-app"
  database_password = var.db_password # sensitive! (`random_password` + state yIqan)
  region            = "eu-central-1"
  instance_size     = "micro" # Free: shared CPU, 500 MB RAM, 500 MB storage
}

data "supabase_apikeys" "keys" {
  project_ref = supabase_project.app.id
}

output "project_url" {
  value = "https://${supabase_project.app.id}.supabase.co"
}

output "anon_key" {
  value = data.supabase_apikeys.keys.anon_key
}

output "service_role_key" {
  value     = data.supabase_apikeys.keys.service_role_key
  sensitive = true
}
```

## Gotchas

1. `supabase_project.id` — `project_ref` 'oH (cha'maH characters) — string,
   URLs/data-sources vaD — direct lo'laH.
2. **cha' Qu', Huch Hutlh, active, wa' account-Daq** (org-Hoch): `count`,
   module-Daq, yIlimit — yIlimitQo'chugh vaj Qu' wej-Daq apply Qapbe'.
3. **mev — Soch jaj qaSpu'DI'** (lo'be'taHvIS): mevtaHbogh Qu'mey — API via
   full state tu'lu'be' — `terraform plan` diff-noise leghmoHlaH; qaSpa'
   dashboard-Daq yIwake.
4. `database_password` — state-Daq tu'lu'. `random_password`-resource
   (`keepers`) — hardcoded-value Hutlh; state yIencrypt.
5. migrations/tables — provider-Daq tu'lu'be'. supabase-CLI-migrations via
   pagh SQL-job, CI-Daq — yIqIH.

## Sources

- Provider: <https://registry.terraform.io/providers/supabase/supabase/latest>
- TF-reference: <https://supabase.com/docs/guides/deployment/terraform/reference>
