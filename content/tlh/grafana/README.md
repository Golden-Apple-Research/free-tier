# Grafana Cloud — Auth vaD Terraform

> **Access-policy-token** — Grafana-Cloud-portal-vo' (stack
> service-account-token — Hutlh!) — `GRAFANA_CLOUD_ACCESS_POLICY_TOKEN` via.
> Stack-resources vaD — ghIq, TF via, stack-token nIteb chenmoHlu'.

## 1. bootstrap-token yIchenmoH

Grafana-Cloud-portal (<https://grafana.com>) → **Access policies** →
**Create access policy** → name (e.g. `terraform`) → region → **Scopes**-Daq —
mach neH yIlo':

| Scope | nuq vaD 'ut |
|---|---|
| `accesspolicies:read/write/delete` | policies nIteb ra'lu' |
| `stacks:read/write/delete` | `grafana_cloud_stack` chenmoH/choH |
| `stack-service-accounts:write` | stack-service-accounts/-tokens |

→ **Create** → **Tokens** tab → **Add token** → name `tf-bootstrap` → token —
wa' poH neH copy.

## 2. Terraform-Daq Qum

```bash
export GRAFANA_CLOUD_ACCESS_POLICY_TOKEN="glca-…"   # cloud-provider level
```

```hcl
provider "grafana" {
  alias = "cloud"   # token — Env-Var-vo'
}
```

bootstrap-token — **stack + stack-service-account neH** vaD lo'lu'
(TERRAFORM.md example); stack-Daq resources Hoch (dashboards,
alerts, datasources) — cha'DIch provider ra', stack-token, chenmoHpu'bogh,
lo' (Env `GRAFANA_AUTH` pagh `auth = …`).

## 3. yIqIm!

- yIqIm — confusion-trap: `glc_…` (Grafana-API-token) vs `glca_…`
  (cloud-access-policy-token) — Terraform-cloud-resources — `glca_…` 'ut.
- least-privilege — bootstrap qaSpu'DI': `tf-bootstrap`-token — mach-lu'laH
  (neH `stacks:*`), stacks + stack-admin-token, TF via, tu'lu'pu'DI'.
- access-policy-tokens — standard **reHbe'** mev — calendar-rotation — nIteb
  yIorganize.

## Sources

- Provider-auth: <https://registry.terraform.io/providers/grafana/grafana/latest/docs>
- Access policies: <https://grafana.com/docs/grafana-cloud/account-management/authentication-and-permissions/access-policies/>
