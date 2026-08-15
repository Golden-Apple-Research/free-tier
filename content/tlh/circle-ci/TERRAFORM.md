# CircleCI + Terraform

> Official provider `CircleCI-Public/circleci` (0.x, DaH). Qu'mey, contexts
> (+ Env-Vars), triggers, webhooks 'ej self-hosted-runners ra' — organization,
> 'ach pipelines 'e' ra'be' (`config.yml` — repo-Daq taH).

## Provider-setup

```hcl
terraform {
  required_providers {
    circleci = {
      source  = "CircleCI-Public/circleci"
      version = "~> 0.4"
    }
  }
}

provider "circleci" {
  host = "https://circleci.com/api/v2"
  key  = var.circleci_api_key # Personal API Token (CircleCI → User Settings)
}
```

## Resources-mapping

| object | Terraform-resource |
|---|---|
| Qu' | `circleci_project` |
| context | `circleci_context` (+ `circleci_context_restriction`) |
| context-Env-Var | `circleci_context_environment_variable` |
| Qu'-Env-Var | `circleci_project_environment_variable` |
| pipeline-trigger | `circleci_trigger` (GitHub App/Scheduled) |
| webhook | `circleci_webhook` |
| self-hosted qetwI' | `circleci_runner_resource_class`, `circleci_runner_token` |

## Example: Qu' + context + pegh

```hcl
variable "org_id" { type = string } # Org-ID: CircleCI → Org Settings → Overview

resource "circleci_project" "app" {
  name            = "github/org/app" # VCS-project-slug/-name (Docs yIlaD)
  organization_id = var.org_id
}

resource "circleci_context" "deploy" {
  organization_id = var.org_id
  name            = "deploy"
}

resource "circleci_context_environment_variable" "tf_token" {
  context_id = circleci_context.deploy.id
  name       = "TERRAFORM_TOKEN"
  value      = var.tf_token
}
```

## Gotchas

1. `organization_id` — UUID 'oH (org-settings), org-slug Hutlh.
2. Env-Var-values — state-Daq tu'lu'. State yIencrypt; rotation —
   `terraform apply` via, variable chu' — code-Daq value yI'elQo'.
3. Provider 0.x: schema choHlaH. Version yIpin; upgrades —
   `terraform plan` via yIreview.
4. TF — `config.yml` ra'be'. Credit-usage (wejnetlh/jar, Free) — responsibility,
   pipeline-config, repo-Daq tu'lu'bogh, ghaj.
5. `circleci_trigger` — `scheduled`-block — cron-pipelines 'oH. Schedules
   frequent — credit-burn yIqel.

## Sources

- Provider: <https://registry.terraform.io/providers/CircleCI-Public/circleci/latest>
- Announcement: <https://circleci.com/changelog/official-circleci-terraform-provider-now-available/>
