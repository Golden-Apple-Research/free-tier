# AWS — Auth vaD Terraform

> **IAM Identity Center (SSO)** — local Qu' vaD; **OIDC/AssumeRole** — CI vaD.
> Access-Keys classic — fallback neH.

## 1. credential yIchenmoH

**DuH A — IAM Identity Center / SSO (QaQ, local):**

```bash
aws configure sso           # SSO-session yIchenmoH (admin start-URL nob)
aws sso login --sso-session my-sso
```

Terraform — latlh config 'utbe' — AWS-provider SSO-cached-credentials nIteb laD.

**DuH B — IAM-user, Access-Keys (classic):**
AWS Console → IAM → Users → lo'wI' yIwIv → *Security credentials* →
*Create access key* → type "Local code" pagh latlh → Access-Key-ID + Secret —
wa' poH neH leghlu'.

**DuH C — CI (GitHub Actions 'ej latlh):** static-keys tu'lu'be' —
`aws-actions/configure-aws-credentials` — OIDC-role (repo-Daq `trust policy`).

## 2. Terraform-Daq Qum

Provider-block — credentials Hutlh QaQ; standard Env-Vars yIlo':

```bash
export AWS_ACCESS_KEY_ID="AKIA…"
export AWS_SECRET_ACCESS_KEY="…"
export AWS_REGION="eu-central-1"
# SSO/CLI-login: pagh yIexportQo'
```

```hcl
provider "aws" {
  region = "eu-central-1"
}
```

## 3. yIqIm!

- Access-Keys, provider-block-Daq tu'lu'bogh — peghmey map 'oH. reH
  Env-Vars/SSO yIlo'; `.tfvars`-Daq peghmey reHbe' commit.
- Root-account-credentials — Terraform-Daq reHbe' tu'lu' (IAM-user, least privilege;
  tests tier Huch Hutlh vaD `PowerUserAccess` yap — pagh mach).
- accounts, plan Huch Hutlh, — jav jar qaSpu'DI' mev. keys/state yIqan — mevpa'.

## Sources

- Provider-auth: <https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration>
- IAM access-keys: <https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html>
