# Vercel — Auth vaD Terraform

> **Personal Access Token** — account-settings-vo'; `VERCEL_API_TOKEN` via.
> scope — team'lIj-Daq yIlimit.

## 1. token yIchenmoH

<https://vercel.com/account/tokens> → **Create Token** → name (e.g. `terraform`)
→ scope: personal-account-lIj pagh ghom → **Create** → token (`vercel_…`) —
wa' poH neH yIcopy.

## 2. Terraform-Daq Qum

```bash
export VERCEL_API_TOKEN="vercel_…"   # nIteb laDlu'
```

```hcl
provider "vercel" {
  # team = "my-team"   # optional: resources team-Daq tu'lu'chugh
}
```

## 3. yIqIm!

- Tokens — **rights Hoch, account-Daj** Hev. teams-Daq: dedicated (bot)
  team-member + tokenDaj — QaQ.
- `vercel_project.git_repository` vaD — git-account (GitHub/GitLab) — qaSpa'
  *Settings → Git* — Vercel-Daq jol 'ut. UI-Daq neH Qap — Terraform-Daq Qapbe'.
- Tokens — expiry tu'lu'be' (default). yIrotate — manual. token,
  leakedtaHbogh — DaH, Account → Tokens-Daq, yIQIH.
- Hobby-accounts: wa' token yap. **commercial use — Hobby-Daq chaw'be'**
  (FREE-TIER.md yIlaD).

## Sources

- Provider-auth: <https://registry.terraform.io/providers/vercel/vercel/latest/docs>
- Tokens: <https://vercel.com/kb/guide/integrating-terraform-with-vercel>
