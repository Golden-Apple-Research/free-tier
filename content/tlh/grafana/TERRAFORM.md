# Grafana Cloud + Terraform

> Official provider `grafana/grafana`. cha'-level pattern: wa' provider —
> **cloud-account** vaD (stacks chenmoH); cha'DIch, wa' stack-Daq,
> config-lu'bogh — dashboards/datasources/alerting vaD. stack chenmoH —
> Free-Plan-Daq Huch Hutlh.

## Provider-setup (cloud-level)

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
  cloud_access_policy_token = var.grafana_cloud_token # cloud-policy — stacks:write 'ej latlh
}
```

## Resources-mapping (Free Plan)

| level | object | resource |
|---|---|---|
| Cloud | Stack | `grafana_cloud_stack` |
| Cloud | Service Account + Token | `grafana_cloud_stack_service_account(_token)` |
| Stack | Dashboards/Folder | `grafana_dashboard`, `grafana_folder` |
| Stack | Datasources | `grafana_data_source` |
| Stack | Alerting | `grafana_rule`, `grafana_contact_point`, `grafana_mute_timing` |
| Stack | OnCall | `grafana_oncall_*` (integrations, schedules) |

## Example: Free-stack + admin-access

```hcl
resource "grafana_cloud_stack" "stack" {
  provider    = grafana.cloud
  name        = "myfree-obs"
  slug        = "myfree-obs"
  region_slug = "eu" # stack-region (e.g. eu, us)
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

stack-token — cha'DIch provider qem (e.g. root-module-lIj-Daq) — yIqIm:
token — `key` attribute-Daq tu'lu' (`token` Hutlh):

```hcl
provider "grafana" {
  alias = "stack"
  url   = grafana_cloud_stack.stack.url
  auth  = grafana_cloud_stack_service_account_token.tf.key
}
```

## Gotchas

1. cloud-policy-token — **scopes QaQ** 'ut (stacks:read/write,
   service-accounts, ...) — Hutlhbogh scopes — runtime-Daq neH Qagh.
2. cha'-provider-pattern — **cha' state-phases** law' (stack-URL — apply
   qaSpu'DI' neH Sovlu') — separated root-modules-Daq partition-laH.
3. Free-limits (wa'netlh series, vaghmaH GB logs/traces, wej lo'wI'pu' active) taH:
   dashboards, datasources cardinality-Dung ghajbogh — clean filter (adaptive
   telemetry).
4. `grafana_dashboard` — `config_json`, JSON-files + `jsonencode`-vo' —
   dashboard-JSON-export ("Share → Export") — wa' source yIlo'.

## Sources

- Provider: <https://registry.terraform.io/providers/grafana/grafana/latest>
- Cloud-stack guide: <https://grafana.com/docs/grafana-cloud/as-code/infrastructure-as-code/terraform/>
