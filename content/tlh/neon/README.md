# Neon — Auth vaD Terraform

> **API key** — Neon-console-vo' (account-settings); `NEON_API_KEY` via noblu'.

## 1. key yIchenmoH

Neon Console (<https://console.neon.tech>) → avatar (top-right) →
**Account settings → API keys** → **Create new API key** → name yInob → key —
wa' poH neH yIcopy.

(Project- pagh org-scoped keys — respective org-Daq tu'lu': → **Settings →
API keys**.)

## 2. Terraform-Daq Qum

```bash
export NEON_API_KEY="napi_…"   # community-provider Env-Var vam laD
```

```hcl
provider "neon" {}
```

## 3. yIqIm!

- Key — **chenmoHlu'DI', wa' poH neH, leghlu'**. DaH — peghmey-ra'wI'-Daq
  (1Password/Vault/CI-peghmey) yIqon.
- Rotation: key ngo' — **revoke** (DaH 'ej permanent!) + chu' yIchenmoH + Hoch-Daq
  choH. rotation-qastaHvIS — operation-laHbe', wa' poH qaStaHvIS.
- Personal keys — account-Hoch. CI vaD: org- pagh Qu'-scoped key — scope
  mach neH — QaQ.
- Provider — community-maintained (`terraform-community-providers/neon`).
  Version — pin (TERRAFORM.md yIlaD).

## Sources

- API-keys manage: <https://neon.com/docs/manage/api-keys>
- TF-guide: <https://neon.com/docs/reference/terraform>
