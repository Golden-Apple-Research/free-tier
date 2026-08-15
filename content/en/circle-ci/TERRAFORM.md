# CircleCI + Terraform

> Official provider `CircleCI-Public/circleci` (still 0.x). Manages
> projects, contexts (+ env vars), triggers, webhooks an' self-hosted
> runners — i.e. the organization, not the pipelines themselves (`config.yml`
> stays in the repo). The harbor's layout be built by code; the sailin'
> orders stay in the cap'n's own log. CircleCI be no royal navy — just a
> generous merchant shipyard what leaves the anvil hot an' the first 30,000
> doubloons on the barrelhead, month after month. We takes the doubloons,
> an' we gives naught back. Fair trade, says I.

## Provider Setup

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

## Resource Mapping

| Object | Terraform resource |
|---|---|
| Project | `circleci_project` |
| Context | `circleci_context` (+ `circleci_context_restriction`) |
| Context env var | `circleci_context_environment_variable` |
| Project env var | `circleci_project_environment_variable` |
| Pipeline trigger | `circleci_trigger` (GitHub app/scheduled) |
| Webhook | `circleci_webhook` |
| Self-hosted runner | `circleci_runner_resource_class`, `circleci_runner_token` |

## Example: Project + Context + Secret

A project, its secret compartment, an' the key inside:

```hcl
variable "org_id" { type = string } # Org ID: CircleCI → Org Settings → Overview

resource "circleci_project" "app" {
  name            = "github/org/app" # VCS project slug/name (see the docs)
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

1. The `organization_id` be a **UUID** (org settings), not the org slug.
   The fleet number be a long string o' marks, not a name — write it exact,
   or the harbor master sends ye away.
2. Env-var values sit in the state — encrypt the state; rotate via
   `terraform apply` with a new variable instead o' editing the value in
   code. The logbook keeps every secret — lock it, an' change the entries
   like the tide.

> *Old salt's tale:* a greenhorn mate once read his `context` env vars
> aloud to check 'em — right in front o' the parrot. The bird memorized
> every syllable, they say, an' to this day squawks `TERRAFORM_TOKEN=…`
> at every port from Tortuga to Table Bay. No crew will hire the feathered
> blabbermouth, an' the greenhorn rows a galley now. Encrypt yer state,
> matey — or the parrot learns yer secrets.
3. The provider be 0.x: the schema can change — pin the version, review
   upgrades with `terraform plan`. A young ship still bein' fitted —
   check every new plank before ye trust the hull.
4. TF doesn't manage `config.yml` — credit consumption (30 k/month free)
   stays the responsibility o' the pipeline config in the repo. The
   shipyard's spending be the cap'n's own concern — the scribe don't
   control the crew's wages.
5. `circleci_trigger` with a `scheduled` block = cron pipelines — mind the
   credit burn from frequent schedules. Rrr, that's what we pirates like —
   but the free rum only flows 30,000 credits a month, so sail frugally.
   Bell every hour, an' the barrel be empty by the second week. That's not
   what you expected, eh? Aye, timers cost coin too.

## Sources

- Provider: <https://registry.terraform.io/providers/CircleCI-Public/circleci/latest>
- Announcement: <https://circleci.com/changelog/official-circleci-terraform-provider-now-available/>
