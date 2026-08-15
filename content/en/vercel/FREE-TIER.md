# Vercel Hobby Plan (Free Tier)

> Vercel's free **Hobby Plan** be permanently free, but expressly
> **non-commercial** (personal projects, learning). Limits be enforced as
> hard stops: on exceeding, the feature pauses — no surprise invoice, but
> also no add-on purchase. That's not what you expected, eh? Aye, the free
> rum flows, but only fer personal sails — the merchant fleet pays the toll.

## Included Quotas (per month)

The free stores o' the Hobby ship:

| Resource | What's it fer? | Hobby |
|---|---|---|
| **Fast Data Transfer** (bandwidth CDN → users) | Bandwidth that Vercel's CDN delivers to yer visitors (HTML, images, API responses). The cargo hoisted from ship to shore | 100 GB |
| **[Vercel Functions Invocations](https://vercel.com/docs/functions)** | Serverless backend functions (Node, Python, Go …) — e.g. API routes in Next.js. The crew below deck, answerin' every call | 1,000,000 |
| **Functions Active CPU** | Compute time these functions actually run — CPU hours instead o' wall clock. The actual rowing time, not the watch time | 4 CPU-hours (+ 360 GB-h provisioned memory) |
| **[Edge Requests](https://vercel.com/docs/functions/runtimes/edge)** (middleware/edge functions) | Lightweight code at the CDN edge that runs before every request (auth checks, rewrites). The lookout at every port, checkin' papers before ye dock | 1,000,000 |
| **[Image Transformations](https://vercel.com/docs/image-optimization)** | On-the-fly image optimization: resize, WebP/AVIF conversion via `next/image` or the image CDN. The ship's painter, sprucin' up every cargo crate on the way | 5,000 (plus 300 K image cache reads, 100 K writes) |
| **Deployments** | Git push = build + deploy; every deployment gets its own URL (previews included). Every launch o' the ship gets its own pennant | 100 per day (soft limit) |
| **[Cron Jobs](https://vercel.com/docs/cron-jobs)** | Scheduled function calls via cron syntax — on the Hobby plan only daily precision. The ship's bell — on Hobby it rings but once a day, an' not on the hour | 100 per project, but **min. once daily**, hourly precision (±59 min) |
| **Builds** | The build machines that bundle the deployment from the repo. The shipyard crews, one hull at a time | 45 min./build, 1 concurrent build, 2 vCPU / 8 GB RAM |
| **Seats** | Slots fer team members — Hobby be strictly single-user. One cap'n, one ship, no passengers | 1 (no team collaboration) |

## Behavior at Limit Exceedance

- The feature gets **paused fer 30 days** (Web Analytics only 7 days) — no
  billing, no auto-upgrade. The free rum stops flowin' till the tide turns
  — no dock fees, but no refills either.
- Afterwards reset or manual upgrade to **Pro ($20/month)**: 1 TB Fast Data
  Transfer, minute-precise cron jobs, team features, commercial use.

## Gotchas

1. **No commercial use allowed** — even small monetization
   (ads, SaaS, landing page fer a company) violates the fair-use guidelines
   an' be the most common reason to upgrade to Pro before all limits.
   Flyin' the black flag while runnin' a merchant route — that be the
   fastest way to the gallows. Keep the free sails personal.

> *Old salt's tale:* a promising young cap'n — call him Silver-Tongue Sam —
> hosted his little shopfront on the Hobby berth, sure as sunrise that
> "a few doubloons here an' there don't count as commerce." The
> harbormaster thought different. Feature paused, pennant struck, an' Sam
> sailin' the upgrade channel by Thursday. The free berth be fer pleasure
> craft, matey — run yer merchant routes on a merchant's berth, or pay
> the toll like honest folk do. (Honest *merchants*, mind. We be pirates.)
2. Cron jobs on Hobby run **only max. 1×/day** with ±59 min imprecision —
   useless fer tightly scheduled jobs. The bell rings once a day, an' not
   necessarily when ye need it. That's not what you expected, eh? Aye, the
   free timekeeper be a lazy one.
3. Bandwidth (100 GB) only applies to **Fast Data Transfer**; whoever
   delivers large downloads/videos hits the limit quickly → feature pause
   without warning besides email. The cargo hoist stops mid-haul — aye,
   that's the free way.
4. 100 deployments/day be a soft limit — CI spam (preview deploys per push)
   can prompt Vercel to throttle. Launchin' a longboat fer every ripple o'
   the water — the harbor master takes note.
5. Team collaboration (review flows, multiple seats) only exists from Pro on —
   Hobby be a single-user plan. Rrr, that's what we pirates like — lone
   wolves sail free. But a full crew needs the paid deck.

## Sources

- Hobby plan details: <https://vercel.com/docs/plans/hobby>
- Pricing: <https://vercel.com/pricing>
- Cron-jobs limits: <https://vercel.com/docs/cron-jobs/usage-and-pricing>
- Limits & fair use: <https://vercel.com/docs/limits/fair-use-guidelines>
