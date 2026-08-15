# CircleCI — Auth vaD Terraform

> **Personal API token** — user-settings-vo'. yIqIm: official provider
> `CircleCI-Public/circleci` — Env-Var tu'lu'be'; token — variable/TF_VAR
> via provider-block-Daq noblu'.

## 1. token yIchenmoH

CircleCI → User avatar → **User Settings → Personal API Tokens** →
*Create New Token* → name (e.g. `terraform`) → token — wa' poH neH copy.

latlh 'ut: **organization-ID** (UUID) — Org →
**Organization Settings → Overview → Organization ID**.

## 2. Terraform-Daq Qum

`CIRCLECI_*`-Env-Var tu'lu'be'mo' — declarative variable via clean:

```hcl
variable "circleci_api_key" {
  type      = string
  sensitive = true
}

provider "circleci" {
  host = "https://circleci.com/api/v2"
  key  = var.circleci_api_key
}
```

```bash
export TF_VAR_circleci_api_key="…"   # vaj value code-Daq tu'lu'be'
```

## 3. yIqIm!

- Personal tokens — lo'wI'-rights 'oH, orgs Hoch-Daq, lo'wI' tu'lu'bogh.
  Automation vaD: bot-user dedicated yIchenmoH 'ej tokenDaj yIlo'.
- Community-fork `mrolla/circleci` — `CIRCLECI_TOKEN` nIteb laD. 'ach
  official: `CircleCI-Public/circleci` (TERRAFORM.md yIlaD); cha' yIlo'Qo'.
- `context_environment_variable`-values, config-vo' — state-Daq qaS
  (standard Terraform-behavior). encrypted backend yIlo'; rotation —
  `terraform apply` via, value chu'.
- Context-Env-Var-values — API via qon-neH 'oH. provider — hash neH
  state-Daq qon (change-detection Qap je). `terraform import` qaSpu'DI'
  neH — plan diff wa'DIch `null → value` leghmoH; apply — value rap,
  upsert via, qonqa'.

## Sources

- Provider: <https://registry.terraform.io/providers/CircleCI-Public/circleci/latest/docs>
- Personal API Tokens: <https://circleci.com/docs/managing-api-tokens/>
