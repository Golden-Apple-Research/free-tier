# Example 2: Feedback API (GCP Cloud Run + Neon + Grafana Cloud)

> A container backend, realistically spread across three clouds: stateless
> API on Cloud Run (Always Free), serverless Postgres on Neon (Free), free
> monitoring stack on Grafana Cloud. Terraform wires the connection
> strings straight into the container.

## Architecture

```
Client ──▶ Cloud Run (us-central1)          [2M req/month free]
             │  env: DATABASE_URL(_POOLED)
             └───▶ Neon (aws-us-east-1)     [Free: 0.5 GB, 100 CU-h/month]

Ops ────▶ Grafana Cloud free stack ("us")   [10k series, 3 users]
             └─ stack URL + token (output) → second TF module for dashboards
```

## Prerequisites (Auth)

| Env var / TF var | Source | Instructions |
|---|---|---|
| — (`gcloud auth application-default login`) | GCP ADC | [../../content/de/gcp/README.md](../../content/de/gcp/README.md) |
| `TF_VAR_gcp_project_id` | Project **with a billing account** | — |
| `NEON_API_KEY` | Console → Account settings → API keys | [../../content/de/neon/README.md](../../content/de/neon/README.md) |
| `GRAFANA_CLOUD_ACCESS_POLICY_TOKEN` | Portal → Access Policies (Scopes: `stacks:*`, `accesspolicies:*`, `stack-service-accounts:write`) | [../../content/de/grafana/README.md](../../content/de/grafana/README.md) |

## Running

```bash
cd examples/02-feedback-api
terraform init
terraform plan
terraform apply

terraform output api_url              # public API URL
curl "$(terraform output -raw api_url)"
```

Your own API: point `TF_VAR_api_image` at your own image (e.g. from the
Artifact Registry — 0.5 GB free, see gcp/FREE-TIER.md).

## What this example shows

- **Cross-cloud env injection:** Neon role + generated password + endpoint
  host are assembled into `DATABASE_URL` and pushed into the container
  via interpolation — never copy manually, never into plaintext files.
- **Direct vs. pooled connection:** Cloud Run scales containers instantly —
  for many short-lived connections the Neon pooler is the right choice
  (endpoint console; provider 0.1.x does not yet export a host for it,
  see neon/FREE-TIER.md).
- **Latency across cloud boundaries:** Neon `aws-us-east-1` next to Cloud
  Run `us-central1` — region choice is part of the free-tier strategy.
- **Two-level Grafana pattern:** stack + token here; dashboards/datasources
  in a second root module with `provider "grafana" { url, auth }`
  (pattern: grafana/TERRAFORM.md — URL/token are only known after apply).

## Free tier notes

- **Cloud Run:** 2M requests + 360k GB-s storage/month free — the region
  is validated against us-west1/us-central1/us-east1 via a variable.
- **Neon Free:** 100 CU-h/month, 0.5 GB; scale-to-zero after 5 min → the
  first query after a pause hits a cold start.
- **Grafana Free:** 1 stack, 3 active users, 10k series, 14 days
  retention.
- **GCP:** even Always Free needs a billing account on the project — build
  the budget alert (`google_billing_budget`) right away (gcp/TERRAFORM.md).

## Cleanup

```bash
terraform destroy
```

⚠️ The Neon project including its data is deleted. Save
`terraform output -raw database_url` beforehand if you want to keep the
DB.
