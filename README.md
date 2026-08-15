# Free-Tier — Kontingente, Terraform & Auth für 16 Dienste

> Referenz für **kostenlose Kontingente** (Always Free & Free Tier), **Terraform-Support**
> und **Auth-Methoden** von 16 Cloud- und SaaS-Diensten — dazu vier kombinierte
> Beispiel-Projekte und eine generierte Dokumentations-Website (Astro Starlight).
> Stand: August 2026.

## Struktur

| Pfad | Inhalt |
|---|---|
| [`content/de/`](content/de/) | Kanonischer Content (Deutsch): je Provider `FREE-TIER.md`, `TERRAFORM.md` und `README.md` (Auth) — plus [`helpers.md`](content/de/helpers.md) (Skills & MCP-Server) und [`index.md`](content/de/index.md) (Website-Landing) |
| [`content/en/`](content/en/) | Englische Übersetzung als **„Pirate Edition“** 🏴‍☠️ (Piraten-Englisch, gleiche Baumstruktur wie `content/de/`) |
| [`examples/`](examples/) | Vier Beispiel-Projekte (Terraform/Terranix), die mehrere Provider kombinieren |
| [`docs-site/`](docs-site/) | Starlight-Website — wird per Sync-Skript aus `content/` + `examples/` generiert |
| [`.github/workflows/docs.yml`](.github/workflows/docs.yml) | Deploy der Website auf GitHub Pages |

Weitere Sprachen lassen sich als Geschwister anlegen (`content/tlh/` …, siehe
[`docs-site/README.md`](docs-site/README.md)) — nicht übersetzte Seiten fallen
automatisch auf Deutsch zurück. `content/en/` ist als „Pirate Edition“ vollständig
übersetzt; die Website zeigt Deutsch unter `/de/` und Pirate-Englisch unter `/en/`.

## Website

```bash
cd docs-site
bun install
bun run dev        # http://localhost:4321 → leitet auf /de/ weiter
```

Auf GitHub: Workflow deployt bei jedem Push auf `main` (einmalig
**Settings → Pages → Source „GitHub Actions“** setzen).

## Beispiel-Projekte

| Beispiel | Kombination |
|---|---|
| [01-todo-app](examples/01-todo-app/) | Vercel + Supabase + Cloudflare R2 |
| [02-feedback-api](examples/02-feedback-api/) | Cloud Run + Neon + Grafana Cloud |
| [03-image-pipeline](examples/03-image-pipeline/) | Supabase + Modal + CircleCI |
| [04-medusa-shop](examples/04-medusa-shop/) | Terranix/NixOS: Hetzner + Keycloak + Supabase + Cloudflare + Stripe + Grafana |
