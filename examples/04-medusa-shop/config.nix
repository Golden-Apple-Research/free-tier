###############################################################################
# Phase 1 „infra" — Hetzner/NixOS + Cloudflare + Supabase + CircleCI + Grafana
#
# Terranix-Modul: jedes `resource.<typ>.<name>` wird 1:1 in Terraform-JSON
# übersetzt. TF-Interpolationen (`${...}`) müssen in Nix-Strings mit `\${`
# maskiert werden.
###############################################################################

{ ... }:

let
  # Hostnames innerhalb der Zone (root_domain ist eine TF-Variable):
  host = prefix: "${prefix}.\${var.root_domain}";

  # Cloud-init-Bootstrap: schreibt TF-Fakten als Dateien auf die Platte,
  # BEVOR nixos-infect das System zu NixOS konvertiert.
  #
  # Die Datei /root/bootstrap/supabase.nix importiert configuration.nix
  # (Pfad-Import!) — so bekommen die NixOS-Optionen den Supabase-Host und
  # die Passwörter, ohne dass Secrets im (öffentlichen!) Shop-Repo lägen.
  cloudInit = ''
    #cloud-config
    write_files:
      - path: /root/bootstrap/medusa-db-password
        permissions: "0600"
        content: ''${var.medusa_db_password}
      - path: /root/bootstrap/supabase-db-password
        permissions: "0600"
        content: ''${var.supabase_db_password}
      - path: /root/bootstrap/secrets.env
        permissions: "0600"
        content: |
          DATABASE_URL=postgres://medusa:''${var.medusa_db_password}@localhost:5432/medusa
      - path: /root/bootstrap/supabase.nix
        permissions: "0600"
        content: |
          # Von Terraform generiert (Phase 1) — importiert von configuration.nix.
          { ... }: {
            services.keycloak.database = {
              host = "db.''${supabase_project.shop.id}.supabase.co";
              port = 5432;
              database = "postgres";
              username = "postgres";
              passwordFile = "/root/bootstrap/supabase-db-password";
            };
            services.keycloak.initialAdminPassword = "''${var.keycloak_admin_password}";
          }
    runcmd:
      - [ sh, -c, "curl -s https://raw.githubusercontent.com/elitak/nixos-infect/master/nixos-infect | NIX_CHANNEL=''${var.nixos_channel} PROVIDER=hetznercloud NIXOS_CONFIG=''${var.repo_config_url} bash" ]
  '';

  # Platzhalter-Worker (klassische Syntax), bis CircleCI per Wrangler deployt.
  placeholderWorker = name: ''
    // ${name} — Platzhalter aus Terranix (Phase 1).
    // Das echte Deploy läuft über Wrangler aus CircleCI (deploy-storefronts).
    // `lifecycle.ignore_changes` unten verhindert Drift zwischen TF und CI.
    addEventListener("fetch", (event) => {
      event.respondWith(new Response("Storefront noch nicht deployt — Wrangler-Deploy aus CircleCI ausführen.", { status: 200 }));
    });
  '';
