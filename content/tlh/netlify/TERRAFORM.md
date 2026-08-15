# Netlify + Terraform

> Official provider `netlify/netlify` (0.x, young). yIqIm: **`netlify_site` —
> resource 'oHbe'** — data-source neH. Sites — UI/Git/Netlify-CLI via
> chenmoHlu'; ghIq Terraform — build-settings, Env-Vars, DNS 'ej domains — ra'.

## Provider-setup

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

## Resources-mapping (Free Plan)

| object | Terraform-resource |
|---|---|
| site (legh) | `data.netlify_site` / `data.netlify_sites` |
| build-settings | `netlify_site_build_settings` |
| domains | `netlify_site_domain_settings` |
| Env-Vars | `netlify_environment_variable` (site- pagh team-wide) |
| DNS | `netlify_dns_zone` + `netlify_dns_record` |
| deploy-keys / log-drains | `netlify_deploy_key`, `netlify_log_drain` |
| firewall/WAF | `netlify_site_firewall_traffic_rules`, `netlify_waf_policy` |

## Example: existing site yIconfigure

```hcl
data "netlify_team" "team" {}

data "netlify_site" "blog" {
  # Site — slug/name via yIwIv (data-source Docs yIlegh)
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
  site_id = data.netlify_site.blog.id # site-level; Hutlh = team-level
  key     = "DATABASE_URL"
  values = [
    { value = "postgres://…", context = "all" }
  ]
}
```

## Gotchas

1. **Site-creation — TF via Qapbe'** — workflow: site UI/CLI/Git via chenmoH,
   ghIq data-source via state-Daq qem. Full-IaC site-creation neHchugh —
   Netlify-API/CLI yIlo'.
2. Env-Var-values — **state-Daq plaintext** — state-backend yIencrypt
   (Terraform Cloud/S3+KMS).
3. Provider — 0.x — schema choHlaH — version yIpin, upgrades yItest.
4. Free-Plan-Huch (wejvatlh/Hoch jar) — wa'maH vagh Huch, production-deploy Hoch, je,
   lo' — deploy-frequency, IaC-operation-Daq, yIqel.

## Sources

- Provider: <https://registry.terraform.io/providers/netlify/netlify/latest>
- Netlify TF-guide: <https://docs.netlify.com/terraform-provider/>
