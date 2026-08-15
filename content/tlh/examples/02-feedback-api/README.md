# Example 2: Feedback-API (GCP Cloud Run + Neon + Grafana Cloud)

> Container-backend — real, wej clouds qaStaHvIS: stateless API — Cloud Run-Daq
> (reH Huch Hutlh); serverless Postgres — Neon-Daq (Huch Hutlh);
> monitoring-stack — Grafana Cloud-Daq (Huch Hutlh). Terraform —
> connection-strings, container-Daq, wiring.

## Architecture

```
Client ──▶ Cloud Run (us-central1)          [2M tlhobmey/Hoch jar Huch Hutlh]
             │  env: DATABASE_URL(_POOLED)
             └───▶ Neon (aws-us-east-1)     [Free: 0.5 GB, 100 CU-h/Hoch jar]

Ops ────▶ Grafana Cloud Free-Stack ("us")   [10k series, lo'wI'pu' wej]
             └─ Stack-URL + Token (Output) → cha'DIch TF-module — dashboards vaD
```

## nuq 'ut (Auth)

| Env-Var / Var | nuqDaq | yIghoS |
|---|---|---|
| — (`gcloud auth application-default login`) | GCP ADC | [gcp/README.md](../../content/tlh/gcp/README.md) |
| `TF_VAR_gcp_project_id` | Qu' — **billing-account ghajbogh** | — |
| `NEON_API_KEY` | Console → Account settings → API keys | [neon/README.md](../../content/tlh/neon/README.md) |
| `GRAFANA_CLOUD_ACCESS_POLICY_TOKEN` | Portal → Access Policies (Scopes: `stacks:*`, `accesspolicies:*`, `stack-service-accounts:write`) | [grafana/README.md](../../content/tlh/grafana/README.md) |

## yIqet

```bash
cd examples/02-feedback-api
terraform init
terraform plan
terraform apply

terraform output api_url              # public API-URL
curl "$(terraform output -raw api_url)"
```

API-lIj: `TF_VAR_api_image` — image-lIj-Daq yIchenmoH (e.g. artifact-registry-vo' —
0.5 GB Huch Hutlh; gcp/FREE-TIER.md yIlaD).

## nuq example vam leghmoH

- **Cross-cloud env-injection:** Neon-role + password chenmoHpu'bogh +
  endpoint-host — `DATABASE_URL` chenmoH, interpolation via, container-Daq —
  reHbe' manually copy; reHbe' plaintext-files.
- **Direct vs. pooler connection:** Cloud Run — containers, DaH, scale.
  connections mach law' vaD — Neon-pooler — right wIv (endpoint-console;
  provider 0.1.x — host, vaD, exportbe' — neon/FREE-TIER.md yIlaD).
- **Latency, cloud-boundaries qaStaHvIS:** Neon `aws-us-east-1`, Cloud Run
  `us-central1` je — region-wIv — Huch Hutlh-strategy -Daq.
- **Grafana two-level pattern:** stack + token — DaH; dashboards/datasources —
  cha'DIch root-module-Daq, `provider "grafana" { url, auth }` (pattern:
  grafana/TERRAFORM.md — URL/token — apply qaSpu'DI' neH Sovlu').

## Huch Hutlh notes

- **Cloud Run:** cha'maH bIp tlhobmey + wejbIp javnetlh GB-s/Hoch jar — Huch Hutlh; region —
  variable via, us-west1/us-central1/us-east1-Daq validate-lu'.
- **Neon Free:** wa'vatlh CU-h/Hoch jar, 0.5 GB; scale-to-zero — vagh tup qaSpu'DI';
  mev qaSpu'DI' — wa'DIch query — cold-start.
- **Grafana Free:** wa' stack, wej lo'wI'pu' active, wa'netlh series, wa'maH loS jaj retention.
- **GCP:** reH Huch Hutlh je — billing-account 'ut, Qu'-Daq; budget-alarm
  (`google_billing_budget`) — DaH je yIchenmoH (gcp/TERRAFORM.md).

## cleanup

```bash
terraform destroy
```

⚠️ Neon-Qu' — De' je — QIHlu'. `terraform output -raw database_url` —
qaSpa' yIqan, database 'oHtaH 'e' Da nejchugh.
