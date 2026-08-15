# Vercel Hobby Plan (Free Tier)

> Vercel **Hobby Plan**, Huch Hutlh — reH. 'ach: **commercial Hutlh**
> (personal Qu'mey, learning). Limits — hard stops: Dungchugh — feature mev.
> Qagh Huchmey tu'lu'be' — 'ach buy-lu'laHbe' je.

## nobmey (Hoch jar)

| resource | nuq vaD 'oH? | Hobby |
|---|---|---|
| **Fast data transfer** (bandwidth, CDN → lo'wI'pu') | bandwidth — Vercel-CDN, visitors'lIj-Daq, ngeH (HTML, images, API-answers) | wa'vatlh GB |
| **[Vercel Functions Invocations](https://vercel.com/docs/functions)** | backend-functions, server Hutlh (Node, Python, Go …) — e.g. API-routes, Next.js-Daq | 1,000,000 |
| **Functions active CPU** | compute-time — functions, real, qettaHbogh; CPU-hours — wall-clock Hutlh | loS CPU-hours (+ wejvatlh SochmaH GB-h provisioned memory) |
| **[Edge-tlhobmey](https://vercel.com/docs/functions/runtimes/edge)** (middleware/edge functions) | code, mach, CDN-edge-Daq — tlhobmey Hoch qaSpa' qet (auth-checks, rewrites) | 1,000,000 |
| **[Image Transformations](https://vercel.com/docs/image-optimization)** | image-optimization, on-the-fly: resize, WebP/AVIF-conversion — `next/image` pagh image-CDN via | vaghSaD (plus wejbIp image-cache-reads, wa'bIp writes) |
| **Deployments** | git-push = build + deploy; deployment Hoch — URL Daj; previews je | wa'vatlh — wa' jaj-Daq (soft limit) |
| **[Cron Jobs](https://vercel.com/docs/cron-jobs)** | functions, scheduled, cron-syntax via — Hobby-Plan-Daq jaj-precision neH | wa'vatlh — wa' Qu'-Daq, 'ach **jaj Hoch wa'logh machbe'**; rep-precision (±HutmaH vagh tup) |
| **Builds** | build-machines — repo-vo' deployment chenmoH | wejmaH vagh tup/build, wa' concurrent build, cha' vCPU / chorgh GB RAM |
| **Seats** | seats — ghom-members vaD; Hobby — wa' user, hard | wa' (ghom-collaboration tu'lu'be') |

## limit Dungchugh — nuq qaS?

- feature — **wejmaH jaj mev** (web-analytics — Soch jaj neH) — Huchmey
  tu'lu'be'; auto-upgrade tu'lu'be'.
- ghIq choHqa' pagh upgrade — manual — **Pro ($20/jar)**: 1 TB
  fast-data-transfer, cron-jobs, tup-precision, team-features, commercial use.

## Gotchas

1. **commercial use — chaw'be'** — monetarization mach je (ads, SaaS,
   landingpage, company vaD) — fair-use-rules QIH. vaj: limitmey qaSpa'
   Pro-upgrade — reason law'.
2. cron-jobs, Hobby-Daq — **wa'logh neH — wa' jaj-Daq** (±HutmaH vagh tup
   imprecision) — schedules, tight, vaD Qapbe'.
3. bandwidth (wa'vatlh GB) — **fast-data-transfer neH**. downloads/videos, law',
   ngeHwI' — mach poH-Daq limit. feature-mev — warning Hutlh; email neH.
4. wa'vatlh deployments/jaj — soft limit. CI-spam (preview-deploys — push Hoch) —
   Vercel throttlemoHlaH.
5. team-collaboration (review-flows, seats law') — Pro-vo' neH tu'lu'.
   Hobby — single-user plan 'oH.

## Sources

- Hobby-plan details: <https://vercel.com/docs/plans/hobby>
- Pricing: <https://vercel.com/pricing>
- Cron-jobs limits: <https://vercel.com/docs/cron-jobs/usage-and-pricing>
- Limits & fair use: <https://vercel.com/docs/limits/fair-use-guidelines>
