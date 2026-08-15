# Neon Free Plan

> Neon's Free Plan be **permanent** (no trial), without a credit card. Core
> idea: **serverless Postgres** — compute scales back to zero on inactivity,
> only active compute hours be paid/credited. Up to 100 projects, each with
> its own budget. A hundred treasure chests, each with its own key! An' the
> best part: when ye ain't sailin', the ship costs nothin' at all — the
> crew goes ashore an' the wages stop.

## Free Plan Quotas

| Resource | What's it fer? | Quota |
|---|---|---|
| **Projects** | A project = a Postgres cluster incl. branches, compute an' connection endpoints. One full fleet per project — captains an' all | up to 100 |
| **Storage** | Data volume across all branches (copy-on-write shares unchanged pages). The cargo hold — an' clever copyin' means the same page ain't stored twice | 0.5 GB per project |
| **Compute** | 1 CU ≈ 1 vCPU + 4 GB RAM; only the time in which the compute be active is billed. The crew's wages — paid only while they're actually workin' | 100 CU-hours per project / month (only active time counts) |
| **[Autoscaling](https://neon.com/docs/introduction/autoscaling)** | Compute grows automatically under load up to the ceiling an' shrinks back after. The crew swells fer the battle an' thins out after | up to 2 CU (≈ 8 GB RAM) |
| **[Scale-to-Zero](https://neon.com/docs/introduction/scale-to-zero)** | Inactive compute parks after ~5 min.; the first query after pays a cold start. The ship beaches herself when idle — an' weighs anchor again at the first call | automatically after ~5 min. inactivity |
| **[Branches](https://neon.com/docs/introduction/branching)** | Copy-on-write clones o' the database — "git fer the DB": dev/test environments with real data. Parallel worlds where ye can test the mutiny before it happens | up to ~10 per project (copy-on-write branches) |
| **[Better Auth](https://neon.com/docs/use-cases/better-auth)** | The open-source auth library Better Auth as a managed setup on Neon — user accounts without yer own backend. The harbor passes, issued by a trusted harbor master | included up to 60,000 MAU |
| **Object storage / Functions** | Beta-stage extras (external object storage, DB functions) — so free. The experimental cannons o' the shipyard — free while they're bein' tested | free during beta |
| **AI Gateway** | Central proxy fer LLM API calls (routing, keys, cost control). The quartermaster o' all yer AI messages | only in paid plans |

1 CU ≈ 4 GB RAM + associated CPU. 100 CU-h/month ≈ e.g. 50 h continuous
0.25 CU or 25 h at 1 CU — fer applications with real traffic with
scale-to-zero, considerably longer. Idle ships cost nothin' — the free
hours stretch like a calm sea.

## Gotchas

> *Old salt's tale:* Cheng I Sao — the pirate queen what commanded a
> thousand ships an' lost none — ran her whole fleet on the scale-to-zero
> trick: every sloop beached herself after five quiet minutes, an' no
> wages were paid while the crews snored. Rich? Aye, rich enough to retire
> to a temple. That be the way o' serverless sailin', matey: the ship what
> sleeps costs nothin', an' the first cannon shot wakes her.

1. **Cold starts:** after scale-to-zero, the first query takes ~0.5–1 s+
   (compute gets started). Fer latency-critical APIs, configure inactive
   time or a minimal compute size, or avoid pings. The crew needs a moment
   to rouse from their hammocks — that's the price o' the free berth.
2. Compute hours be **per project** — many active projects each have
   their own 100 CU-h budget, but each also consumes separately. Rrr,
   that's what we pirates like — every ship carries its own rum ration.
3. 0.5 GB storage sounds small; branches share the project storage
   (copy-on-write helps, table copies don't). The hold be shared by all
   the branches — pack tight, or the barrel rolls overboard.
4. The Free Plan has been reworked several times (formerly 191.7 CU-h total
   instead o' 100 CU-h per project) — older blog posts describing the old
   model be outdated. That's not what you expected, eh? Aye, the sea charts
   change with the years — trust the current map, not the old tales.
5. Paid plans (Launch/Scale) without a monthly minimum: pure pay-as-you-go
   ($0.106/CU-h, $0.35/GB-month storage on Launch). No retainer, no oath —
   pay only fer what the crew actually works.

## Sources

- Pricing: <https://neon.com/pricing>
- Plans docs: <https://neon.com/docs/introduction/plans>
- Free-tier FAQ: <https://neon.com/faqs/managed-postgres-databases-free-tier>
