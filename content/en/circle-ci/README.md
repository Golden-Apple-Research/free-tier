# CircleCI — Auth fer Terraform

> Preferred: **Personal API Token** from the user settings. Mind: the
> official provider `CircleCI-Public/circleci` has **no environment variable**
> — the token gets handed into the provider block via a variable/TF_VAR.
> No magic env var, no hidden passage — the key be passed hand to hand.

## 1. Forge a Token

CircleCI → user avatar → **User Settings → Personal API Tokens** →
*Create New Token* → name (e.g. `terraform`) → copy the token once.
Then tuck it away — shown but the once, like a treasure map.

Additionally needed: the **organization ID** (UUID) — Org →
**Organization Settings → Overview → Organization ID**. The fleet number —
every crew has one, an' the code needs it to find the right harbor.

## 2. Hook it into Terraform

Since there be no `CIRCLECI_*` env var, do it cleanly via a declarative variable:

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
export TF_VAR_circleci_api_key="…"   # keeps the value out of the code
```

## 3. Notes

- Personal tokens have **the rights o' the user** in all orgs he belongs
  to — fer automations, use a dedicated bot user + their token. The cap'n's
  seal opens every gate he's sworn to — hire a cabin boy fer the chores,
  an' give him only his own key.
- The community fork `mrolla/circleci` reads `CIRCLECI_TOKEN` automatically —
  but officially it be `CircleCI-Public/circleci` (see TERRAFORM.md); don't
  mix 'em. Two charts to the same island — pick the official one an' throw
  the other overboard.
- `context_environment_variable` values from the configuration land in the
  state (standard Terraform behavior) — use an encrypted backend; rotate
  via `terraform apply` with a new value. The state be the ship's log —
  keep it under lock, an' change the passwords like the tides.
- Context env-var values be **write-only** via the API — the provider
  stores only a hash in the state (change detection still works). Only after
  `terraform import` does the first plan show a diff `null → value`; the
  apply writes the same value back via upsert. That's not what you expected,
  eh? Aye, the hash be the map, not the treasure — the vault keeps the
  gold, the log keeps only the fingerprint. Rrr, that's what we pirates
  like — a secret what stays secret. The Crown's own mint couldn't do it
  neater: the coin never leaves the vault, an' only the seal-impression
  rides the waves.

## Sources

- Provider: <https://registry.terraform.io/providers/CircleCI-Public/circleci/latest/docs>
- Personal API tokens: <https://circleci.com/docs/managing-api-tokens/>
