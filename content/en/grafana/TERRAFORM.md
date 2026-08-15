# Grafana Cloud + Terraform

> Official provider `grafana/grafana`. Two-level pattern: one provider fer
> the **cloud account** (creating stacks) an' a second, per-stack configured
> provider fer dashboards/datasources/alerting. Creating a stack be free on
> the Free Plan. The admiral launches the fleet; the captains rig the ships.

## Provider Setup (cloud level)

```hcl
terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = ">= 3.0"
    }
  }
}

provider "grafana" {
  alias                 = "cloud"
  cloud_access_policy_token = var.grafana_cloud_token # cloud policy with stacks:write & co.
}
```

## Resource Mapping (Free Plan)

| Level | Object | Resource |
|---|---|---|
| Cloud | Stack | `grafana_cloud_stack` |
| Cloud | Service account + token | `grafana_cloud_stack_service_account(_token)` |
| Stack | Dashboards/folders | `grafana_dashboard`, `grafana_folder` |
| Stack | Datasources | `grafana_data_source` |
| Stack | Alerting | `grafana_rule`, `grafana_contact_point`, `grafana_mute_timing` |
| Stack | OnCall | `grafana_oncall_*` (integrations, schedules) |

## Example: Free Stack + Admin Access to It

A free observability stack, launched an' given its own keys:

```hcl
resource "grafana_cloud_stack" "stack" {
  provider    = grafana.cloud
  name        = "myfree-obs"
  slug        = "myfree-obs"
  region_slug = "eu" # stack region (e.g. eu, us)
}

resource "grafana_cloud_stack_service_account" "tf" {
  provider   = grafana.cloud
  stack_slug = grafana_cloud_stack.stack.slug
  name       = "terraform"
  role       = "Admin"
}

resource "grafana_cloud_stack_service_account_token" "tf" {
  provider           = grafana.cloud
  stack_slug         = grafana_cloud_stack.stack.slug
  service_account_id = grafana_cloud_stack_service_account.tf.id
  name               = "tf-token"
}
```

The stack token feeds the second provider (e.g. in its own root module) —
mind: the token lies in the attribute `key` (not `token`):

```hcl
provider "grafana" {
  alias = "stack"
  url   = grafana_cloud_stack.stack.url
  auth  = grafana_cloud_stack_service_account_token.tf.key
}
```

## Gotchas

1. The cloud policy token needs the **right scopes** (stacks:read/write,
   service-accounts, ...) — missing scopes only show themselves at runtime.
   The harbor guard only speaks when ye're at the gate — miss a paper, an'
   ye find out mid-apply. That's not what you expected, eh? Aye — an'
   apply what dies at the gate in front o' the whole crew be a special
   kind o' humiliation. Ask me how I know. Nay, don't.
2. The two-provider pattern usually forces **two state phases** (stack URL
   only known after apply) — possibly split into separate root modules.
   The admiral must launch the ship before the captain can chart her —
   two logbooks, two voyages.
3. Free limits (10 k series, 50 GB logs/traces, 3 active users) still
   apply: filter dashboards with high-cardinality datasources cleanly
   (adaptive telemetry). The free ship sails with a lean crew — trim the
   signal flags, or the mast groans.
4. `grafana_dashboard` with `config_json` from JSON files + `jsonencode` —
   use the dashboard JSON export ("Share → Export") as the single source.
   Rrr, that's what we pirates like — one map, one source o' truth, an' no
   two copies driftin' apart like rival charts.

## Sources

- Provider: <https://registry.terraform.io/providers/grafana/grafana/latest>
- Cloud stack guide: <https://grafana.com/docs/grafana-cloud/as-code/infrastructure-as-code/terraform/>
