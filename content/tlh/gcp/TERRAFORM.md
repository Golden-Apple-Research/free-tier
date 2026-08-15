# Google Cloud + Terraform

> Official provider `hashicorp/google`. Core-trap: Always-Free quotas law' —
> **`us-west1`, `us-central1`, `us-east1` neH** — region — Free-Tier-config
> part 'oH.

## Provider-setup

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
  region  = "us-central1" # Always-Free standard-region
  # Auth: gcloud auth application-default login
  # Free Tier: billing-account, Qu'-Daq, 'ut!
}
```

## Resources-mapping (Always Free)

| Free-Tier-service | Terraform-resource | Free-condition |
|---|---|---|
| Compute Engine e2-micro | `google_compute_instance` | `machine_type = "e2-micro"`, zone — us-west1/central1/east1-Daq, 30 GB `pd-standard` |
| Cloud Run (cha'maH bIp tlhobmey) | `google_cloud_run_v2_service` | pagh |
| Cloud Functions (cha'maH bIp) | `google_cloudfunctions2_function` | pagh |
| Cloud Storage (vagh GB) | `google_storage_bucket` | region us-east1/us-west1/us-central1 |
| BigQuery (wa' TiB queries) | `google_bigquery_dataset` | pagh |
| Firestore | `google_firestore_database` | pagh |
| Artifact Registry (0.5 GB) | `google_artifact_registry_repository` | pagh |
| GKE Autopilot | `google_container_cluster` (Autopilot) | wa' cluster, management-fee Hutlh |

## Example: e2-micro-VM (classic Always-Free-setup)

```hcl
resource "google_compute_instance" "free_vm" {
  name         = "free-vm"
  machine_type = "e2-micro" # Always Free — neH us-west1/us-central1/us-east1-Daq
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 30 # 30 GB standard-PD — tu'lu'
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    # ⚠️ access_config-block Hutlh: external-IP tu'lu'be' (recommended —
    # external IPv4, 2024-vo', ~$3–4/Hoch jar; latlh: Cloudflare-Tunnel/IAP yIlo').
    access_config {}
  }
}
```

## Gotchas

1. **region — Hoch qaSpa' yIwIv** — `europe-west3` 'ej latlh — DaH standard
   Huchmey. `region`/`zone` — variables, wej US-regions validation ghajbogh,
   yIchenmoH.
2. external IPv4 — separate Huchmey (FREE-TIER.md yIlaD) —
   "Huch Hutlh VM" — access_config Hutlh — external access tu'lu'be'.
3. Free Tier — Qu'-Daq **billing-account** 'ut je; Hutlhchugh — Cloud
   Run/'ej latlh services — chenmoHlu'be' neH.
4. `google_cloud_run_v2_service` yIlo' (v1 deprecated); 1-GB-Nordamerika
   nob Huch Hutlh ingress/egress — yIlegh.
5. budget-alarm — DaH yIchenmoH je: `google_billing_budget` +
   pub/sub-notification.

## Sources

- Provider: <https://registry.terraform.io/providers/hashicorp/google/latest>
- Free-tier details: <https://cloud.google.com/free/docs/free-cloud-features>
