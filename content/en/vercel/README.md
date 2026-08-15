# Vercel — Auth fer Terraform

> Preferred: **Personal Access Token** from the account settings,
> provided via `VERCEL_API_TOKEN`. Scope it to yer own team — a key to yer
> own fleet, not to every harbor on the map.

## 1. Forge a Token

<https://vercel.com/account/tokens> → **Create Token** → give it a name
(e.g. `terraform`) → scope: yer own personal account or the team →
**Create** → copy the token (`vercel_…`) once. Stow it like the cap'n's
private stash — shown once, then never again. An' if the parrot asks
where ye keep it: the parrot asks too many questions.

## 2. Hook it into Terraform

```bash
export VERCEL_API_TOKEN="vercel_…"   # read automatically
```

```hcl
provider "vercel" {
  # team = "my-team"   # optional if resources live in a team
}
```

## 3. Notes

- Tokens inherit **all rights o' the account** — in teams, better use a
  dedicated (bot) team member + their token. The admiral's seal opens every
  door — hand out only the boatswain's key.
- Fer `vercel_project.git_repository`, the git account (GitHub/GitLab)
  must first be connected to Vercel under *Settings → Git* — that only
  works in the UI, not via Terraform. Some gangplanks be raised by hand —
  no code can lower 'em.
- No expiry date on tokens by default — rotate manually; delete leaked
  tokens immediately under Account → Tokens. The lock never rusts on its
  own — change it yerself, an' quickly when the key be lost.
- Hobby accounts: one token suffices; **commercial use be not allowed on
  Hobby** (see FREE-TIER.md). And ye bloody landrat really thought ye had
  to pay fer it? Nay — but keep it personal, not commercial. The free flag
  flies only fer private sails. Rrr, that's what we pirates like — but the
  merchant fleet must pay the toll.

## Sources

- Provider auth: <https://registry.terraform.io/providers/vercel/vercel/latest/docs>
- Tokens: <https://vercel.com/kb/guide/integrating-terraform-with-vercel>
