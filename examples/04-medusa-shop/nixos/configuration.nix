###############################################################################
# configuration.nix — Medusa-Shop-VPS (Hetzner, via nixos-infect gebootet)
#
# Diese Datei lebt im (hypothetischen) Shop-Repo. nixos-infect lädt sie beim
# Bootstrap über die Raw-URL (NIXOS_CONFIG, siehe config.nix Phase 1); CircleCI
# aktualisiert sie später per `nixos-rebuild switch` (Job deploy-nixos).
#
# Geheimnisse fließen bewusst NICHT hier ein (öffentliches Repo!), sondern
# über zwei von Terraform erzeugte Bootstrap-Dateien:
#   /root/bootstrap/supabase.nix      → Keycloak-DB-Verbindung + Admin-PW
#   /root/bootstrap/secrets.env       → DATABASE_URL für Medusa
#   /root/bootstrap/medusa-db-password → lokales PG-Passwort (First-Boot-Job)
# Dazu schreibt CI /etc/medusa.env (Stripe & Co.) und /etc/alloy/secrets.env.
###############################################################################

{ config, pkgs, lib, ... }:

let
  # zentrale Domain-Konstante im Shop-Repo:
  domain = "example.com"; # ← anpassen (identisch zu var.root_domain in Terranix)

  medusaHome = "/opt/medusa";

  # Grafana Cloud Push-Endpunkte — aus den Stack-Details übernehmen:
  promUrl = "https://prometheus-prod-10-prod-eu-west-0.grafana.net/api/prom/push";
  lokiUrl = "https://logs-prod-3-prod-eu-west-0.grafana.net/loki/api/v1/push";
