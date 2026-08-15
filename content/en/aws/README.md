# AWS — Auth fer Terraform

> Preferred: **IAM Identity Center (SSO)** fer local work, **OIDC/AssumeRole**
> fer CI. Classic access keys only as a fallback, like the spare anchor ye hope
> ye never need — an' like the spare anchor, they'll drag ye down if ye're
> careless with 'em.

## 1. Plunder a Credential

**Option A — IAM Identity Center / SSO (recommended, local):**

```bash
aws configure sso           # set up the SSO session (admin provides the start URL)
aws sso login --sso-session my-sso
```

Nothin' more to configure fer Terraform — the AWS provider reads the
SSO-cached credentials automatically. No map, no compass, no fuss. The
cap'n logs in once, an' the whole crew rides his coattails — smooth
sailin' fer the daily work on the free seas.

**Option B — IAM user with access keys (classic):**
AWS Console → IAM → Users → pick a user → *Security credentials* →
*Create access key* → Type "Local code" or similar → Access Key ID + Secret
visible **once** — like a treasure chest that opens but the once. Miss the
moment, an' ye'll be diggin' through yer notes like a landlubber searchin'
fer buried gold with no map.

> *Old salt's tale:* In me younger days I knew a bucko what copied his
> access key into a public repo, bold as brass. Within the hour, some
> bilge rat from the far side o' the globe were spinnin' up GPU galleons
> on his doubloons — mined his treasure dry afore the sun rose. The crew
> called him "Peg-Leg Pete" from that day on. The key, like the leg, went
to Davy Jones' locker. Generate fresh ones, an' guard 'em like yer leg.

**Option C — CI (GitHub Actions etc.):** no static keys —
`aws-actions/configure-aws-credentials` with an OIDC role
(`trust policy` on the repo). The machines talk to each other in secret
whispers — no key to steal, no secret to lose overboard. Dead men tell no
tales, an' stolen keys tell tales o' yer whole treasure.

## 2. Hook it into Terraform

Provider block preferably **without** credentials; use the standard env vars:

```bash
export AWS_ACCESS_KEY_ID="AKIA…"
export AWS_SECRET_ACCESS_KEY="…"
export AWS_REGION="eu-central-1"
# SSO/CLI login: export nothing
```

```hcl
provider "aws" {
  region = "eu-central-1"
}
```

## 3. Notes

- Access keys in the provider block be a treasure map fer leaked secrets —
  always use env vars/SSO, an' never commit secrets in `.tfvars`. A key in
  the code be a key in the hands o' every scallywag what reads yer repo.
- Root-account credentials belong never in Terraform (IAM user with
  least privilege; fer free-tier testing `PowerUserAccess` or less be plenty).
  The cap'n's master key stays on the cap'n's belt — never hand the Crown's
  whole armory to the cabin boy; the crew gets only the cutlasses they need.
- Free-plan accounts close after 6 months — secure keys/state before the
  deadline. That's not what you expected, eh? Aye, the free bounty be
  time-limited, matey — six months o' plunder, then the island sinks. So
  hoist yer sails, grab yer data, an' sail on to the next free shore.

## Sources

- Provider auth: <https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration>
- IAM access keys: <https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html>
