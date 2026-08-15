# Google Cloud + Terraform

> Official provider `hashicorp/google`. Core stumbling block: many
> Always-Free quotas apply **only in `us-west1`, `us-central1`, `us-east1`**
> — so the region be part o' the free-tier configuration itself. Chart yer
> course to the three blessed harbors, or the free flag never flies. The
> Crown built its free warehouses on the far side o' the western ocean, an'
> there they stay — a privateer sails where the doubloons be, not where
> the winds feel pleasant.

## Provider Setup

```hcl
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-central1" # the standard Always Free region
  # Auth: gcloud auth application-default login
  # Free Tier requires a billing account on the project!
}
```

## Resource Mapping (Always Free)

The free fleet an' where each ship be anchored:

| Free-tier service | Terraform resource | Free condition |
|---|---|---|
| Compute Engine e2-micro | `google_compute_instance` | `machine_type = "e2-micro"`, zone in us-west1/central1/east1, 30 GB `pd-standard` |
| Cloud Run (2 Mio. requests) | `google_cloud_run_v2_service` | none |
| Cloud Functions (2 Mio.) | `google_cloudfunctions2_function` | none |
| Cloud Storage (5 GB) | `google_storage_bucket` | region us-east1/us-west1/us-central1 |
| BigQuery (1 TiB queries) | `google_bigquery_dataset` | none |
| Firestore | `google_firestore_database` | none |
| Artifact Registry (0.5 GB) | `google_artifact_registry_repository` | none |
| GKE Autopilot | `google_container_cluster` (Autopilot) | 1 cluster without management fee |

## Example: e2-micro VM (classic Always-Free setup)

The trusty workhorse o' the free fleet — a wee sloop that costs nothin'
but the wind:

```hcl
resource "google_compute_instance" "free_vm" {
  name         = "free-vm"
  machine_type = "e2-micro" # Always Free — ONLY in us-west1/us-central1/us-east1
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 30 # 30 GB standard PD included
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    # ⚠️ Without the access_config block: no external IP (recommended, since
    # external IPv4 has cost ~$3–4/month since 2024 — otherwise use Cloudflare Tunnel/IAP).
    access_config {}
  }
}
```

## Gotchas

1. **Decide the region before everything else** — `europe-west3` & co.
   immediately fall under normal billing. Best to set `region`/`zone` as
   variables with validation on the three US regions. Set sail fer the
   blessed harbors, or the toll collectors board ye at once. That's not
   what you expected, eh? Aye — free waters be charted, paid waters be not.
2. External IPv4 be billed separately (see FREE-TIER.md) — the "free VM" be
   unreachable from outside without access_config. The free ship floats,
   but without a gangplank no visitor can board.
3. Free Tier still needs a **billing account** on the project — without it,
   Cloud Run & co. sometimes won't even be created. The tavern keeps a tab
   even fer free rum — show ye're good fer it, an' the barrels open.
4. Use `google_cloud_run_v2_service` (v1 be outdated); keep an eye on the
   1 GB North America free egress amount. The old hull be sunk; sail the
   new one, an' watch the egress like the tide.
5. Build in a budget alert right away: `google_billing_budget` + Pub/Sub
   notification. Rrr, that's what we pirates like — watch the doubloons so
   the bill never sneaks up on ye from the fog.

## Sources

- Provider: <https://registry.terraform.io/providers/hashicorp/google/latest>
- Free-tier details: <https://cloud.google.com/free/docs/free-cloud-features>
