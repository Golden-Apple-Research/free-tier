###############################################################################
# Phase 2 „keycloak" — Realm, OIDC-Clients, Google/Facebook-Broker, RBAC-Rollen
#
# Eigener Terraform-State: läuft erst, NACHDEM die VPS aus Phase 1 hochgefahren
# ist und Keycloak unter https://auth.<root_domain> antwortet (Bootstrap über
# nixos-infect dauert ~5 Minuten).
#
# RBAC-Harmonisierung (Details im README):
#   Realm-Rollen (medusa-admin/-member/storefront-customer) werden per
#   Protocol-Mapper in den Claim `medusa_role` gemappt — das Medusa-Plugin
#   (medusa-plugin-auth) liest diesen Claim und legt/aktualisiert Medusa-User
#   mit der passenden Rolle.
###############################################################################

{ ... }:

let
  realmId = "\${keycloak_realm.shop.id}";
  apiOrigin = "https://api.\${var.root_domain}";
in
{
  terraform.required_version = ">= 1.6";

  terraform.required_providers = {
    keycloak = { source = "keycloak/keycloak"; version = "~> 5.9"; };
  };

  provider.keycloak = {
    url = "https://auth.\${var.root_domain}";
    client_id = "admin-cli";
    username = "admin";
    password = "\${var.keycloak_admin_password}"; # initialAdminPassword aus Phase 1
  };

  variable.root_domain = {
    description = "Haupt-Domain (identisch zu Phase 1!)";
    type = "string";
  };
  variable.keycloak_admin_password = {
    description = "initialAdminPassword aus Phase 1";
    type = "string";
    sensitive = true;
  };

  variable.google_client_id = { type = "string"; };
  variable.google_client_secret = { type = "string"; sensitive = true; };
  variable.facebook_client_id = { type = "string"; };
  variable.facebook_client_secret = { type = "string"; sensitive = true; };

  # --- Realm ---------------------------------------------------------------------

  resource.keycloak_realm.shop = {
    realm = "shop";
    enabled = true;
    display_name = "Medusa Shop";
    ssl_required = "external";
    registration_allowed = true; # Kunden-Registrierung (Storefront)
    login_with_email_allowed = true;
    remember_me = true;
    verify_email = true; # Google/Facebook-Mails sind verifiziert — eigene Registrierung nicht
  };

  # --- RBAC: Realm-Rollen ↔ Medusa-Rollen ------------------------------------------

  resource.keycloak_role.medusa_admin = {
    realm_id = realmId;
    name = "medusa-admin"; # → Medusa user.role = "admin"
    description = "Voller Admin-Zugriff auf das Medusa-Backend";
  };
  resource.keycloak_role.medusa_member = {
    realm_id = realmId;
    name = "medusa-member"; # → Medusa user.role = "member"
    description = "Eingeschränkter Team-Zugriff (RBAC im Medusa-Backend)";
  };
  resource.keycloak_role.storefront_customer = {
    realm_id = realmId;
    name = "storefront-customer"; # → Storefront-Kunde (beide Worker)
    description = "Kundenrolle für B2C- und B2B-Storefront";
  };

  # --- OIDC-Clients ----------------------------------------------------------------

  # Backend/Admin (Medusa + medusa-plugin-auth): confidential, Client-Secret
  # wird als Output ausgegeben und (per circleci CLI, siehe README) in den
  # Context gelegt — NICHT hier als Resource (der Context gehört Phase 1).
  resource.keycloak_openid_client.medusa_admin = {
    realm_id = realmId;
    client_id = "medusa-backend";
    name = "Medusa Backend";
    enabled = true;
    access_type = "CONFIDENTIAL";
    standard_flow_enabled = true;
    root_url = apiOrigin;
    admin_url = "${apiOrigin}/admin"; # Nix-Interpolation: apiOrigin einbacken
    valid_redirect_uris = [ "${apiOrigin}/*" ]; # Nix-Interpolation (TF kennt apiOrigin nicht)
    web_origins = [ apiOrigin ];
  };

  # Storefronts (beide Worker teilen sich einen public Client):
  resource.keycloak_openid_client.storefront = {
    realm_id = realmId;
    client_id = "storefront";
    name = "Storefront (B2C + B2B)";
    enabled = true;
    access_type = "PUBLIC"; # SPA auf Workern — kein Secret möglich/sinnvoll
    standard_flow_enabled = true;
    valid_redirect_uris = [
      "https://shop.\${var.root_domain}/*"
      "https://b2b.\${var.root_domain}/*"
      "http://localhost:3000/*" # lokale Entwicklung
    ];
    web_origins = [
      "https://shop.\${var.root_domain}"
      "https://b2b.\${var.root_domain}"
    ];
  };

  # --- RBAC-Glue: Realm-Rollen → Claim `medusa_role` ---------------------------------

  resource.keycloak_openid_user_realm_role_protocol_mapper.medusa_role = {
    realm_id = realmId;
    client_id = "\${keycloak_openid_client.medusa_admin.id}"; # nur Backend-Tokens
    name = "medusa-role";
    claim_name = "medusa_role"; # liest medusa-plugin-auth im Shop-Repo
    claim_value_type = "String";
    multivalued = true; # ein User kann mehrere Rollen tragen
    add_to_access_token = true;
    add_to_id_token = true;
    add_to_userinfo = true;
  };

  # --- Social Login: Google & Facebook als Broker --------------------------------------

  # Redirect-URLs für die Konsole der IdPs (pro Provider hinterlegen):
  #   https://auth.<root_domain>/realms/shop/broker/google/endpoint
  #   https://auth.<root_domain>/realms/shop/broker/facebook/endpoint
  resource.keycloak_oidc_google_identity_provider.google = {
    realm = "\${keycloak_realm.shop.realm}";
    alias = "google";
    client_id = "\${var.google_client_id}";
    client_secret = "\${var.google_client_secret}";
    # String, kein Liste (space-separated — so will es der Provider):
    default_scopes = "openid email profile";
  };

  resource.keycloak_oidc_facebook_identity_provider.facebook = {
    realm = "\${keycloak_realm.shop.realm}";
    alias = "facebook";
    client_id = "\${var.facebook_client_id}";
    client_secret = "\${var.facebook_client_secret}";
  };

  # --- Outputs --------------------------------------------------------------------------

  output.medusa_backend_client_secret = {
    description = "Für MEDUSA_KEYCLOAK_CLIENT_SECRET im CircleCI-Context (siehe README)";
    value = "\${keycloak_openid_client.medusa_admin.client_secret}";
    sensitive = true;
  };
  output.oidc_issuer = {
    description = "Issuer-URL für medusa-plugin-auth (beide Ends: /.well-known/openid-configuration)";
    value = "https://auth.\${var.root_domain}/realms/shop";
  };
}
