# Netlify — Auth vaD Terraform

> **Personal Access Token (PAT)** — user-settings-vo'; `NETLIFY_TOKEN` via noblu'.

## 1. token yIchenmoH

Netlify-app → user-avatar → **User settings → Applications** →
*Personal access tokens* → **Generate new token** → name (e.g. `terraform`)
→ **Generate** → token — wa' poH neH yIcopy.

Direct-link: <https://app.netlify.com/user/applications/personal-access-tokens>

## 2. Terraform-Daq Qum

```bash
export NETLIFY_TOKEN="nfp_…"   # nIteb laDlu'
```

```hcl
provider "netlify" {}
```

## 3. yIqIm!

- PAT — **user-rights** ghaj (Free-Plan: wa' ghom-owner); scope separate
  tu'lu'be' — vaj password rur, yIqan.
- `data.netlify_site` / Hoch resources — **team-ID-Daq** tu'lu'; teams law',
  account-Daq tu'lu'bogh — data-source-lookup-Daq correct yIwIv.
- Tokens — time-limit-lu'laHbe'; rotation: QIH 'ej chenmoHqa' —
  suspicion-chugh DaH yIrevoke.
- Env-Vars, builds vaD (`netlify_environment_variable`), — PAT-vo' independent;
  values — TF-state-Daq tu'lu' — backend yIencrypt.

## Sources

- Provider: <https://registry.terraform.io/providers/netlify/netlify/latest/docs>
- Token-creation: <https://docs.netlify.com/cli/get-started/#obtain-a-token-in-the-netlify-ui>