in
{
  terraform.required_version = ">= 1.6";

  terraform.required_providers = {
    hcloud = { source = "hetznercloud/hcloud"; version = "~> 1.68"; };
    cloudflare = { source = "cloudflare/cloudflare"; version = "~> 5.23"; };
    supabase = { source = "supabase/supabase"; version = "~> 1.0"; };
    circleci = { source = "CircleCI-Public/circleci"; version = "~> 0.4"; };
    grafana = { source = "grafana/grafana"; version = ">= 3.0"; };
    random = { source = "hashicorp/random"; version = "~> 3.6"; };
  };

  # Auth über Env-Variablen (siehe ../<provider>/README.md):
  #   HCLOUD_TOKEN, CLOUDFLARE_API_TOKEN, SUPABASE_ACCESS_TOKEN,
  #   GRAFANA_CLOUD_ACCESS_POLICY_TOKEN — nur CircleCI hat kein Env-Support:
  provider.hcloud = { };
  provider.cloudflare = { };
  provider.supabase = { };
  provider.circleci = {
    host = "https://circleci.com/api/v2";
    key = "\${var.circleci_api_key}"; # kein Env-Support → TF_VAR (circle-ci/README.md)
  };
  provider.grafana = [ { alias = "cloud"; } ];

  # --- Variablen ---------------------------------------------------------------

  variable.root_domain = {
    description = "Haupt-Domain (Zone liegt bei Cloudflare)";
    type = "string";
  };
  variable.cloudflare_zone_id = { description = "Zone-ID der Haupt-Domain"; type = "string"; };
  variable.cloudflare_account_id = { description = "Cloudflare Account-ID (für Workers)"; type = "string"; };
  variable.supabase_org_id = { description = "Supabase Org-Slug (supabase/README.md)"; type = "string"; };
  variable.circleci_org_id = { description = "CircleCI Organization-ID"; type = "string"; };
  variable.circleci_api_key = { description = "CircleCI Personal API Token"; type = "string"; sensitive = true; };

  variable.ssh_public_key = { description = "Öffentlicher SSH-Key (Admin + nixos-infect)"; type = "string"; };
  variable.ssh_private_key_b64 = {
    description = "Passwortloser Deploy-Key für CircleCI, base64-kodiert (ssh-keyscan/SSH_HOST siehe README)";
    type = "string";
    sensitive = true;
  };

  variable.repo_config_url = {
    description = "Raw-URL der NixOS-configuration.nix im (hypothetischen) Shop-Repo";
    type = "string";
    default = "https://raw.githubusercontent.com/acme/medusa-shop/main/nixos/configuration.nix";
  };
  variable.nixos_channel = {
    description = "NixOS-Kanal für nixos-infect";
    type = "string";
    default = "nixos-26.05";
  };

  # Passwörter (nur alphanumerisch — landen in cloud-init/psql/env-Dateien):
  variable.medusa_db_password = { type = "string"; sensitive = true; };
  variable.supabase_db_password = {
    description = "Supabase-DB-Passwort (Keycloak-Anbindung)";
    type = "string";
    sensitive = true;
  };
  variable.keycloak_admin_password = { type = "string"; sensitive = true; };

  variable.stripe_api_key = { type = "string"; sensitive = true; };
  variable.stripe_webhook_secret = { type = "string"; sensitive = true; };
  variable.cloudflare_deploy_token = {
    description = "Eingeschränkter CF-Token nur für Wrangler-Deploys (CI)";
    type = "string";
    sensitive = true;
  };
  variable.grafana_metrics_username = {
    description = "Prometheus-Instance-ID aus den Stack-Details (für Alloy basic_auth)";
    type = "string";
  };

  # --- Hetzner: VPS, der sich per nixos-infect selbst zu NixOS macht ------------

  resource.hcloud_ssh_key.admin = {
    name = "medusa-admin";
    public_key = "\${var.ssh_public_key}";
  };

  resource.hcloud_firewall.shop = {
    name = "medusa-shop";
    rule = [
      { direction = "in"; protocol = "tcp"; port = "22"; source_ips = [ "0.0.0.0/0" "::/0" ]; } # ← Demo; produktiv auf eigene IPs beschränken!
      { direction = "in"; protocol = "tcp"; port = "80"; source_ips = [ "0.0.0.0/0" "::/0" ]; }
      { direction = "in"; protocol = "tcp"; port = "443"; source_ips = [ "0.0.0.0/0" "::/0" ]; }
      { direction = "in"; protocol = "icmp"; source_ips = [ "0.0.0.0/0" "::/0" ]; }
    ];
  };

  resource.hcloud_server.shop = {
    name = "medusa-shop";
    server_type = "cx22"; # 2 vCPU / 4 GB — kleinster Typ, auf dem Medusa+Keycloak+PG+Redis laufen
    location = "nbg1";
    image = "debian-12"; # Startsystem; nixos-infect konvertiert es (NIXOS_CONFIG s. cloud-init)
    ssh_keys = [ "\${hcloud_ssh_key.admin.name}" ];
    firewall_ids = [ "\${hcloud_firewall.shop.id}" ];
    user_data = cloudInit; # siehe `let` oben
    labels = { project = "medusa-shop"; managed_by = "terranix"; };
    delete_protection = false;
  };

  # --- Cloudflare: DNS + zwei Storefront-Worker ---------------------------------

  # api/auth zeigen direkt (ungefiltert) auf die VPS — Let's Encrypt (Caddy)
  # braucht direkte HTTP-01-Treffbarkeit; shop/b2b sind orange (proxied),
  # damit die Worker-Routen greifen:
  resource.cloudflare_dns_record.api = {
    zone_id = "\${var.cloudflare_zone_id}";
    name = host "api";
    content = "\${hcloud_server.shop.ipv4_address}";
    type = "A";
    ttl = 1; # auto
    proxied = false;
  };
  resource.cloudflare_dns_record.auth = {
    zone_id = "\${var.cloudflare_zone_id}";
    name = host "auth";
    content = "\${hcloud_server.shop.ipv4_address}";
    type = "A";
    ttl = 1;
    proxied = false;
  };
  resource.cloudflare_dns_record.shop = {
    zone_id = "\${var.cloudflare_zone_id}";
    name = host "shop";
    content = "\${hcloud_server.shop.ipv4_address}"; # egal — Route fängt den Traffic am Edge ab
    type = "A";
    ttl = 1;
    proxied = true; # Pflicht für Workers-Routen
  };
  resource.cloudflare_dns_record.b2b = {
    zone_id = "\${var.cloudflare_zone_id}";
    name = host "b2b";
    content = "\${hcloud_server.shop.ipv4_address}";
    type = "A";
    ttl = 1;
    proxied = true;
  };

  resource.cloudflare_workers_script.storefront_b2c = {
    account_id = "\${var.cloudflare_account_id}";
    script_name = "storefront-b2c";
    compatibility_date = "2026-08-01";
    content = placeholderWorker "storefront-b2c";
    lifecycle = { ignore_changes = [ "content" ]; }; # CI deployt via Wrangler weiter
  };
  resource.cloudflare_workers_script.storefront_b2b = {
    account_id = "\${var.cloudflare_account_id}";
    script_name = "storefront-b2b";
    compatibility_date = "2026-08-01";
    content = placeholderWorker "storefront-b2b";
    lifecycle = { ignore_changes = [ "content" ]; };
  };

  resource.cloudflare_workers_route.b2c = {
    zone_id = "\${var.cloudflare_zone_id}";
    pattern = "\${cloudflare_dns_record.shop.name}/*";
    script = "\${cloudflare_workers_script.storefront_b2c.script_name}";
  };
  resource.cloudflare_workers_route.b2b = {
    zone_id = "\${var.cloudflare_zone_id}";
    pattern = "\${cloudflare_dns_record.b2b.name}/*";
    script = "\${cloudflare_workers_script.storefront_b2b.script_name}";
  };

  # --- Supabase: Postgres für Keycloak (Cross-Cloud-Bindung) ---------------------

  resource.supabase_project.shop = {
    organization_id = "\${var.supabase_org_id}";
    name = "medusa-shop";
    region = "eu-central-1";
    instance_size = "micro"; # Free-Plan
    database_password = "\${var.supabase_db_password}"; # landet via cloud-init in /root/bootstrap/supabase-db-password
    # Achtung Free-Limit: nur 2 Projekte pro Org (supabase/FREE-TIER.md)
  };

  # --- CircleCI: alles, was CI zum Deployen braucht ------------------------------

  resource.circleci_context.medusa_shop = {
    organization_id = "\${var.circleci_org_id}";
    name = "medusa-shop"; # referenziert von .circleci/config.yml
  };

  resource.circleci_context_environment_variable.secrets = {
    for_each = {
      SSH_HOST = "\${hcloud_server.shop.ipv4_address}";
      SSH_PRIVATE_KEY_B64 = "\${var.ssh_private_key_b64}";
      CLOUDFLARE_API_TOKEN = "\${var.cloudflare_deploy_token}";
      CLOUDFLARE_ACCOUNT_ID = "\${var.cloudflare_account_id}";
      STRIPE_API_KEY = "\${var.stripe_api_key}"; # Medusa-Plugin (siehe README)
      STRIPE_WEBHOOK_SECRET = "\${var.stripe_webhook_secret}";
      GRAFANA_METRICS_USER = "\${var.grafana_metrics_username}";
      GRAFANA_TOKEN = "\${grafana_cloud_stack_service_account_token.monitoring.key}";
    };
    context_id = "\${circleci_context.medusa_shop.id}";
    name = "\${each.key}";
    value = "\${each.value}"; # Werte sind im State → Backend verschlüsseln
  };

  # --- Grafana Cloud: Monitoring-Stack + Token für Alloy auf der VPS -------------

  resource.grafana_cloud_stack.monitoring = {
    provider = "grafana.cloud";
    name = "medusa-shop";
    slug = "medusashop"; # nur Kleinbuchstaben/Ziffern
    region_slug = "eu";
  };

  resource.grafana_cloud_stack_service_account.monitoring = {
    provider = "grafana.cloud";
    stack_slug = "\${grafana_cloud_stack.monitoring.slug}";
    name = "alloy";
    role = "Admin"; # Demo; minimaler: Editor + eigene Access-Policy
  };

  resource.grafana_cloud_stack_service_account_token.monitoring = {
    provider = "grafana.cloud";
    stack_slug = "\${grafana_cloud_stack.monitoring.slug}";
    service_account_id = "\${grafana_cloud_stack_service_account.monitoring.id}";
    name = "alloy-vps";
  };

  # --- Outputs -------------------------------------------------------------------

  output.server_ipv4 = { value = "\${hcloud_server.shop.ipv4_address}"; };
  output.server_ipv6 = { value = "\${hcloud_server.shop.ipv6_address}"; };
  output.api_url = { value = "https://\${cloudflare_dns_record.api.name}"; };
  output.auth_url = { value = "https://\${cloudflare_dns_record.auth.name}"; };
  output.shop_url = { value = "https://\${cloudflare_dns_record.shop.name}"; };
  output.b2b_url = { value = "https://\${cloudflare_dns_record.b2b.name}"; };
  output.keycloak_db_host = {
    description = "Direkt-Host des Supabase-Postgres (IPv6-only!)";
    value = "db.\${supabase_project.shop.id}.supabase.co";
  };
  output.grafana_url = { value = "\${grafana_cloud_stack.monitoring.url}"; };
  output.grafana_alloy_token = {
    description = "Für Alloy auf der VPS (schreibt CI nach /etc/alloy/secrets.env)";
    value = "\${grafana_cloud_stack_service_account_token.monitoring.key}";
    sensitive = true;
  };
}
