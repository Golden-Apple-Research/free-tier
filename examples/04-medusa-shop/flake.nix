{
  # Beispiel 4: Medusa-Shop auf eigener Hardware — Terranix statt HCL.
  #
  # Zwei Terranix-Konfigurationen (= zwei Terraform-States), weil der
  # Keycloak-Realm erst konfiguriert werden kann, wenn der Server läuft:
  #
  #   Phase 1 „infra":     Hetzner-VPS (NixOS via nixos-infect), Cloudflare
  #                        (DNS + Worker-Platzhalter), Supabase (Keycloak-DB),
  #                        CircleCI (Deploy-Context), Grafana Cloud (Stack)
  #   Phase 2 „keycloak":  Realm, Clients, Google/Facebook-Broker, Rollen
  #
  # Nutzung:
  #   nix run .#apply-infra      # Server bauen, dann ~5 min NixOS-Bootstrap abwarten
  #   nix run .#apply-keycloak   # Realm aufsetzen (erst wenn https://auth.<domain> erreichbar)
  #   nix run .#destroy-keycloak && nix run .#destroy-infra   # Aufräumen (umgekehrt!)

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    flake-utils.url = "github:numtide/flake-utils";
    terranix = {
      url = "github:terranix/terranix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, terranix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        # Baut eine Phase: Terranix-JSON erzeugen + apply/destroy-Apps,
        # die das JSON in ein eigenes Verzeichnis kopieren (getrennte States).
        mkPhase = name: modules:
          let
            tfjson = terranix.lib.terranixConfiguration {
              inherit system modules;
            };
            tf = verb: pkgs.writers.writeBash "${verb}-${name}" ''
              set -euo pipefail
              dir="tf/${name}"
              mkdir -p "$dir"
              cp -f ${tfjson} "$dir/config.tf.json"
              ${pkgs.terraform}/bin/terraform -chdir="$dir" init
              ${pkgs.terraform}/bin/terraform -chdir="$dir" ${verb}
            '';
          in
          {
            "apply-${name}" = {
              type = "app";
              program = toString (tf "apply");
            };
            "destroy-${name}" = {
              type = "app";
              program = toString (tf "destroy");
            };
            "tf-${name}" = tfjson; # auch als Package: `nix build .#tf-infra`
          };

        infra = mkPhase "infra" [ ./config.nix ];
        keycloak = mkPhase "keycloak" [ ./config-keycloak.nix ];
      in
      {
        apps = {
          apply-infra = infra.apply-infra;
          destroy-infra = infra.destroy-infra;
          apply-keycloak = keycloak.apply-keycloak;
          destroy-keycloak = keycloak.destroy-keycloak;
        };
        packages = {
          tf-infra = infra.tf-infra;
          tf-keycloak = keycloak.tf-keycloak;
        };
      });
}
