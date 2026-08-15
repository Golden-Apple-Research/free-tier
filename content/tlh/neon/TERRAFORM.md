# Neon + Terraform

> ⚠️ Official Neon-provider tu'lu'be': Neon-Docs — community-provider qem
> (`terraform-community-providers/neon`, originally `kislerdm/neon`).
> Qu'mey/branches/endpoints/roles vaD — full functional; 'ach Neon
> official-support Hutlh.

## Provider-setup

```hcl
terraform {
  required_providers {
    neon = {
      source = "terraform-community-providers/neon" # a.k.a. kislerdm/neon
    }
  }
}

provider "neon" {} # api_key: env via — NEON_API_KEY (Console → Account Settings)
```

## Resources-mapping (Free Plan)

| object | Terraform-resource |
|---|---|
| Qu' (+ root-branch) | `neon_project` |
| Branch (copy-on-write) | `neon_branch` |
| Compute-endpoint | `neon_endpoint` |
| Role / database | `neon_role`, `neon_database` |

## Example: Qu' + preview-branch

```hcl
resource "neon_project" "app" {
  name      = "my-app"
  region_id = "aws-eu-central-1" # Free: region — wIvlaH

  # yIqIm: `branch` — object-ARGUMENT (`=` ghaj), block 'oHbe':
  branch = {
    name = "main" # default-branch — default-DB/-role
  }
}

# Typical preview-branch, PR wa'Daq — storage project-budget shares (0.5 GB)
resource "neon_branch" "preview" {
  project_id = neon_project.app.id
  parent_id  = neon_project.app.branch.id # main-Daq (computed)
  name       = "preview"
}
```

Connection-data, released provider-Daq (0.1.x): `neon_project.app.branch.endpoint.host`
— host nob; app-role password — `neon_role` nob (computed, sensitive). URI —
nIteb chenmoHlu' (`connection_uri`-attributes — DaH neH unpublished
provider-master-branch-Daq tu'lu').

## Gotchas

1. **Namespace-history:** registry-entry — `kislerdm/neon`-vo',
   `terraform-community-providers/neon`-Daq, moved. cha' Sources — Qap;
   community-URL — future-safe.
2. Free-Plan-limits — **wa' Qu'-Daq** (wa'vatlh CU-h, 0.5 GB). `neon_project`-
   resources law' — budgets law' chenmoH; 'ach storage-sums je. Branches —
   Qu' storage share.
3. Scale-to-zero — TF via je default (vagh tup). Wa'DIch query — cold-start
   yIqel (FREE-TIER.md yIlaD).
4. Provider nIteb warns: auto-approved pipelines-Daq — `terraform init -upgrade`
   yIlo'Qo'. Version — pin; upgrades — manually yIlegh.
5. Downside-risk (provider dies): Neon-API/CLI — fallback, taH. Resources —
   `terraform import` via yIqemqa'.

## Sources

- Provider: <https://registry.terraform.io/providers/terraform-community-providers/neon>
- Neon TF-guide: <https://neon.com/docs/reference/terraform>
