# Neon Free Plan

> Neon Free Plan — **permanent** (trial Hutlh), credit-card Hutlh. Core-idea:
> **serverless Postgres** — compute, lo'be'taHvIS, pagh-Daq scale-qa'; active
> compute-hours neH — Huch noblu' (pagh credit-lu'). wa'vatlh Qu' yap — Hoch,
> budget-Daj.

## Free Plan nobmey

| resource | nuq vaD 'oH? | nob |
|---|---|---|
| **Qu'mey** | wa' Qu' = wa' Postgres-cluster: branches, compute, connection-endpoints je | up to wa'vatlh |
| **Storage** | De'-volume — branches Hoch; copy-on-write — pages, unchanged, shares | 0.5 GB / Qu' |
| **Compute** | wa' CU ≈ wa' vCPU + loS GB RAM; compute, active 'oHtaHvIS, neH — Huch noblu' | wa'vatlh CU-hours / Qu' / Hoch jar (active time neH counts) |
| **[Autoscaling](https://neon.com/docs/introduction/autoscaling)** | compute — load-Daq nIteb grows (limit Dung) 'ej ghIq shrink-qa' | up to cha' CU (≈ chorgh GB RAM) |
| **[Scale-to-Zero](https://neon.com/docs/introduction/scale-to-zero)** | compute, inactive — vagh tup qaSpu'DI' parks; wa'DIch query ghIq — cold-start | nIteb — tup vagh qaSpu'DI' (inactivity) |
| **[Branches](https://neon.com/docs/introduction/branching)** | copy-on-write clones — database; "Git for the DB": dev/test-environments — real De' | up to ~wa'maH / Qu' (copy-on-write branches) |
| **[Better Auth](https://neon.com/docs/use-cases/better-auth)** | open-source auth-library Better Auth — managed setup, Neon-Daq; user-accounts — backend-lIj Hutlh | tu'lu', up to 60,000 MAU |
| **Object storage / functions** | features latlh, beta (external object-storage, DB-functions) — vaj Huch Hutlh | beta-qastaHvIS — Huch Hutlh |
| **AI gateway** | central proxy — LLM-API-calls vaD (routing, keys, Huch-ra') | paid plans-Daq neH |

wa' CU ≈ loS GB RAM + CPU. wa'vatlh CU-h/Hoch jar ≈ e.g. vaghmaH rep continuous 0.25 CU
pagh cha'maH vagh rep wa' CU — apps, real traffic ghajbogh, scale-to-zero via: law' nI'
poH.

## Gotchas

1. **Cold starts:** scale-to-zero qaSpu'DI' — wa'DIch query ~0.5–1 s+ (compute
   qetlu'). Latency-critical APIs vaD: inactive-poH pagh compute mach — config;
   pings yIlo'Qo'.
2. Compute-hours — **wa' Qu'-Daq**. Qu'mey law', active — Hoch, budget-Daj
   wa'vatlh-CU-h; 'ach Hoch — separately lo'.
3. 0.5 GB storage — mach 'oH. Branches — project-storage share (copy-on-write
   helps; table-copies — helpbe').
4. Free Plan — law' chenmoHqa'lu' (earlier: 191.7 CU-h total — wa'vatlh CU-h/Qu'
   latlh). blogposts ngo', model ngo' qonbogh — ngo' 'oH.
5. Paid plans (Launch/Scale) — Hoch jar-minimum Hutlh; pay-as-you-go neH
   ($0.106/CU-h, $0.35/GB-Hoch jar storage, Launch-Daq).

## Sources

- Pricing: <https://neon.com/pricing>
- Plans-Docs: <https://neon.com/docs/introduction/plans>
- Free-Tier-FAQ: <https://neon.com/faqs/managed-postgres-databases-free-tier>
