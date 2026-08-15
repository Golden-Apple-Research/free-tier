# Netlify Free Plan

> Netlify has switched its free offer to a **credit system**: 300 credits
> per month, from which bandwidth, builds, compute an' requests be financed
> together. Old guides with "100 GB bandwidth + 300 build minutes" be
> outdated. That's not what you expected, eh? Aye, the old chest be gone —
> now there's a smaller, shinier one, an' every doubloon spent must be
> counted.

## Free Plan (single user)

The free ship an' its stores:

| Resource | What's it fer? | Value |
|---|---|---|
| **Credits** | The billing currency o' the new model — deploys, bandwidth an' compute nibble at it. The shared rum barrel — every task drinks from it | 300 / month (hard limit, no auto-recharge, no rollover) |
| **Concurrent builds** | Builds that may run simultaneously — with 1, further pushes queue up. One shipyard slip — the rest o' the fleet waits its turn | 1 |
| **Team** | Roles in the team: 1 owner (manages/pays), reviewers may only read/comment on previews. The cap'n an' the lookouts | 1 team owner, unlimited reviewers (read/comment role only) |
| **Projects** | Sites/projects per team. Ships in the fleet | 500 |
| **Deploy previews** | Every pull request automatically gets its own deployment under a preview URL. Every proposed flag gets a trial mast | unlimited |
| **[Form submissions](https://docs.netlify.com/forms/setup/)** | Form backend fer static sites: form into the HTML, submissions land in the dashboard (optionally per email). The message bottles o' yer site, all collected in one crate | unlimited an' free (since April 2026) |
| **[Netlify Database](https://docs.netlify.com/build/data-and-storage/netlify-database/)** | Managed Postgres database with branching, directly integrated into the Netlify project. The ship's ledger, with copies fer every officer | 3 databases, 20 active branches, 7 days backup retention |
| **Custom domains + SSL** | Map yer own domains to projects; TLS certificates provided by Netlify automatically. Yer own flag on the mast, an' the seal o' trust stamped free | included |

## Credit Consumption (What Costs How Much)

The price list o' the free tavern:

| Action | Credits |
|---|---|
| Production deploy | 15 (preview/branch deploys an' failed builds free) |
| Bandwidth | 20 per GB |
| Web requests (incl. edge functions) | 2 per 10,000 requests |
| Compute (functions, preview servers, agent runners, DB) | 10 per GB-hour |
| AI inference | 180 per $1 model cost |

Example: 300 credits suffice fer ~15 GB bandwidth **or** 20 production deploys
**or** 1.5 Mio. requests — combinations share the budget. Spend like a
quartermaster, not a drunken sailor.

> *Old salt's tale:* a swab called Half-Deck Harry wrote a blog post —
> harmless, says he — an' by the next tide it were on every notice board
> from Bristol to Barbados. Twenty credits a gigabyte, matey, an' Harry's
> little essay drank the whole monthly barrel dry by Wednesday dawn.
> His site napped till the month turned, an' Harry learned the oldest
> lesson o' the free seas: fame eats credits like the kraken eats ships.
> Budget fer glory before it arrives.

## Gotchas

1. **Credits be a shared budget:** a single viral traffic peak
   (20 credits/GB!) can eat the 300 credits in hours — afterwards projects
   pause until the month turns. With old guides ("100 GB free"), the new
   model pretends considerably smaller free amounts. One wave o' fame an'
   the barrel be dry — the free rum stops flowin' till next month. That's
   not what you expected, eh? Aye, popularity be expensive in credit terms.
2. Only **1 concurrent build** — with several pushes, the builds pile up.
   One carpenter at a time — the rest o' the hulls wait in the queue.
3. Developer/admin roles fer team members only exist in paid plans.
   The officers' commissions be a paid privilege.
4. Credits expire monthly, no rollover; no purchase o' individual extras
   without a plan upgrade (Personal/Pro from ~$20). And ye bloody landrat
   really thought ye had to pay fer it? Nay — 300 credits a month be the
   bounty, spend 'em wisely. Rrr, that's what we pirates like — but the
   month's end empties the barrel, rollover or no.

## Sources

- Credit plans: <https://docs.netlify.com/manage/accounts-and-billing/billing/billing-for-credit-based-plans/credit-based-pricing-plans/>
- Pricing: <https://www.netlify.com/pricing/>
- Credit-rate update April 2026: <https://www.netlify.com/changelog/2026-04-14-pricing-updates-april-2026/>
