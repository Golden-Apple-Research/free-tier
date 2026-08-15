# Vercel + Terraform

> Official provider `vercel/vercel`. Qu'mey, domains, env-vars, DNS — ra'.
> deployments — git-push/CLI via qaStaHtaH — Terraform via Qapbe'.
> Hobby-accounts: **Qu'mey, commercial Hutlh, neH**.

## Provider-setup

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

## Resources-mapping (Hobby-Plan)

| object | Terraform-resource |
|---|---|
| Qu' | `vercel_project` |
| custom domain | `vercel_project_domain` |
| DNS-record (vercel-dns) | `vercel_dns_record` |
| env-vars | `vercel_project_environment_variable(s)` (attribute-names — version-Daq choH) |
| deployment (special cases) | `vercel_deployment` — usually 'utbe'; git/CLI deploy |

## Example: Next.js-Qu' + domain

```hcl
resource "vercel_project" "app" {
  name      = "my-app"
  framework = "nextjs"

  git_repository = {
    type = "github"
    repo = "me/app" # TF-user-account-Daq tu'lu' 'ut
  }

  # region: provider 5.x-vo' resource_config via (serverless_function_region
  # deprecated):
  resource_config = {
    function_default_regions = ["fra1"] # Hobby: region wIvlu'laH
  }
}

resource "vercel_project_domain" "app" {
  project_id = vercel_project.app.id
  domain     = "app.example.com"
}
```

ghIq `git push` via deploy — Terraform project-shell neH chenmoH. env-vars
(e.g. `DATABASE_URL`) — Qu'-block-Daq inline pagh separate-resource via.
secret-values — TF-vault/`sensitive = true`-Daq tu'lu' 'ut.

## Gotchas

1. **Hobby = commercial Hutlh, wa' seat** — company-Qu'mey vaD Terraform —
   workaround Qapbe'; Vercel fair-use chov.
2. tutorials ngo' — v2/v3 attribute-names leghmoH (e.g. `team` — `team_id`
   Hutlh). provider major-version — yIlegh reH.
3. `terraform destroy` — `vercel_project`-Daq — **deployments 'ej domains
   Hoch** QIH. production-systems vaD — `prevent_destroy = true` yIlo'.
4. wa'vatlh deployments/jaj (soft limit): preview-deploy-spam —
   `vercel_project`-settings via (`git_fork_protection`, ignored builds) —
   yIlimit.
5. custom domains — DNS-record 'ut: `vercel_dns_record` (zone, Vercel-hosted)
   pagh external yIlo'. `redirect`/`verified` vaD — yay.

## Sources

- Provider: <https://registry.terraform.io/providers/vercel/vercel/latest>
- Vercel-KB-Terraform: <https://vercel.com/kb/guide/integrating-terraform-with-vercel>
