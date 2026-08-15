# Redis Cloud Free Tier

> Redis Cloud (SaaS from Redis Inc.) has a permanently free
> **Essentials subscription**: 30 MB, one database, expressly built fer
> learning/tests. No credit card, no expiry. A wee chest o' treasure, just
> big enough fer a handful o' doubloons — small, but it never runs out.

## Free Tier Quotas

The small free hold an' its tight limits:

| Resource | What's it fer? | Limit |
|---|---|---|
| **Storage** | Exactly one Redis Cloud database with 30 MB — enough fer caches, sessions an' rate limiters in dev operation. The wee barrel — enough fer a modest stash | 30 MB (exactly 1 database) |
| **Connections** | Concurrent clients (app instances) allowed on the DB at the same time. How many crew may crowd the gangplank at once | 30 concurrent |
| **Throughput** | Operations (GET/SET …) per second, summed over all clients. How fast the deckhands can pass the barrels | ~100 ops/second |
| **Network bandwidth** | Data volume the DB delivers per month. The cargo hauled out o' the hold | 5 GB / month |
| **Persistence/backups** | Durable backup o' the data to disk — on the free tier everything lives only in RAM. The log kept only in memory — no copy survives the storm | not included in the free tier |
| **Availability** | No replica (single instance) — if the instance falls, the DB falls. One ship, no escort — sink her, an' the treasure goes down with her | no HA (single instance) |

## Plan Ordering

| Plan | From | Fer |
|---|---|---|
| Free | $0 | dev/demo, 30 MB |
| Essentials | ~$5/month (from 250 MB) | small prod workloads, single DB |
| Pro | high minimum spends (up to ~$200/month) | HA, replication, multi-DB |

## Gotchas

> *Old salt's tale:* they calls the free Redis chest "the doubloon
> barrel" in these waters — thirty megabytes, no more. One-eyed Izzy once
> tried to stash her whole plunder map in it, "'tis just a wee JSON file,"
> says she. 4 MB in, the barrel brimmed over. A cache be a cache, matey,
> not a hold — keep yer treasure in a real database, an' let the wee
> barrel hold only what be needed fast an' often.

1. **100 ops/s ceiling:** even a health check per second + normal app load
   can throttle — the free tier be unsuitable fer load testing. That's not
   what you expected, eh? Aye, the free rum flows slow — a hundred sips a
   second an' the barrel be dry. The free deckhands be few an' slow.
2. Only **30 connections** — connection pooling be mandatory; serverless
   platforms with many cold starts can blow the limit. Thirty men on the
   gangplank at once, an' no more — pool yer boarders wisely.
3. The free tier runs on shared infrastructure an' may be throttled/
   maintained by Redis fer capacity management. The free ship shares the
   harbor with the whole fleet — the harbormaster may make ye wait.
4. Alternative: **Upstash/Render/Netlify** offer Redis-like free tiers with
   other limits, if 30 MB/100 ops/s be too tight. And ye bloody landrat
   really thought ye had to pay fer it? Nay — plenty o' free caches on the
   high seas. Rrr, that's what we pirates like — a whole archipelago o'
   free memory islands.

## Sources

- Essentials plan details: <https://redis.io/docs/latest/operate/rc/subscriptions/view-essentials-subscription/essentials-plan-details/>
- Subscription overview: <https://redis.io/docs/latest/operate/rc/subscriptions/>
- Pricing: <https://redis.io/enterprise/pricing/>