in
{
  imports = [
    # Von cloud-init geschrieben (Phase 1): enthält den Supabase-Host mit dem
    # echten Project-Ref + initialAdminPassword — deshalb Pfad-Import statt
    # Kopie ins Repo:
    "/root/bootstrap/supabase.nix"
  ];

  system.stateVersion = "26.05";

  networking.hostName = "medusa";
  networking.domain = domain;
  networking.firewall.allowedTCPPorts = [ 80 443 ]; # hcloud-FW filtert zusätzlich
  time.timeZone = "Europe/Berlin";

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    # Der Admin-Key kommt über PROVIDER=hetznercloud aus den Hetzner-Metadaten.
  };

  environment.systemPackages = with pkgs; [
    nodejs_22 # npm/npx für Deploy-Jobs (deploy-medusa in CircleCI)
    rsync
  ];

  # --- Postgres (lokal, nur Medusa) + Redis ---------------------------------

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    ensureDatabases = [ "medusa" ];
    ensureUsers = [
      { name = "medusa"; ensureDBOwnership = true; }
    ];
  };

  # Passwort einmalig (idempotent je Boot) aus der Bootstrap-Datei setzen:
  systemd.services.medusa-db-init = {
    description = "Setzt das Medusa-Postgres-Passwort aus dem TF-Bootstrap";
    after = [ "postgresql.service" ];
    bindsTo = [ "postgresql.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ConditionPathExists = [ "/root/bootstrap/medusa-db-password" ];
      User = "postgres"; # psql über Unix-Socket: Peer-Auth braucht den DB-Superuser
    };
    path = [ config.services.postgresql.package ];
    script = ''
      psql -v PW="$(cat /root/bootstrap/medusa-db-password)" \
        -c "ALTER USER medusa PASSWORD :'PW';"
    '';
  };

  # Hinweis: neuere Kanäle migrieren Richtung services.valkey (Fork-Wechsel);
  # services.redis bleibt als Alias erhalten.
  services.redis.servers."" = {
    enable = true;
    port = 6379;
    bind = "127.0.0.1";
  };

  # --- Keycloak (DB = Supabase-Postgres, siehe Import) -----------------------

  services.keycloak = {
    enable = true;
    database = {
      type = "postgresql";
      createLocally = false; # DB ist Supabase — host/port/passwordFile kommen aus supabase.nix
    };
    settings = {
      hostname = "auth.${domain}";
      http-enabled = true; # TLS endet am Caddy (Reverse Proxy)
      proxy-headers = "xforwarded";
    };
  };

  # --- Caddy: TLS-Terminierung für api + auth ---------------------------------

  services.caddy = {
    enable = true;
    email = "admin@${domain}"; # Let's-Encrypt-Konto
    virtualHosts = {
      "api.${domain}".extraConfig = ''
        reverse_proxy 127.0.0.1:9000
      '';
      "auth.${domain}".extraConfig = ''
        reverse_proxy 127.0.0.1:8080
      '';
    };
  };

  # --- Medusa (hypothetisches Repo, via CircleCI nach /opt/medusa) -------------

  users.groups.medusa = { };
  users.users.medusa = {
    isSystemUser = true;
    group = "medusa";
    home = medusaHome;
    createHome = true;
  };

  systemd.services.medusa = {
    description = "MedusaJS-API (deploy: CircleCI → rsync → systemctl restart)";
    after = [ "postgresql.service" "medusa-db-init.service" "redis.service" "keycloak.service" ];
    wants = [ "keycloak.service" ];
    wantedBy = [ "multi-user.target" ];
    environment = {
      NODE_ENV = "production";
      HOST = "0.0.0.0";
      PORT = "9000";
    };
    path = [ pkgs.nodejs_22 ];
    serviceConfig = {
      User = "medusa";
      WorkingDirectory = medusaHome;
      # Bootstrap-Geheimnisse (TF) + CI-Geheimnisse (Stripe, OIDC-Secret …);
      # führendes „-“: Datei darf (vor dem ersten CI-Deploy) fehlen:
      EnvironmentFile = [ "/root/bootstrap/secrets.env" "-/etc/medusa.env" ];
      ExecStartPre = "${pkgs.bash}/bin/bash -c 'test -f ${medusaHome}/package.json || { echo \"Shop-Repo fehlt — erst CircleCI-Job deploy-medusa ausführen\"; exit 1; }'";
      # Layout des hypothetischen Monorepos (Medusa v2):
      ExecStart = "${pkgs.nodejs_22}/bin/node packages/medusa/dist/index.js";
      Restart = "on-failure";
    };
  };

  # --- Monitoring: Node-Exporter + Alloy → Grafana Cloud -----------------------

  services.prometheus.exporters.node = {
    enable = true;
    listenAddress = "127.0.0.1"; # nur für Alloy lokal
  };

  services.alloy = {
    enable = true;
    # Zugangsdaten schreibt der CI-Job configure-monitoring nach /etc/alloy/secrets.env
    environmentFile = "/etc/alloy/secrets.env";
    extraFlags = [
      "--server.http.listen-addr=127.0.0.1:12345"
      "--disable-reporting"
    ];
    config = ''
      // Metriken: Node-Exporter scrapen → Grafana Cloud Prometheus
      prometheus.scrape "node" {
        targets    = [{ __address__ = "127.0.0.1:9100" }]
        forward_to = [prometheus.remote_write.grafana_cloud.receiver]
      }

      prometheus.remote_write "grafana_cloud" {
        endpoint {
          url = "${promUrl}"
          basic_auth {
            username = env("GRAFANA_METRICS_USER") // Instance-ID des Stacks
            password = env("GRAFANA_TOKEN")        // glc_…-Token (TF-Output)
          }
        }
      }

      // Logs: systemd-Journal → Grafana Cloud Loki
      loki.source.journal "system" {
        forward_to = [loki.write.grafana_cloud.receiver]
      }

      loki.write "grafana_cloud" {
        endpoint {
          url = "${lokiUrl}"
          basic_auth {
            username = env("GRAFANA_METRICS_USER")
            password = env("GRAFANA_TOKEN")
          }
        }
      }
    '';
  };
}
