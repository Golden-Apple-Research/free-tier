# Supabase + Terraform

> Official provider `supabase/supabase`. Projects, API keys an' settings
> be manageable via IaC; Free Plan = `instance_size = "micro"` an' the
> 2-project limit per account. Declare it, apply it, an' the free fleet
> rises from the depths. Two warships from a single decree — the
> admiralty o' Supabase be generous to a fault, an' we faultless in
> acceptin'.

## Provider Setup

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

## Resource Mapping (Free Plan)

| Object | Terraform |
|---|---|
| Project | `supabase_project` (`instance_size = "micro"` = free) |
| API keys (read) | `data.supabase_apikeys` → `anon_key`, `service_role_key` |
| API keys (manage) | `supabase_apikey` |
| Project settings | `supabase_settings` (auth, SMTP, …) |

## Example: Free Project + Keys as Outputs

A free project, born o' code, with its keys handed over like the keys to
a new ship:

```hcl
variable "org_id" { type = string } # org slug from the dashboard URL

resource "supabase_project" "app" {
  organization_id   = var.org_id
  name              = "my-app"
  database_password = var.db_password # sensitive! (protected by random_password + state)
  region            = "eu-central-1"
  instance_size     = "micro" # Free: Shared CPU, 500 MB RAM, 500 MB Storage
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

1. `supabase_project.id` be the `project_ref` (20 characters) — usable
   directly as a string fer URLs/data sources. The ship's registration
   number — short, unique, always at hand.
2. **2 active free projects per account** (across orgs): limit `count`
   in the module, otherwise the third apply fails. The free fleet be two
   ships an' no more — the third apply be turned away at the harbor gate.
   That's not what you expected, eh? Aye, two chests be the limit.
3. **Inactivity pause after 7 days:** paused projects don't deliver a full
   state via the API — `terraform plan` can show diff noise; wake 'em in
   the dashboard first. A sleeping ship gives muddy charts — rouse her
   before ye plan the course.
4. `database_password` sits in the state → use a `random_password` resource
   with `keepers` instead o' a hardcoded value, an' encrypt the state.
   The password be the key to the hold — never write it in the log for all
   to read.
5. Migrations/tables don't belong to the provider — roll 'em out via
   Supabase CLI migrations or as a SQL job in CI. Rrr, that's what we
   pirates like — but the schema stays the boatswain's own craft, not the
   quartermaster's.

## Sources

- Provider: <https://registry.terraform.io/providers/supabase/supabase/latest>
- TF reference: <https://supabase.com/docs/guides/deployment/terraform/reference>
