# Examples — Multi-Cloud Terraform Projects

> Four small but realistic example projects, each combining **several
> providers from this repo** into one overall system. Every example is a
> standalone root module (HCL or — in example 4 — Terranix) with its own
> README.

## Overview

| Example | Providers | Pattern | Free tier? |
|---|---|---|---|
| [01-todo-app](01-todo-app/) | Vercel + Supabase + Cloudflare R2 | JAMstack: frontend ↔ DB/auth ↔ object storage, glued together via env vars | ✅ (Vercel Hobby: non-commercial) |
| [02-feedback-api](02-feedback-api/) | GCP Cloud Run + Neon + Grafana Cloud | Container API ↔ serverless Postgres (connection-URI injection) + monitoring stack | ✅ (GCP requires a billing account) |
| [03-image-pipeline](03-image-pipeline/) | Supabase + Modal + CircleCI | Hybrid IaC: TF as credential broker, Modal app via SDK, deployment from CI | ✅ |
| [04-medusa-shop](04-medusa-shop/) | Hetzner (NixOS via Terranix!) + Cloudflare Workers + Supabase + Keycloak + CircleCI + Grafana Cloud (+ Stripe via CI) | Complete web shop: own VPS as OIDC/DB core, edge storefronts, social login with RBAC harmonization | ⚠️ (Hetzner is paid, ~€4/month — the rest is free) |

## What the examples are meant to show

1. **Terraform as glue between clouds** — the actual logic lives in the
   interpolations: Neon connection strings end up as env vars in Cloud
   Run, Supabase keys as Vercel env vars, Modal tokens in the CircleCI
   context.
2. **The idiomatic mix of TF and SDK** — example 3 deliberately deploys
   the Modal function via the Python SDK from CI (cf. `modal/TERRAFORM.md`)
   and lets Terraform manage only what TF is good at.
3. **Auth according to the READMEs** — every auth variable (token, org ID,
   account ID) is documented in `../<provider>/README.md`; the examples
   point there instead of repeating it.
4. **Terranix as an HCL alternative** — example 4 shows the complete stack
   built from Nix: flakes generate Terraform JSON, the same provider
   schemas and limits apply (two-phase apply because of the Keycloak
   bootstrap).

## Common notes

- All examples are **runnable skeletons**: app code (Next.js repo,
  container image) must exist or be substituted — Terraform only builds
  the infrastructure and the wiring.
- Never commit secrets to `.tfvars` — use environment variables
  (`TF_VAR_*`) or a secret manager; state files contain plaintext
  secrets.
- Before `terraform destroy`: read the gotchas in the respective READMEs
  (pause Supabase projects instead of deleting them,
  `deletion_protection`, …).
