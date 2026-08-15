# Render + Terraform

> Official provider `render-oss/render`. **But:** the provider only knows
> `plan` values `starter` an' higher — **free instances (750 h/month) can't
> be created via Terraform.** Free services arise via the dashboard or
> Blueprint (`render.yaml`); Terraform only makes sense from the first paid
> plan on. The free fleet be launched by hand; the paid ships be built by
> code. A strange arrangement, aye — like a shipyard what'll only draw
> blueprints fer vessels ye pay fer. The free sloops, ye borrows from the
> harbormaster hisself, over the counter, with a wink.

## Provider Setup

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
  owner_id = var.render_owner_id # env: RENDER_OWNER_ID (workspace ID)
}
```

## Resource Mapping

| Object | Terraform resource |
|---|---|
| Web service (from Starter) | `render_web_service` |
| Private service | `render_private_service` |
| Background worker | `render_background_worker` |
| Cron job | `render_cron_job` |
| Postgres / Key Value | `render_postgres`, `render_keyvalue` |
| Env vars / secrets | `render_env_var`, `render_secret` (+ link resources) |

## Example: Web Service (paid Starter plan)

The paid hull, declared in full:

```hcl
resource "render_web_service" "web" {
  name          = "my-app"
  plan          = "starter" # ⚠️ "free" is NOT a valid value in the provider
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

Fer **free services**, use a Blueprint instead (alternative to Terraform) —
the free route, drawn by hand:

```yaml
# render.yaml
services:
  - type: web
    plan: free           # works without problems via Blueprint
    runtime: node
    buildCommand: npm install
    startCommand: npm start
```

## Gotchas

1. **Free ≠ TF:** the 750-h free tier be deliberately not in the provider —
   free via dashboard/Blueprint, TF only from Starter ($7/month). The free
   dock be closed to Terraform's cranes — launch there by hand. That's not
   what you expected, eh? Aye, some free harbors keep the code-scribes out.
2. `terraform destroy` deletes the service incl. data; fer free Postgres,
   the 30-day expiry window additionally applies (see FREE-TIER.md) — don't
   plan DBs via TF fer anything permanent. Destroy be a one-way plank walk
   — an' the free DB be a sinking ship anyway after 30 days.
3. `owner_id` be the workspace/team ID, not the personal user —
   check the Render docs FAQ on "403 not authorized". Wrong fleet number,
   wrong harbor — the guard turns ye away at the gate.
4. Mixing blueprints an' Terraform = conflicts: decide per service who be
   the owner o' the configuration. Rrr, that's what we pirates like — one
   captain per ship, no mutiny. Two masters on one deck, an' the ship be
   lost to the arguments.

## Sources

- Provider: <https://registry.terraform.io/providers/render-oss/render/latest>
- Render TF docs: <https://render.com/docs/terraform-provider>
- Blueprints: <https://render.com/docs/blueprints>
