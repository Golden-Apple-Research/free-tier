# Netlify + Terraform

> Official provider `netlify/netlify` (0.x, young). Most important point:
> **`netlify_site` be not a resource**, but only a data source —
> sites be created via UI/git/Netlify CLI; Terraform then manages build
> settings, env vars, DNS an' domains. The ship be built by hand; the
> rigging be managed by code. Aye, it grates against a purist's grain —
> but even the great admirals once drove their own hulls off the ways
> 'afore handin' the ropes to the crew.

## Provider Setup

```hcl
terraform {
  required_providers {
    netlify = {
      source  = "netlify/netlify"
      version = "~> 0.4"
    }
  }
}

provider "netlify" {
  token = var.netlify_token # env: NETLIFY_TOKEN (Personal Access Token)
}
```

## Resource Mapping (Free Plan)

| Object | Terraform resource |
|---|---|
| Site (read) | `data.netlify_site` / `data.netlify_sites` |
| Build settings | `netlify_site_build_settings` |
| Domains | `netlify_site_domain_settings` |
| Env vars | `netlify_environment_variable` (site- or team-wide) |
| DNS | `netlify_dns_zone` + `netlify_dns_record` |
| Deploy keys / log drains | `netlify_deploy_key`, `netlify_log_drain` |
| Firewall/WAF | `netlify_site_firewall_traffic_rules`, `netlify_waf_policy` |

## Example: Configuring an Existing Site

Take the ship that already floats, an' rig her proper:

```hcl
data "netlify_team" "team" {}

data "netlify_site" "blog" {
  # identify the site by slug/name (see the data source docs)
}

resource "netlify_site_build_settings" "blog" {
  site_id                      = data.netlify_site.blog.id
  build_command                = "npm run build"
  publish_directory            = "dist"
  production_branch            = "main"
  branch_deploy_branches       = ["preview", "staging"]
  prevent_non_git_prod_deploys = true
}

resource "netlify_environment_variable" "db" {
  team_id = data.netlify_team.team.id
  site_id = data.netlify_site.blog.id # site-level; omit it = team-level
  key     = "DATABASE_URL"
  values = [
    { value = "postgres://…", context = "all" }
  ]
}
```

## Gotchas

1. **Creating sites doesn't work via TF** — workflow: create the site via
   UI/CLI/git, then take it into the state with the data source. Whoever
   wants full IaC site creation must fall back on the Netlify API/CLI.
   Some hulls be laid by hand, no matter how clever the code be. That's not
   what you expected, eh? Aye, the shipyard be closed to Terraform —
   build it yerself, then manage it in code.
2. Env-var values land **in plaintext in the state** — encrypt the state
   backend (Terraform Cloud/S3+KMS). Plaintext in state be a spyglass in
   enemy hands — every secret written in the log fer all to read.
3. The provider be 0.x — the schema can still change; pin the version an'
   test upgrades. A young ship, still bein' fitted — nail down the planks
   an' test before ye trust the whole hull.
4. Free-Plan credits (300/month) also consume the 15 credits per production
   deploy — mind the deploy frequency under IaC operation. Rrr, that's what
   we pirates like — but the credit chest be emptied deploy by deploy, so
   hoist the flag sparingly.

## Sources

- Provider: <https://registry.terraform.io/providers/netlify/netlify/latest>
- Netlify TF guide: <https://docs.netlify.com/terraform-provider/>
