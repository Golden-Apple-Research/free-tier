# Examples — Multi-Cloud Terraform Qu'mey

> loS Qu' mach 'ach real. Qu' Hoch — provider law', paq vamvo' — wa' system-Daq
> Qum. Example Hoch — root-module nIteb (HCL pagh — example 4 — Terranix) —
> README Daj je.

## Overview

| example | provider | pattern | Huch Hutlh? |
|---|---|---|---|
| [01-todo-app](01-todo-app/) | Vercel + Supabase + Cloudflare R2 | JAMstack: frontend ↔ DB/Auth ↔ object-storage, Env-Vars via Qum | ✅ (Vercel Hobby: non-commercial) |
| [02-feedback-api](02-feedback-api/) | GCP Cloud Run + Neon + Grafana Cloud | container-API ↔ serverless-Postgres (connection-URI injection) + monitoring-stack | ✅ (GCP: billing-account 'ut) |
| [03-image-pipeline](03-image-pipeline/) | Supabase + Modal + CircleCI | hybrid-IaC: TF — credential-broker; Modal-app — SDK via; CI-vo' deploy | ✅ |
| [04-medusa-shop](04-medusa-shop/) | Hetzner (NixOS via Terranix!) + Cloudflare Workers + Supabase + Keycloak + CircleCI + Grafana Cloud (+ Stripe via CI) | complete webshop: VPS-lIj — OIDC/DB-core; edge-storefronts; social-login — RBAC-harmonization | ⚠️ (Hetzner paid, ~€4/Hoch jar — latlh Huch Hutlh) |

## nuq Qu' vam leghmoH

1. **Terraform — glue, clouds qaStaHvIS** — logic: interpolations-Daq.
   Neon-connection-strings — Cloud Run-Daq, Env-Var; Supabase-keys —
   Vercel-Env-Vars; Modal-tokens — CircleCI-context-Daq.
2. **TF 'ej SDK — idiomatic mix** — example 3: Modal-function — CI-vo',
   Python-SDK via, deploy — intentional (`modal/TERRAFORM.md` yIlaD);
   Terraform — Qu' neH, TF QaQbogh — ra'.
3. **Auth — READMEs pab** — Auth-variable Hoch (token, org-ID, account-ID) —
   `../<provider>/README.md`-Daq qonlu'. Examples pa'Daq ghoS — qonqa'be'.
4. **Terranix — HCL-alternative** — example 4: complete stack, Nix-vo'.
   Flakes — Terraform-JSON chenmoH; provider-schemas 'ej limits — rap
   (two-phase apply — Keycloak-bootstrap -mo').

## Notes — Hoch vaD

- Examples Hoch — **skeletons, qetlaHbogh**: app-code (Next.js-repo,
  container-image) tu'lu' 'ut pagh replace — Terraform — infrastructure 'ej
  wiring neH chenmoH.
- peghmey — `.tfvars`-Daq reHbe' commit. Env-variables (`TF_VAR_*`) pagh
  peghmey-ra'wI' yIlo' — plaintext-peghmey ghaj state-files.
- `terraform destroy` qaSpa': Gotchas, README-Daj-Daq tu'lu'bogh, yIlaD
  (Supabase-Qu'mey — mev, QIHbe'; `deletion_protection`, …).
