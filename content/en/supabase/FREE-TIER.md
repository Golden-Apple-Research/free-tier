# Supabase Free Plan

> Supabase gives **2 active free projects per account** (across orgs), which
> be paused after **1 week of inactivity**. No credit card needed,
> permanently free — but without backups/PITR an' with hard caps. Rrr, that's
> what we pirates like — free loot, but watch the barnacles. Two fine ships,
> an' if they sit idle a week, they fall asleep in the harbor.

## Quotas (org level, as of 2026)

| Resource | What's it fer? | Free Plan |
|---|---|---|
| **Active projects** | A project = a Postgres instance incl. auth, storage an' APIs; paused ones take no slot. One project be one full warship | 2 (paused don't count) |
| **[Database (Postgres)](https://supabase.com/docs/guides/database)** | Fully managed Postgres — every table automatically queryable via REST (PostgREST) an' GraphQL. The ship's ledger, open to any officer what asks | 500 MB per project, shared CPU / 500 MB RAM |
| **[Monthly Active Users (Auth)](https://supabase.com/docs/guides/auth)** | Complete auth system: email/password, OAuth (Google, GitHub …), magic links — without yer own identity backend. The harbor registry an' the password to every gate | 50,000 (org-wide) |
| **Egress** | Outbound traffic to yer users (API responses, downloads, DB traffic). What leaves the hold an' crosses the waves | 5 GB uncached + 5 GB cached |
| **[File Storage](https://supabase.com/docs/guides/storage)** | S3-like file storage with CDN delivery fer uploads (images, documents). The cargo hold fer maps, letters an' loot | 1 GB |
| **[Realtime Messages](https://supabase.com/docs/guides/realtime)** | Live updates via WebSockets on DB changes (INSERT/UPDATE/DELETE listeners on tables). The signal drums, beatin' the moment the ledger changes | 2 Mio. / month |
| **[Edge Function Invocations](https://supabase.com/docs/guides/functions)** | Serverless TypeScript functions (Deno) at the edge — fer webhooks, payment callbacks, yer own endpoints. The boarding parties, ready at every rail | 500,000 / month |
| **API requests** | Requests against the auto-generated interfaces — here there simply be no limit. Ask as often as ye like — the answers be free | unlimited |
| **Support** | Help via community (Discord, GitHub) — no ticket support. The tavern talk o' fellow pirates, not a butler's service | Community |

Not included: downloadable backups, PITR (point-in-time recovery) an'
custom domains fer the API (both Pro features). The fine things o' the
paid fleet — no copies o' the log, no rewind o' time.

## Gotchas

> *Old salt's tale:* Bartholomew Roberts — no, the *other* Roberts — left
> his second warship at anchor while he raided with the first. Seven days
> o' quiet, an' the drowsy thing were paused stiff as a figurehead; took
> him the better part of a mornin' an' a dashboard sacrifice to wake her.
> Now a cron ping visits both ships every third day, regular as the tide.
> Idle ships sleep, matey — an' sleepin' ships don't sail.

1. **Projects pause after 7 days of inactivity** (no API traffic) —
   afterwards a manual restore in the dashboard be needed. Arrange fer cron
   pings or the like. A ship at anchor too long falls into the doldrums —
   send a scout every few days to keep her awake.
2. The limits be **hard caps**: if a project hits e.g. the 500 MB
   database limit, writes get blocked/throttled; exceeding egress
   pauses the project until reset or upgrade. The hold be full — nothin'
   more goes in till the cargo be lightened. That's not what you expected,
   eh? Aye, the free hull has a hard waterline.
3. **No automatic backups on Free** — run `pg_dump` regularly yerself.
   The ship's log be copied by yer own hand, or lost to the waves.
4. 50 K MAUs apply **org-wide across both projects** — a second project
   effectively halves the user budget. Two ships, one crew allowance —
   every sailor counts twice.
5. Free projects can later be upgraded to Pro; going down from Pro to
   Free isn't possible fer all resources (e.g. disk size stays). And ye
   bloody landrat really thought ye had to pay fer it? Nay — but mind the
   caps before the Kraken of surprise bills stirs. What's grown big stays
   big — a frigate can't shrink back to a sloop.

## Sources

- Pricing: <https://supabase.com/pricing>
- Billing docs: <https://supabase.com/docs/guides/platform/billing-on-supabase>
