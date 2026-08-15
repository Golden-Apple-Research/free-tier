# Netlify — Auth fer Terraform

> Preferred: **Personal Access Token (PAT)** from the user settings,
> provided via `NETLIFY_TOKEN`. The cap'n's seal — one token, full sway.

## 1. Forge a Token

Netlify app → user avatar → **User settings → Applications** →
*Personal access tokens* → **Generate new token** → name (e.g. `terraform`)
→ **Generate** → copy the token once. Then tuck it below decks, out o'
sight an' out o' reach o' prying eyes.

Direct link: <https://app.netlify.com/user/applications/personal-access-tokens>

## 2. Hook it into Terraform

```bash
export NETLIFY_TOKEN="nfp_…"   # read automatically
```

```hcl
provider "netlify" {}
```

## 3. Notes

- The PAT carries **the rights o' the user** (Free Plan = 1 team owner) —
  no separate scoping possible; so treat it like a password. Rrr, that's
  what we pirates like — but guard the key like the captain's rum. One
  key to the whole ship — the same key opens the treasure hold an' the
  powder magazine. Lose it, an' ye lose everythin' at once. That be the
  price o' simplicity, matey: convenient as a tied-up dinghy, dangerous
  as an untied one.
- `data.netlify_site` / all resources hang on the **team ID** —
  with several teams per account, pick the right one in the data-source
  lookup. Several fleets under one flag — point the data source at the
  right one, or ye'll be sailin' the wrong waters.
- Tokens can't be time-limited — rotation via deleting +
  recreating; revoke immediately on suspicion. The lock never rusts on its
  own — strike the old key the moment a shadow falls on it.
- Env vars fer builds (`netlify_environment_variable`) be independent o'
  the PAT — the values land in the TF state, so encrypt the backend.
  That's not what you expected, eh? Aye, plaintext in state be a leak
  waiting to happen — a message in a bottle, floatin' where any scavenger
  can read it. Keep the state under lock an' key.

## Sources

- Provider: <https://registry.terraform.io/providers/netlify/netlify/latest/docs>
- Token creation: <https://docs.netlify.com/cli/get-started/#obtain-a-token-in-the-netlify-ui>
