# Render + Terraform

> Official provider `render-oss/render`. **'ach:** provider — `plan` —
> `starter` 'ej Dung neH Sov — **instances Huch Hutlh (Sochvatlh wejmaH vagh rep/Hoch jar) — Terraform
> via chenmoHlu'laHbe'.** services Huch Hutlh — dashboard pagh blueprint
> (`render.yaml`) via chenmoHlu'; Terraform — paid-plan wa'DIch-vo' QaQ.

## Provider-setup

```hcl
terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = "~> 1.9"
    }
  }
}

provider "render" {
  api_key  = var.render_api_key  # env: RENDER_API_KEY (Dashboard → Account Settings)
  owner_id = var.render_owner_id # env: RENDER_OWNER_ID (Workspace-ID)
}
```

## Resources-mapping

| object | Terraform-resource |
|---|---|
| Web Service (starter-vo') | `render_web_service` |
| Private Service | `render_private_service` |
| Background Worker | `render_background_worker` |
| Cron Job | `render_cron_job` |
| Postgres / Key Value | `render_postgres`, `render_keyvalue` |
| Env-Vars / peghmey | `render_env_var`, `render_secret` (+ link-resources) |

## Example: Web Service (paid starter-plan)

```hcl
resource "render_web_service" "web" {
  name          = "my-app"
  plan          = "starter" # ⚠️ "free" — provider-Daq value lo'laH 'oHbe'
  region        = "frankfurt"
  start_command = "npm start"

  runtime_source = {
    native_runtime = {
      repo_url      = "https://github.com/me/app"
      branch        = "main"
      build_command = "npm install"
      runtime       = "node"
      auto_deploy   = true
    }
  }
}
```

For **services Huch Hutlh** — blueprint latlh (Terraform alternative):

```yaml
# render.yaml
services:
  - type: web
    plan: free           # blueprint via — QaplaH
    runtime: node
    buildCommand: npm install
    startCommand: npm start
```

## Gotchas

1. **Huch Hutlh ≠ TF:** tier (Sochvatlh wejmaH vagh rep) Huch Hutlh — provider-Daq deliberately tu'lu'be';
   Huch Hutlh — dashboard/blueprint via; TF — starter-vo' ($7/Hoch jar).
2. `terraform destroy` — service, De' je, QIH; Postgres Huch Hutlh: wejmaH-jaj-expiry
   je (FREE-TIER.md yIlaD) — permanent Qu' vaD: DBs — TF-plan-Daq yIqelQo'.
3. `owner_id` — workspace-/team-ID 'oH, personal-user 'oHbe';
   "403 not authorized"-Daq — Render-Docs-FAQ yIlegh.
4. Blueprints 'ej Terraform — mix-chugh conflicts qaS; service Hoch vaD —
   decide: config-owner nuq 'oH.

## Sources

- Provider: <https://registry.terraform.io/providers/render-oss/render/latest>
- Render TF-docs: <https://render.com/docs/terraform-provider>
- Blueprints: <https://render.com/docs/blueprints>
