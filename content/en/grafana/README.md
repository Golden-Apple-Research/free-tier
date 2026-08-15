# Grafana Cloud — Auth fer Terraform

> Preferred: **access policy token** from the Grafana Cloud Portal (not a
> service-account token o' the stack!) via `GRAFANA_CLOUD_ACCESS_POLICY_TOKEN`.
> Fer stack resources, a dedicated stack token be then created via TF. The
> admiral's seal opens the fleet; the captains' keys open the ships.

## 1. Forge the Bootstrap Token

Grafana Cloud Portal (<https://grafana.com>) → **Access policies** →
**Create access policy** → name (e.g. `terraform`) → region → under
**Scopes** at least set:

| Scope | Needed fer |
|---|---|
| `accesspolicies:read/write/delete` | managing policies yerself |
| `stacks:read/write/delete` | creating/changing `grafana_cloud_stack` |
| `stack-service-accounts:write` | stack service accounts/tokens |

→ **Create** → tab **Tokens** → **Add token** → name `tf-bootstrap` →
copy the token once. The master key o' the fleet — shown once, then buried
in the vault.

## 2. Hook it into Terraform

```bash
export GRAFANA_CLOUD_ACCESS_POLICY_TOKEN="glca-…"   # cloud provider tier
```

```hcl
provider "grafana" {
  alias = "cloud"   # the token comes from the env var
}
```

The bootstrap token be used **only** fer the stack + stack service account
(example in TERRAFORM.md); all resources in the stack (dashboards, alerts,
datasources) be managed by the second provider with the generated stack
token (env `GRAFANA_AUTH` or `auth = …`). The admiral launches the ships;
the captains run 'em.

## 3. Notes

- Mind the mix-up trap: `glc_…` (Grafana API token) vs.
  `glca_…` (cloud access policy token) — Terraform cloud resources need
  `glca_…`. That's not what you expected, eh? Aye, one letter makes all
  the difference on the high seas — `glc` be the wrong island entirely.
- Least privilege after the bootstrap: the `tf-bootstrap` token can be
  trimmed back (only `stacks:*`) once stacks + stack-admin tokens exist via
  TF. After the fleet be launched, cut the master key down to a dock key —
  less to lose, less to fear.
- Access policy tokens by default **never** expire — organize calendar
  rotation yerself. The iron key never rusts on its own — mark the
  calendar like ye'd mark a treasure map. Rrr, that's what we pirates
  like — but the eternal key demands eternal vigilance.

> *Old salt's tale:* there be a wrecks-and-registry keeper in these waters
> what had a token from the days o' sail an' powder, still valid, still
> all-powerful, passed down from cap'n to cap'n like a cursed doubloon.
> Every scallywag what ever served aboard knew its shape. Nothin' bad came
> of it, says the legend — right up until the very day somethin' did.
> Rotate yer keys, or the legend ends the same way the keeper's luck did.

## Sources

- Provider auth: <https://registry.terraform.io/providers/grafana/grafana/latest/docs>
- Access policies: <https://grafana.com/docs/grafana-cloud/account-management/authentication-and-permissions/access-policies/>
