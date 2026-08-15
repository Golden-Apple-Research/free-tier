# Neon + Terraform

> ⚠️ No official Neon provider: the Neon docs point to the
> community provider (`terraform-community-providers/neon`, originally
> `kislerdm/neon`). Fully functional fer projects/branches/endpoints/roles —
> but without official support from Neon. A fine ship, sailed by the crew
> — but the admiralty offers no rescue when she takes on water.

## Provider Setup

```hcl
terraform {
  required_providers {
    neon = {
      source = "terraform-community-providers/neon" # a.k.a. kislerdm/neon
    }
  }
}

provider "neon" {} # api_key via env: NEON_API_KEY (Console → Account Settings)
```

## Resource Mapping (Free Plan)

| Object | Terraform resource |
|---|---|
| Project (+ root branch) | `neon_project` |
| Branch (copy-on-write) | `neon_branch` |
| Compute endpoint | `neon_endpoint` |
| Role / database | `neon_role`, `neon_database` |

## Example: Project + Preview Branch

A main ship an' a preview longboat fer every pull request:

```hcl
resource "neon_project" "app" {
  name      = "my-app"
  region_id = "aws-eu-central-1" # Free: region freely selectable

  # Careful: `branch` is an object ARGUMENT (with `=`), not a block:
  branch = {
    name = "main" # default branch with default DB/role
  }
}

# typical preview branch per PR — storage shares the project budget (0.5 GB)
resource "neon_branch" "preview" {
  project_id = neon_project.app.id
  parent_id  = neon_project.app.branch.id # attached to main (computed)
  name       = "preview"
}
```

Connection data in the released provider (0.1.x): `neon_project.app.branch.endpoint.host`
delivers the host; the app role's password comes from `neon_role` (computed,
sensitive) — the URI gets assembled yerself (`connection_uri` attributes
exist so far only in the unpublished master branch o' the provider).
The map be partly blank — splice the coordinates together with yer own hand.

## Gotchas

1. **Namespace history:** the registry entry moved from `kislerdm/neon` to
   `terraform-community-providers/neon` — both sources work, the community
   URL be the future-proof one. The old harbor still takes ships, but the
   new one be where the charts point. Like a renamed tavern: the grog be
   the same, but pin yer chart to the new sign, lest ye be the last buccaneer
   sailin' to the old one after they shutter the doors.
2. Free-Plan limits apply **per project** (100 CU-h, 0.5 GB) — many
   `neon_project` resources create many individual budgets, but also
   storage sums; branches share the project storage. Every ship carries
   its own ration, but the cargo decks be shared by the whole flotilla.
3. Scale-to-zero stays the default even via TF (5 min) — plan fer cold
   starts at the first query (see FREE-TIER.md). The crew be ashore after
   five idle minutes — the first call rouses 'em slow. That's not what you
   expected, eh? Aye, free sleep has its price in wake-up time.
4. The provider itself warns: no `terraform init -upgrade` in
   auto-approved pipelines — pin the version an' review upgrades manually.
   Never let the crew change the sails without the cap'n's review.
5. In the worst case (provider dies), the Neon API/CLI remains as fallback —
   resources can be recovered via `terraform import`. Rrr, that's what we
   pirates like — always keep a second ship in reserve, an' a second set o'
   charts in the locker.

## Sources

- Provider: <https://registry.terraform.io/providers/terraform-community-providers/neon>
- Neon TF guide: <https://neon.com/docs/reference/terraform>
