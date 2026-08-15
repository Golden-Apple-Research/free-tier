# Cloudflare Free Tier

> Cloudflare — trial, poH ghajbogh, tu'lu'be'; Huch Hutlh quotas — permanent 'oH
> (Workers Free Plan + Free-Plan products). reHbe' mev; credit-card 'utbe'.
> Limits — Hoch jaj 00:00 UTC-Daq choHqa'lu'.

## Workers Free Plan (core quotas)

| product | nuq vaD 'oH? | Huch Hutlh nob |
|---|---|---|
| **[Workers](https://developers.cloudflare.com/workers/)** | serverless code (JS/TS/WASM) — Cloudflare edge-network-Daq; user-Daq nav, vaj poH mach | wa'bIp tlhobmey/jaj (Hoch workers sum), wa'maH ms CPU-time/invocation, wa'vatlh cha'maH chorgh MB RAM, up to wa'vatlh worker-scripts |
| **[Static Assets](https://developers.cloudflare.com/workers/static-assets/)** (Workers) | static files (HTML/CSS/JS, images) — worker-script-vo' ngeH | tlhobmey, static files-Daq: limit Hutlh, Huch Hutlh (Paid-Plan-Daq je) |
| **[Pages](https://developers.cloudflare.com/pages/)** | frontend-hosting — frameworks vaD (Next.js, Astro …); git-integration 'ej preview-deployments | bandwidth/tlhobmey limit Hutlh, vaghvatlh builds/jar, wa' build, wa' poH qaStaHvIS, collaborators limit Hutlh |
| **[Workers KV](https://developers.cloudflare.com/kv/)** | global replicated key-value-store — edge-Daq; configs 'ej feature-flags — millisecond-latency | wa'bIp reads/jaj, wa'SaD writes/deletes/lists — Hoch jaj, wa' GB storage |
| **[D1](https://developers.cloudflare.com/d1/)** (SQLite) | serverless SQLite-database — workers-vo' Qumlu' | vagh'uy' rows laD/jaj, wa'bIp rows qon/jaj, vagh GB storage total |
| **[R2](https://developers.cloudflare.com/r2/)** (S3-compatible) | object-storage, egress-fees Hutlh — user-uploads 'ej assets vaD QaQ | wa'maH GB storage/jar, wa'maH bIp class-A + vatlhbIp class-B operations/jar, egress — Huch Hutlh complete (storage-class standard neH) |
| **[Queues](https://developers.cloudflare.com/queues/)** | managed message-queues — workers tasks async lo'laHmeH | free-use mach, Workers-Free-Plan-Daq tu'lu' |
| **[Cron Triggers](https://developers.cloudflare.com/workers/configuration/cron-triggers/)** | worker — cron-schema via poH-Daq qetlu'; HTTP-events Hutlh | vagh / account |

## latlh products — reH Huch Hutlh

| product | nuq vaD 'oH? | nob |
|---|---|---|
| **[Tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/)** (cloudflared) | private hosted services (Homelab, VPS) — open ports Hutlh — publish; cloudflared — connection, from inside, chenmoH | limit Hutlh — private hosted services, public, reachable |
| **[Zero Trust / Access](https://developers.cloudflare.com/cloudflare-one/policies/access/)** | identity-protection, internal apps vaD: lo'wI'pu' — Cloudflare via authenticate — qaSpa' 'el | limit: vaghmaH lo'wI', Huch Hutlh |
| **[Turnstile](https://developers.cloudflare.com/turnstile/)** | bot-protection — CAPTCHA-replacement; embedded widget — lo'wI'pu', background-Daq, check | Huch Hutlh (bot-protection — CAPTCHA-replacement) |
| **[Registrar](https://developers.cloudflare.com/registrar/) / [DNS](https://developers.cloudflare.com/dns/) / CDN** | authoritative DNS-management + CDN, DDoS-protection, domain Hoch vaD; registrar — domains, surcharge Hutlh, jej | DNS + CDN (DDoS-protection je) — Huch Hutlh, domains Hoch vaD |

## Gotchas

1. **Pages — maintenance-mode.** features chu' — Workers neH (static-assets).
   Qu'mey chu': workers, static-assets ghajbogh, yIlo'; pages-functions —
   taH, 'ach migration — QaQ.
2. wa'maH ms CPU-time/invocation — hard limit. tlhobmey standard (CPU-bound
   Hutlh) — easy Qap; image-processing/crypto — Qapbe'.
3. wa'bIp-tlhobmey/jaj-limit — account-Hoch 'oH, workers Hoch qaStaHvIS.
   Workers law' — budget share.
4. KV — eventually consistent (writes ~javmaH lup propagate). consistency HoS
   vaD: D1 pagh durable-objects yIlo' (durable-objects — Free-Plan-Daq
   tu'lu'be').
5. R2 class-A-operations (writes/lists) — nob mach, R2-Daq. wa'maH bIp/jar — law'
   'e' jatlhlu'; 'ach S3-API-tools, recursive-listings ghajbogh — poH mach
   QIHlaH.

## Sources

- Workers Pricing: <https://developers.cloudflare.com/workers/platform/pricing/>
- D1 Pricing: <https://developers.cloudflare.com/d1/platform/pricing/>
- R2 Pricing: <https://developers.cloudflare.com/r2/pricing/>
- KV Pricing: <https://developers.cloudflare.com/kv/platform/pricing/>
- Pages Limits: <https://developers.cloudflare.com/pages/platform/limits/>
