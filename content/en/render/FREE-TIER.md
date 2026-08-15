# Render Free Tier

> Render offers permanent free instances fer **web services, Postgres an'
> Key Value (Redis)** — with classic PaaS pitfalls: spin-down on inactivity,
> ephemeral filesystem an' **expiring free databases**. Free ships, aye —
> but they sleep, they forget, an' some sink after 30 days. Know the
> quirks before ye set sail.

## Cost Quotas (per workspace/month)

| Resource | What's it fer? | Free tier |
|---|---|---|
| **[Free web services](https://render.com/docs/web-services)** | HTTP services (APIs, bots …) from a git repo or container — free, but with sleep pauses. Ships that sail free — but doze off at anchor | 750 instance-hours/month (shared by all free services), 512 MB RAM / 0.1 CPU |
| **Spin-down** | Hibernation after inactivity, so no instance hours get burned; the next request wakes it up. The crew goes ashore after a quiet spell — the first visitor rouses 'em | after **15 min. without inbound traffic**; waking ~1 min. (loading page) |
| **Filesystem** | Local disk o' the service — ephemeral: every restart throws it back to the image state. The chalkboard o' the ship — wiped clean at every relaunch | **ephemeral** — changes are lost on spin-down |
| **[Free Postgres](https://render.com/docs/databases)** | Managed Postgres database — on the free tier only 30 days durable, pure dev/demo toy. A ship that sinks after a month, by design | 1 per workspace, 1 GB, **expires after 30 days** (14 days grace, then deletion) |
| **[Free Key Value (Redis)](https://render.com/docs/redis)** | Redis-compatible in-memory DB fer caches/sessions — data doesn't survive a restart. The ship's memory — gone with the first storm o' maintenance | 1 per workspace, **in-memory only** — data loss on every restart/maintenance |
| **[Static sites](https://render.com/docs/static-sites)** | Static websites (HTML, Astro-/Hugo builds) — permanently free on Render's CDN. The carved figurehead o' the fleet — free as the wind | completely free (only count against the bandwidth budget) |

## Restrictions of the Free Web Services

The free hull comes with a tight rig:

- No scale-out (max. 1 instance), no persistent disks, no SSH,
  no private network requests, no edge caching
- SMTP ports (25/465/587) blocked — no carrier pigeons out
- Rollbacks only to the last 2 deploys — the log be short
- During spin-down, `/robots.txt` automatically answers with `Disallow: all`
  (good against indexing o' demo apps). The ship hides from the mapmakers
  while she sleeps — a blessin' fer demo seas.

## Gotchas

1. **750 h apply workspace-wide fer all free services together** — two
   free apps in continuous operation = ~360 h/month each (31-day month = 744 h).
   Only exception: spun-down services consume no hours. The free sea-hours
   be one shared barrel — two ships drink it dry twice as fast. Rrr, that's
   what we pirates like — but ration the hours like rum.
2. **Free Postgres gets deleted after 30 days** (after a 14-day grace) —
   fer anything permanent use Neon/Supabase or pay. And ye bloody landrat
   really thought ye had to pay fer it? Nay — but the free DB be a
   short-lived deckhand, signed on fer a month an' no more. That's not what
   you expected, eh? Aye, the free database be a sandcastle — the tide
   takes it at day 30.
3. **Cold starts (~1 min.)** after 15 min. inactivity — noticeably bad fer
   APIs with user interaction; keep-alive pings cost instance hours. The
   crew needs a minute to stumble back to the cannons — an' pinging to
   keep 'em awake burns the shared hours. Fifteen quiet minutes, then the
   whole watch be down in the hammocks; the first caller waits at the
   rail while they find their boots. Plan yer raids accordin'ly.
4. Free Key Value be **only RAM** — after maintenance/restart the cache be
   empty. Cache data must not contain anything critical. The free memory
   be a rumor — it vanishes at the first restart. Write nothin' there ye
   can't afford to lose.

> *Old salt's tale:* a bosun called Weepy William stored his prize
> registry — every ship, every share, every IOU — in the free Key Value
> hold, "just till the voyage ends." Came a maintenance squall at midnight;
> by dawn the hold were clean as Sunday silver, an' William earned his
> name fer good. RAM be a fine servant an' a faithless vault, matey.
5. "Not fer production" be meant seriously: free instances may be restarted
   anytime; a workspace upgrade (payment) does **not** automatically lift
   the free-instance limits. That's not what you expected, eh? Aye — payin'
   fer the harbor doesnae upgrade the free ships docked in it.

## Sources

- Deploy for free: <https://render.com/docs/free>
- Pricing (incl. free-instance specs): <https://render.com/pricing>
- Workspace plan change April 2026: <https://render.com/docs/faq>
