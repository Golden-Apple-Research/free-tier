# Google Cloud — Auth vaD Terraform

> **`gcloud auth application-default login`** (user-credentials) — local vaD;
> **Service-Account** — CI vaD. google-provider — application-default-credentials
> (ADC) nIteb laD.

## 1. credential yIchenmoH

**DuH A — user-login via ADC (QaQ, local):**

```bash
gcloud auth login                        # login — gcloud nIteb vaD
gcloud auth application-default login    # login — Terraform/SDKs vaD ('ut!)
gcloud config set project my-free-project
```

**DuH B — Service Account (CI):**
Console → IAM & Admin → Service Accounts → Create → *Keys* →
*Add key* → JSON yIchenmoH (wa' poH neH download).

**DuH C — CI, key-file Hutlh:** workload-identity-federation
(GitHub Actions: `google-github-actions/auth` — OIDC) — JSON-file tu'lu'be'.

## 2. Terraform-Daq Qum

```bash
export GOOGLE_APPLICATION_CREDENTIALS="/pfad/zu/sa-key.json"  # DuH B neH
# DuH A: pagh 'utbe'
```

```hcl
provider "google" {
  project = "my-free-project"
  region  = "us-central1" # Always-Free region!
}
```

## 3. yIqIm!

- Free-trial/$300 Huch — Qu'-Daq **billing-account** 'ut je. Hutlhchugh —
  services law' (Cloud Run 'ej latlh) creation refuse.
- Service-account-JSON — full key 'oH. leak qaSpu'DI' — IAM-Daq DaH
  yIdeactivate. production vaD — workload-identity yIwIv.
- **Region — auth qaSpa' yIwIv:** Always Free — us-west1/us-central1/us-east1
  neH (TERRAFORM.md yIlaD) — `region`/`zone` — QaQ yIlo'.

## Sources

- Provider-auth: <https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference>
- ADC: <https://cloud.google.com/docs/authentication/provide-credentials-adc>
