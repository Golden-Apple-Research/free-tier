# Supabase — Auth fer Terraform

> Preferred: **Personal Access Token (PAT)** o' the management API via
> `SUPABASE_ACCESS_TOKEN`. The token controls projects/keys — nothin' to do
> with the project database login. The cap'n's ring o' command, not the
> cabin boy's keychain.

## 1. Forge a Token

<https://supabase.com/dashboard/account/tokens> → **Generate new token** →
name (e.g. `terraform`) → **Generate** → copy the token (`sbp_…`) once.
Show it once, then tuck it into the sea chest what never opens twice.
Aboard this vessel, the parrot holds no copies — been agreed by the whole
crew since the Incident, an' we don't speak o' the Incident.

## 2. Hook it into Terraform

```bash
export SUPABASE_ACCESS_TOKEN="sbp_…"   # read automatically
```

```hcl
provider "supabase" {}
```

Additionally needed: the **organization ID** (the org slug from the
dashboard URL, e.g. `supabase.com/dashboard/org/<slug>/…`) fer
`supabase_project.organization_id`. Every ship needs to know its fleet.

## 3. Notes

- The PAT has **the same rights as the user account** — incl. deletion rights
  over all projects. Treat it like a password; never commit it. Dead men tell
  no tales, an' leaked tokens tell the whole crew's secrets — one loose
  tongue in port, an' the fleet be scuttled.
- Don't mix 'em up: the PAT (management) be something different than the
  project keys (`anon`/`service_role` from `data.supabase_apikeys`) —
  the latter hang on the project, not the user. The admiral's seal vs. the
  harbor passes — different papers, different locks.
- `database_password` will land in the state as plaintext → use `random_password`
  + an encrypted remote state backend. Plaintext in state be a message in a
  bottle, floatin' where any scavenger can read it.
- Free Plan: 2 projects — apply fails at project 3 with a clear
  API error message. That's not what you expected, eh? Aye, two chests be
  the limit on the free ship — a third be refused at the gangplank. Rrr,
  that's what we pirates like — two fine holds, an' no more.

## Sources

- Provider: <https://registry.terraform.io/providers/supabase/supabase/latest>
- Management API & PAT: <https://supabase.com/docs/reference/api/introduction>
- TF reference: <https://supabase.com/docs/guides/deployment/terraform/reference>
