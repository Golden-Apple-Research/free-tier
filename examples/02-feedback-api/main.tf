###############################################################################
# Beispiel 2: Feedback-API — GCP Cloud Run + Neon + Grafana Cloud
#
# Container-Backend über drei Clouds:
#   • GCP Cloud Run (Always Free: 2 Mio. Requests/Monat) — API-Container
#   • Neon (Free)             — serverless Postgres, URI per Env-Var injiziert
#   • Grafana Cloud (Free)    — Monitoring-Stack + Service-Account-Token
#
# Der Kleber: Neon liefert Role+Passwort+Host, Terraform baut daraus die
# DATABASE_URL und schiebt sie in den Cloud-Run-Container.
###############################################################################

terraform {
  required_version = ">= 1.6"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0"
    }
    neon = {
      source = "terraform-community-providers/neon" # Community-Provider, s. neon/
    }
    grafana = {
      source  = "grafana/grafana"
      version = ">= 3.0"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  # Auth: gcloud auth application-default login (siehe ../gcp/README.md)
}

provider "neon" {} # NEON_API_KEY

provider "grafana" {
  alias = "cloud"
  # Token via GRAFANA_CLOUD_ACCESS_POLICY_TOKEN — Scopes siehe grafana/README.md
}

variable "gcp_project_id" {
  description = "GCP-Projekt mit verknüpftem Billing-Konto (Pflicht für Cloud Run)"
  type        = string
}

variable "gcp_region" {
  description = "Cloud-Run-Region — Always-Free-Kontingente gelten nur in den USA-Regionen"
  type        = string
  default     = "us-central1"

  validation {
    condition     = contains(["us-west1", "us-central1", "us-east1"], var.gcp_region)
    error_message = "Free-Tier nur in us-west1 / us-central1 / us-east1 (siehe gcp/FREE-TIER.md)."
  }
}

variable "api_image" {
  description = "Container-Image der API — durch das eigene ersetzen"
  type        = string
  default     = "us-docker.pkg.dev/cloudrun/container/hello" # Hello-Platzhalter
}

# --- Neon: Postgres in GCP-Nähe ----------------------------------------------
# aws-us-east-1 liegt nahe an us-central1 — Latenz über Cloud-Grenzen mitdenken.

resource "neon_project" "feedback" {
  name      = "feedback-api"
  region_id = "aws-us-east-1"
  # Default-Branch wird automatisch angelegt; .branch.id und
  # .branch.endpoint.host sind computed (erst nach dem Apply bekannt).
}

# Rolle für die App — das Passwort wird generiert (computed, sensitive):
resource "neon_role" "app" {
  project_id = neon_project.feedback.id
  branch_id  = neon_project.feedback.branch.id
  name       = "feedback_admin"
}

# Datenbank, gehört der App-Rolle:
resource "neon_database" "feedback" {
  project_id = neon_project.feedback.id
  branch_id  = neon_project.feedback.branch.id
  name       = "feedback"
  owner_name = neon_role.app.name

  depends_on = [neon_role.app]
}

locals {
  # Der Provider 0.1.x exportiert (noch) keine fertige connection_uri — die
  # Attribute dafür existieren erst im unveröffentlichten Master-Zweig. URI
  # daher aus Role + generiertem Passwort + Endpoint-Host selbst bauen:
  database_url = "postgres://${neon_role.app.name}:${urlencode(neon_role.app.password)}@${neon_project.feedback.branch.endpoint.host}/${neon_database.feedback.name}"

  # Hinweis: Für Serverless-Workloads mit vielen kurzen Verbindungen nutzt
  # man zusätzlich den Neon-Pooler (Host mit "-pooler" im Console-Output);
  # der Provider 0.1.x exportiert dafür noch keinen eigenen Host.
}

# --- GCP Cloud Run: API-Container mit DB-Verdrahtung -------------------------

resource "google_cloud_run_v2_service" "api" {
  name     = "feedback-api"
  location = var.gcp_region

  deletion_protection = false # Demo; Produktion: true (Default)
  ingress             = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = var.api_image

      env {
        name  = "DATABASE_URL"
        value = local.database_url
      }

      resources {
        limits = {
          cpu    = "1"
          memory = "512Mi"
        }
      }
    }
  }
}

# Öffentlicher, unauthentifizierter Zugriff für die Demo-API:
resource "google_cloud_run_service_iam_binding" "public" {
  location = google_cloud_run_v2_service.api.location
  service  = google_cloud_run_v2_service.api.name
  role     = "roles/run.invoker"
  members  = ["allUsers"]
}

# --- Grafana Cloud: Free-Stack für Metriken der API --------------------------

resource "grafana_cloud_stack" "obs" {
  provider    = grafana.cloud
  name        = "feedback-obs"
  slug        = "feedbackobs" # nur Kleinbuchstaben/Ziffern, kein Bindestrich
  region_slug = "us"          # "us" = US-Stack; Alternativen: "eu", "au", …
}

resource "grafana_cloud_stack_service_account" "tf" {
  provider   = grafana.cloud
  stack_slug = grafana_cloud_stack.obs.slug
  name       = "terraform"
  role       = "Admin"
}

resource "grafana_cloud_stack_service_account_token" "tf" {
  provider           = grafana.cloud
  stack_slug         = grafana_cloud_stack.obs.slug
  service_account_id = grafana_cloud_stack_service_account.tf.id
  name               = "tf-token"
}

# Dashboards/Datasources brauchen den Stack-Provider (url+token erst nach
# Apply bekannt) → in ein zweites Root-Modul auslagern; Muster siehe
# grafana/TERRAFORM.md (Zwei-Ebenen-Setup).

# --- Outputs -----------------------------------------------------------------

output "api_url" {
  value = google_cloud_run_v2_service.api.uri
}

output "database_url" {
  description = "postgres://… — für lokale Entwicklung/psql"
  value       = local.database_url
  sensitive   = true
}

output "grafana_stack_url" {
  value = grafana_cloud_stack.obs.url
}

output "grafana_stack_token" {
  description = "Für den Stack-Provider (url + auth) im zweiten Modul"
  value       = grafana_cloud_stack_service_account_token.tf.key
  sensitive   = true
}
