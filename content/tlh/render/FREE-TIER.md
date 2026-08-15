# Render Free Tier

> Render — reH Huch Hutlh instances — **Web Services, Postgres 'ej Key Value
> (Redis)** — classic PaaS-trapmey: spin-down, inactivity-Daq; filesystem
> volatile; 'ej **databases Huch Hutlh — mev**.

## Huch-nobmey (workspace/Hoch jar)

| resource | nuq vaD 'oH? | Free-Tier |
|---|---|---|
| **[Free Web Services](https://render.com/docs/web-services)** | HTTP-services (APIs, bots …) — Git-repo pagh container-vo'; Huch Hutlh — 'ach sleep-pauses ghaj | Sochvatlh wejmaH vagh instance-hours/Hoch jar (Hoch free-services share), vaghvatlh wa'maH cha' MB RAM / 0.1 CPU |
| **Spin-down** | sleep-state, inactivity qaSpu'DI' — instance-hours QIHQo'meH; next request — wake-lu' | **wa'maH vagh tup, inbound-traffic Hutlh, qaSpu'DI'**; wake ~wa' tup (loading-page) |
| **filesystem** | service local disk — volatile: Hoch restart — image-state-Daq qemqa' | **volatile** — changes, spin-down-Daq, QIHlu' |
| **[Free Postgres](https://render.com/docs/databases)** | managed Postgres-database — tier Huch Hutlh-Daq: wejmaH jaj neH taH; dev/demo-toy neH | wa'/workspace, wa' GB, **wejmaH jaj qaSpu'DI' mev** (wa'maH loS jaj grace — ghIq QIHlu') |
| **[Free Key Value (Redis)](https://render.com/docs/redis)** | Redis-rur in-memory-DB — caches/sessions vaD — De', Hoch restart-Daq, QIH | wa'/workspace, **in-memory neH** — data-loss, Hoch restart/maintenance-Daq |
| **[Static Sites](https://render.com/docs/static-sites)** | static websites (HTML, Astro-/Hugo-builds) — reH Huch Hutlh, Render-CDN-Daq | completely Huch Hutlh (bandwidth-budget-Daq neH qel) |

## Free-Web-Service restrictions

- scale-out Hutlh (wa' instance max), persistent-disks Hutlh, SSH Hutlh,
  private network-tlhobmey Hutlh, edge-caching Hutlh
- SMTP-ports (25/465/587) — block-lu'
- rollbacks — cha' deploys Qav neH
- spin-down-Daq `/robots.txt` — nIteb jange': `Disallow: all`
  (demo-apps index Qo'meH — QaQ)

## Gotchas

1. **Sochvatlh wejmaH vagh rep — workspace-wide; Hoch services Huch Hutlh share** — cha' apps Huch Hutlh, reH
   qettaHbogh — ~wejvatlh SochmaH rep/Hoch jar (wejmaH wa'-jaj jar = 744 h). wa' Exception neH:
   spun-services — hours lo'be'.
2. **Free Postgres — wejmaH jaj qaSpu'DI' QIHlu'** (wa'maH loS jaj grace) —
   permanent Qu' vaD: postgres-neon/Supabase yIlo' pagh yIpay.
3. **Cold starts (~wa' tup)** — wa'maH vagh tup inactivity qaSpu'DI' — user-interaction-APIs
   vaD QaQbe'; keep-alive-pings — instance-hours lo'.
4. Free Key Value — **RAM neH** — maintenance/restart-Daq: cache empty.
   cache-De'-Daq — critical pagh tu'lu'be'.
5. "Not for production" — serious: instances Huch Hutlh — poH Hoch-Daq restart-lu'laH;
   workspace-upgrade (pay) — instance-limits Huch Hutlh — nIteb lift-lu'be'.

## Sources

- deploy — Huch Hutlh vaD: <https://render.com/docs/free>
- Pricing (instance-specs Huch Hutlh je): <https://render.com/pricing>
- Workspace-plan-change April 2026: <https://render.com/docs/faq>
