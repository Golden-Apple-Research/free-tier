###############################################################################
# Beispiel 1: Todo-App — Vercel + Supabase + Cloudflare R2
#
# JAMstack-Setup über drei Clouds:
#   • Supabase (Free)  — Postgres + Auth (instance_size "micro", 500 MB)
#   • Cloudflare R2    — S3-Avatar-Uploads (10 GB, Egress 0 $)
#   • Vercel (Hobby)   — Next.js-Frontend, Env-Vars zeigen auf Supabase/R2
#
# Terraform ist der Kleber: ein Apply erzeugt die DB, holt die API-Keys und
# konfiguriert das Frontend. Deploy des Frontends bleibt Aufgabe von git push.
###############################################################################

terraform {
  required_version = ">= 1.6"

  required_providers {
    supabase = {
      source  = "supabase/supabase"
      version = "~> 1.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
    vercel = {
      source  = "vercel/vercel"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

# Token je Env-Var — Anleitung: ../../supabase/README.md usw.
provider "supabase" {}   # SUPABASE_ACCESS_TOKEN
provider "cloudflare" {} # CLOUDFLARE_API_TOKEN (mind. R2:Edit am Account)
provider "vercel" {}     # VERCEL_API_TOKEN

variable "supabase_org_id" {
  description = "Supabase Org-Slug (aus der Dashboard-URL: /org/<slug>/…)"
  type        = string
}

variable "cloudflare_account_id" {
  description = "Cloudflare Account-ID (Dashboard → Overview, rechte Spalte)"
  type        = string
}

variable "vercel_git_repo" {
  description = "GitHub-Repo (owner/name) — muss mit Vercel verbunden sein"
  type        = string
  default     = "me/todo-app"
}

# --- Supabase: Free-Projekt --------------------------------------------------
# Achtung: max. 2 aktive Free-Projekte pro Konto (siehe supabase/FREE-TIER.md).

resource "random_password" "db" {
  length  = 24
  special = false
}

resource "supabase_project" "app" {
  organization_id   = var.supabase_org_id
  name              = "todo-app"
  database_password = random_password.db.result # landet im State → Backend verschlüsseln
  region            = "eu-central-1"
  instance_size     = "micro" # = Free-Plan
}

data "supabase_apikeys" "app" {
  project_ref = supabase_project.app.id # .id == project_ref
}

# --- Cloudflare R2: Avatar-Uploads -------------------------------------------
# Voraussetzung: R2 im Dashboard einmalig aktiviert (Gotcha in cloudflare/).

resource "cloudflare_r2_bucket" "avatars" {
  account_id = var.cloudflare_account_id
  name       = "todo-app-avatars"
}

# --- Vercel: Projekt + Env-Vars (der eigentliche "Kleber") -------------------

resource "vercel_project" "app" {
  name      = "todo-app"
  framework = "nextjs"

  # Funktion-Region — seit Provider 5.x via resource_config-Argument
  # (serverless_function_region ist deprecated):
  resource_config = {
    function_default_regions = ["fra1"] # passt zu Supabase eu-central-1
  }

  git_repository = {
    type = "github"
    repo = var.vercel_git_repo
  }
}

resource "vercel_project_environment_variable" "supabase_url" {
  project_id = vercel_project.app.id
  key        = "NEXT_PUBLIC_SUPABASE_URL"
  value      = "https://${supabase_project.app.id}.supabase.co"
  target     = ["production", "preview"]
  sensitive  = false # Pflicht-Attribut seit Provider 4.8
}

resource "vercel_project_environment_variable" "supabase_anon_key" {
  project_id = vercel_project.app.id
  key        = "NEXT_PUBLIC_SUPABASE_ANON_KEY"
  value      = data.supabase_apikeys.app.anon_key # public by design
  target     = ["production", "preview"]
  sensitive  = false
}

resource "vercel_project_environment_variable" "r2_bucket" {
  project_id = vercel_project.app.id
  key        = "R2_AVATAR_BUCKET"
  value      = cloudflare_r2_bucket.avatars.name
  target     = ["production", "preview"]
  sensitive  = false
}

# --- Outputs -----------------------------------------------------------------

output "supabase_url" {
  value = "https://${supabase_project.app.id}.supabase.co"
}

output "supabase_anon_key" {
  value = data.supabase_apikeys.app.anon_key
}

output "r2_bucket" {
  value = cloudflare_r2_bucket.avatars.name
}

output "vercel_project" {
  value = vercel_project.app.name
}

output "database_password" {
  value     = random_password.db.result
  sensitive = true
}
