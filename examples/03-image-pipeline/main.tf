###############################################################################
# Beispiel 3: Bild-Pipeline — Supabase + Modal + CircleCI
#
# Hybrid-IaC über drei Anbieter:
#   • Supabase (Free)  — Postgres für Job-Ergebnisse (image-pipeline)
#   • Modal (Free $30) — serverloser Compute; App wird per Python-SDK
#                        deployt (modal/TERRAFORM.md: idiomatischer Weg)
#   • CircleCI (Free)  — deployt `modal deploy app.py` aus CI
#
# Terraform ist hier der Credential-Broker: Supabase-Keys und das Modal-
# Token-Paar landen im TF-verwalteten CircleCI-Context — CI braucht keine
# manuell gepflegten Secrets mehr.
###############################################################################

terraform {
  required_version = ">= 1.6"

  required_providers {
    supabase = {
      source  = "supabase/supabase"
      version = "~> 1.0"
    }
    circleci = {
      source  = "CircleCI-Public/circleci"
      version = "~> 0.4"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "supabase" {} # SUPABASE_ACCESS_TOKEN

provider "circleci" {
  host = "https://circleci.com/api/v2"
  key  = var.circleci_api_key # kein Env-Support → TF_VAR (circle-ci/README.md)
}

variable "supabase_org_id" {
  description = "Supabase Org-Slug (aus der Dashboard-URL)"
  type        = string
}

variable "circleci_org_id" {
  description = "CircleCI Organization-ID (Org Settings → Overview)"
  type        = string
}

variable "circleci_api_key" {
  description = "CircleCI Personal API Token"
  type        = string
  sensitive   = true
}

# Modal-Token-Paar einmalig erzeugen: `modal token new` (modal/README.md)
variable "modal_token_id" {
  type      = string
  sensitive = true
}

variable "modal_token_secret" {
  type      = string
  sensitive = true
}

# --- Supabase: Ergebnis-Datenbank --------------------------------------------

resource "random_password" "db" {
  length  = 24
  special = false
}

resource "supabase_project" "pipeline" {
  organization_id   = var.supabase_org_id
  name              = "image-pipeline"
  database_password = random_password.db.result
  region            = "eu-central-1"
  instance_size     = "micro" # Free-Plan
}

data "supabase_apikeys" "pipeline" {
  project_ref = supabase_project.pipeline.id
}

# --- CircleCI: TF-verwalteter Deploy-Context ---------------------------------

resource "circleci_context" "deploy" {
  organization_id = var.circleci_org_id
  name            = "image-pipeline" # referenziert von .circleci/config.yml
}

locals {
  deploy_env = {
    # Für `modal deploy` in CI:
    MODAL_TOKEN_ID     = var.modal_token_id
    MODAL_TOKEN_SECRET = var.modal_token_secret
    # Für Smoke-Tests / Seed-Jobs in CI:
    SUPABASE_URL              = "https://${supabase_project.pipeline.id}.supabase.co"
    SUPABASE_SERVICE_ROLE_KEY = data.supabase_apikeys.pipeline.service_role_key
  }
}

resource "circleci_context_environment_variable" "deploy" {
  for_each = local.deploy_env

  context_id = circleci_context.deploy.id
  name       = each.key
  value      = each.value # Werte sind im State → Backend verschlüsseln
}

# --- Outputs -----------------------------------------------------------------

output "supabase_url" {
  value = "https://${supabase_project.pipeline.id}.supabase.co"
}

output "supabase_service_role_key" {
  description = "Für `modal secret create supabase …` (siehe README)"
  value       = data.supabase_apikeys.pipeline.service_role_key
  sensitive   = true
}

output "circleci_context" {
  value = circleci_context.deploy.name
}
