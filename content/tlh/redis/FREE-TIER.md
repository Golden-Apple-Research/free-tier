# Redis Cloud Free Tier

> Redis Cloud (Redis Inc. SaaS) — reH Huch Hutlh **Essentials-subscription**:
> wejmaH MB, wa' database, expressly learning/tests vaD chenmoHpu'. Credit-card
> Hutlh, reHbe' mev.

## Free-Tier quotas

| resource | nuq vaD 'oH? | limit |
|---|---|---|
| **storage** | wa' database neH, wejmaH MB — caches, sessions, rate-limiters, dev-operation-Daq, yap | wejmaH MB (wa' database neH) |
| **connections** | clients (app-instances), DB-Daq wa' poH qaStaHvIS 'elbogh | wejmaH, wa' poH qaStaHvIS |
| **throughput** | operations (GET/SET …) Hoch lup, Hoch clients sum | ~wa'vatlh ops/lup |
| **network-bandwidth** | De', database Hoch jar ngeHbogh | vagh GB / Hoch jar |
| **persistence/backups** | De', disk-Daq, permanent qon — tier Huch Hutlh-Daq: Hoch RAM-Daq neH | tier Huch Hutlh-Daq tu'lu'be' |
| **availability** | replica Hutlh (wa' instance) — instance mevchugh, DB mev | HA Hutlh (wa' instance) |

## plans — comparison

| plan | ab | vaD |
|---|---|---|
| Free | $0 | dev/demo, 30 MB |
| Essentials | ~$5/Hoch jar (250 MB-vo') | prod-workloads mach, single-DB |
| Pro | minimums Dung (up to ~$200/Hoch jar) | HA, replication, multi-DB |

## Gotchas

1. **wa'vatlh ops/lup limit:** wa' health-check Hoch lup + normal app-load —
   throttle-laH; Free-Tier — load-tests vaD QaQbe'.
2. **wejmaH connections neH** — connection-pooling 'ut; serverless-platforms,
   cold-starts law' ghajbogh — limit exceed-laH.
3. Free-Tier — shared infrastructure-Daq qet; Redis — capacity-management
   vaD throttle-/maintenance-laH.
4. Alternative: **Upstash/Render/Netlify** — Redis-rur tiers Huch Hutlh, latlh
   limits ghaj; wejmaH MB/wa'vatlh ops/lup mach-chugh yIlo'.

## Sources

- Essentials-plan-details: <https://redis.io/docs/latest/operate/rc/subscriptions/view-essentials-subscription/essentials-plan-details/>
- Subscription-overview: <https://redis.io/docs/latest/operate/rc/subscriptions/>
- Pricing: <https://redis.io/enterprise/pricing/>
