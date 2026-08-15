# Cloudflare Free Tier

> Cloudflare has no time-limited trial, but permanent free quotas
> (Workers Free Plan + free-plan products). No expiry, no credit card needed.
> Limits reset **daily at 00:00 UTC**. The only treasure chest that refills
> itself every midnight — no trial that vanishes, no timer that runs out,
> just free loot forever, refilled by the dawn.

## Workers Free Plan (core quotas)

The heart o' the free bounty — serverless power at the edge o' the world:

| Product | What's it fer? | Free quota |
|---|---|---|
| **[Workers](https://developers.cloudflare.com/workers/)** | Serverless code (JS/TS/WASM) on Cloudflare's edge network — runs close to the user, so it be fast. Yer crew stationed at every port, answerin' in a blink | 100,000 requests/day (summed over all workers), 10 ms CPU time/invocation, 128 MB RAM, up to 100 worker scripts |
| **[Static Assets](https://developers.cloudflare.com/workers/static-assets/)** (Workers) | Serve static files (HTML/CSS/JS, images) directly from the worker script. The cargo o' yer ship, handed out freely to every visitor | Requests to static files **unlimited an' free** (also on the Paid Plan) |
| **[Pages](https://developers.cloudflare.com/pages/)** | Frontend hosting fer frameworks (Next.js, Astro …) with git integration an' preview deployments. A pier where every version o' yer ship gets its own berth | Unlimited bandwidth/requests, 500 builds/month, 1 concurrent build, unlimited collaborators |
| **[Workers KV](https://developers.cloudflare.com/kv/)** | Globally replicated key-value store at the edge — configs an' feature flags with millisecond latency. The flag locker, copied to every mast in the fleet | 100,000 reads/day, 1,000 writes/deletes/lists per day, 1 GB storage |
| **[D1](https://developers.cloudflare.com/d1/)** (SQLite) | Serverless SQLite database, accessed from within Workers. The ship's ledger, kept right at the helm | 5 Mio. rows read/day, 100,000 rows written/day, 5 GB storage total |
| **[R2](https://developers.cloudflare.com/r2/)** (S3-compatible) | Object storage without egress fees — ideal fer user uploads an' assets. The treasure hold, an' haulin' cargo out costs nothin' at all | 10 GB storage/month, 1 Mio. class-A + 10 Mio. class-B operations/month, **egress completely free** (only storage class Standard) |
| **[Queues](https://developers.cloudflare.com/queues/)** | Managed message queues so workers can process tasks asynchronously. The work queue at the galley — jobs line up, crew takes 'em one by one | limited free usage included in the Workers Free Plan |
| **[Cron Triggers](https://developers.cloudflare.com/workers/configuration/cron-triggers/)** | Start workers time-controlled via cron schema (instead of waiting fer HTTP events). The ship's bell, ringin' on schedule | 5 per account |

## Further Permanently Free Products

More free booty beyond the Workers core — no expiry, no tricks:

| Product | What's it fer? | Quota |
|---|---|---|
| **[Tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/)** (cloudflared) | Publish privately hosted services (homelab, VPS) without open ports — cloudflared builds the connection from the inside. A secret passage from yer hidden cove to the open sea, no gates to force | unlimited, privately hosted services publicly reachable |
| **[Zero Trust / Access](https://developers.cloudflare.com/cloudflare-one/policies/access/)** | Identity protection in front o' internal apps: users authenticate via Cloudflare before bein' let through. The harbor sentry — papers first, then dock | up to 50 users free |
| **[Turnstile](https://developers.cloudflare.com/turnstile/)** | Bot protection as a CAPTCHA replacement — an embedded widget checks users in the background. The ship's cat — spots the rats while ye're not lookin' | free (bot protection as CAPTCHA replacement) |
| **[Registrar](https://developers.cloudflare.com/registrar/) / [DNS](https://developers.cloudflare.com/dns/) / CDN** | Authoritative DNS management plus CDN with DDoS protection fer any domain; the Registrar sells domains without markup. The mapmaker's office an' the cannon wall, all free | DNS + CDN (incl. DDoS protection) free fer any domains |

## Gotchas

> *Old salt's tale:* Captain Kidd once sat up all night to catch the
> midnight tide — said he wanted to see the chest refill with his own eye.
> At 00:00 UTC sharp, the barrel brimmed over: 100,000 fresh requests,
> clinkin' like newly minted doubloons. Kidd laughed till the riggin'
> shook, then spent the whole lot by breakfast on cron jobs. A chest what
> refills daily be a fine thing, matey — but a fool an' his quota be soon
> parted.

1. **Pages be in Maintenance Mode** — new features only come to
   Workers (Static Assets). Fer new projects use Workers with Static Assets;
   Pages functions keep runnin' as Pages Functions, but migration be
   recommended. The old pier be holdin' steady, but the new harbor be where
   the trade goes.
2. The 10 ms CPU time per invocation be a **hard limit** — normal
   (non-CPU-bound) requests manage it easily; image processing/crypto, not
   so much. Ten heartbeats o' compute per call, an' no more — plan the
   heavy cannons elsewhere.
3. The 100k-requests/day limit applies **account-wide across all workers** —
   several workers share the budget. Rrr, that's what we pirates like — but
   the loot be shared among the crew, so a hundred workers all drink from
   the same barrel.
4. KV be **eventually consistent** (writes propagate up to ~60 s); fer
   strongly consistent access take D1 or Durable Objects (Durable Objects
   are not in the Free Plan). The signal flags take a minute to reach every
   ship — need it instant? Use the ledger, not the flags.
5. R2 class-A operations (writes/lists) be the tightest R2 budget:
   1 Mio./month sounds like a lot, but S3-API tools with recursive listing
   can burn through it quick. And ye bloody landrat really thought ye had to
   pay fer it? Nay — just mind the counting. That's not what you expected,
   eh? Aye, listin' the cargo a thousand times over costs more than the
   cargo itself.

## Sources

- Workers pricing: <https://developers.cloudflare.com/workers/platform/pricing/>
- D1 pricing: <https://developers.cloudflare.com/d1/platform/pricing/>
- R2 pricing: <https://developers.cloudflare.com/r2/pricing/>
- KV pricing: <https://developers.cloudflare.com/kv/platform/pricing/>
- Pages limits: <https://developers.cloudflare.com/pages/platform/limits/>
