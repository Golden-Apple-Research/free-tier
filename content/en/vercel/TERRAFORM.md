# Vercel + Terraform

> Official provider `vercel/vercel`. Manages projects, domains, env vars
> an' DNS — deployments still happen via git push/CLI, not via Terraform.
> Fer Hobby accounts: **only non-commercial projects**. The hull be
> declared in code; the sailin' still be done by hand. A clean division
> o' labor, says I — the scribe draws the ship, the crew breathes life
> into her with every push.

## Provider Setup

```hcl
terraform {
  required_providers {
    vercel = {
      source  = "vercel/vercel"
      version = "~> 5.0"
    }
  }
}

provider "vercel" {
  api_token = var.vercel_api_token # env: VERCEL_API_TOKEN
}
```

## Resource Mapping (Hobby Plan)

| Object | Terraform resource |
|---|---|
| Project | `vercel_project` |
| Custom domain | `vercel_project_domain` |
| DNS record (vercel-dns) | `vercel_dns_record` |
| Env vars | `vercel_project_environment_variable(s)` (attribute names vary by version) |
| Deployment (special cases) | `vercel_deployment` — usually unnecessary, git/CLI deploys |

## Example: Next.js Project + Domain

The project shell an' its nameplate, all in one:

```hcl
resource "vercel_project" "app" {
  name      = "my-app"
  framework = "nextjs"

  git_repository = {
    type = "github"
    repo = "me/app" # must belong to / be connected with the TF user account
  }

  # region since provider 5.x via resource_config (serverless_function_region
  # is deprecated):
  resource_config = {
    function_default_regions = ["fra1"] # Hobby: region freely selectable
  }
}

resource "vercel_project_domain" "app" {
  project_id = vercel_project.app.id
  domain     = "app.example.com"
}
```

Afterwards deploy normally via `git push` — Terraform only creates the
project shell. Env vars (e.g. `DATABASE_URL`) either inline in the project
block or via the separate resource; secret values belong in TF
vault/`sensitive = true`. The cap'n draws the ship; the crew sets the sails.

## Gotchas

1. **Hobby = non-commercial, 1 seat** — fer company projects, Terraform
   doesn't work as a workaround; Vercel checks fair use. No clever flag-
   flyin' gets past the harbor patrol — keep it personal, or pay the toll.
2. Old tutorials show v2/v3 attribute names (e.g. `team` instead o'
   `team_id`) — keep the provider's major version in mind. Old charts,
   old names — check the current map before ye set the course.
3. `terraform destroy` on `vercel_project` deletes **all deployments an'
   domains** o' the project — set `prevent_destroy = true` fer production
   systems. That's not what you expected, eh? Aye, destroy be a one-way
   plank walk — no second thoughts, no swimmin' back.
4. 100 deployments/day (soft limit): limit preview-deploy spam via
   `vercel_project` settings (`git_fork_protection`, ignored builds).
   Launchin' a longboat fer every ripple irritates the harbor master —
   hold yer launches.
5. Custom domains need a DNS record — set `vercel_dns_record`
   appropriately (with a Vercel-hosted zone) or externally an' wait fer
   `redirect`/`verified`. Rrr, that's what we pirates like — but the
   nameplate only shines once the harbor confirms the berth.

## Sources

- Provider: <https://registry.terraform.io/providers/vercel/vercel/latest>
- Vercel KB Terraform: <https://vercel.com/kb/guide/integrating-terraform-with-vercel>
