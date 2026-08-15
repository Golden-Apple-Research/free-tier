# Neon — Auth fer Terraform

> Preferred: **API key** from the Neon Console (Account settings),
> provided via `NEON_API_KEY`. One key, one lock, one ship — simple as
> the sea be wide.

## 1. Forge a Key

Neon Console (<https://console.neon.tech>) → avatar (top right) →
**Account settings → API keys** → **Create new API key** → give it a name →
copy the key once. Then hide it like buried treasure — in a vault, not
under the floorboards o' a public repo.

(Project- or org-scoped keys instead sit under the respective
org → **Settings → API keys**.)

## 2. Hook it into Terraform

```bash
export NEON_API_KEY="napi_…"   # the community provider reads this env var
```

```hcl
provider "neon" {}
```

## 3. Notes

- The key be shown **only once at creation** — stash it in the
  secret manager (1Password/Vault/CI secrets) immediately. The chest opens
  but the once; miss the moment, an' ye'll be diggin' through the sand.
  Aye, an' if the vault key an' the treasure key end up on the same
  keychain round yer neck — that be not stashin', that be advertisin'.
- Rotation = **revoke** the old key (immediate & final!) + create a new
  one + update everywhere — no parallel operation during rotation possible.
  The old key dies the instant the new one be born — no overlap, no mercy.
- Personal keys apply account-wide; fer CI, better use an org- or
  project-scoped key with minimal reach. A key to one chest, not the whole
  treasury — the wise pirate scopes.
- The provider be community-maintained (`terraform-community-providers/neon`)
  — pin the version (see TERRAFORM.md). And ye bloody landrat really thought
  ye had to pay fer it? Nay — but pin yer versions, says I. A drifting
  version be a ship without a rudder.

## Sources

- Managing API keys: <https://neon.com/docs/manage/api-keys>
- TF guide: <https://neon.com/docs/reference/terraform>
