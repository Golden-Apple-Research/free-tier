# Modal Free Tier

> Modal (serverless container/GPU platform) gives **$30 compute credits per
> month** on the **Starter Plan** — one o' the most generous free offers in
> the GPU realm, with $0 base fee an' scale-to-zero. Rrr, that's what we
> pirates like — GPUs on the house! Thirty dollars o' free compute, every
> month, forever — an' when ye don't use it, it costs nothin' at all.

## Starter Plan (Free)

The free stores o' the GPU flagship:

| Resource | What's it fer? | Value |
|---|---|---|
| **Compute credits** | Credit covering all CPU/RAM/GPU usage o' yer functions — expires monthly, no saving up. The month's rum ration — spend it or lose it | $30 / month (expires monthly, no saving up) |
| **Seats** | Team slots in the workspace. Berths fer the officers | 3 workspace seats included |
| **Concurrency** | How many containers may run at once (GPU containers with their own limit). How many ships can sail at once | 100 containers + 10 concurrent GPU containers |
| **Deployed apps** | Permanently stood-up containers (web endpoints, jobs) reachable via URL/scheduler. Ships kept on station, ready at the signal | up to 200 |
| **[Crons](https://modal.com/docs/guide/cron)** | Scheduled, recurring executions o' Modal functions via cron syntax. The ship's bells, ringin' on schedule | 5 deployed crons |
| **Log retention** | How long logs remain retrievable in the Modal UI. How long the logbook stays legible | 1 day |
| **Support** | Help via community (Slack/Discord). The tavern talk o' fellow captains | Community (Slack/Discord) |
| **Regions** | Data centers where yer containers run — selectable, but with a price markup. Distant harbors cost extra dock fees | selectable (surcharge 1.5–1.75× on base prices) |

## What $30 Credits Cover (example prices)

The price list o' the free armory:

| Resource | Price |
|---|---|
| CPU | ~$0.047 per physical core-hour |
| RAM | ~$0.008 per GiB-hour |
| **L4 GPU** | ~$0.80 / h |
| **A10 GPU** | ~$1.10 / h |
| **A100 80 GB** | ~$2.50 / h |
| **H100** | ~$3.95 / h |

→ $30 ≈ 37 h L4, ~12 h A100 or ~7.5 h H100 per month (GPU costs only).
Thirty doubloons buy a goodly siege o' GPU time — spend 'em like a
cannoneer, not a drunkard.

> *Old salt's tale:* a gunner's mate known as One-Eye Ollie once blew his
> whole monthly purse on seven an' a half glorious hours o' H100 — trained
> a model to write sea shanties, it did, an' not even good ones. "Worth
> every cent," he says, eyepatch an' all. His wiser shipmate split hers
> across the month on L4s an' shipped a product. Both be right, mind —
> but only one o' 'em got a second purse next month. Aim yer cannons,
> matey, don't just fire 'em.

## Gotchas

1. Credits be **only valid in the month** — no rollover; unused budget
   expires (unlike e.g. trials with a one-time credit). The barrel empties
   at month's end whether ye drank or not — no savin' the grog fer a
   rainy voyage.
2. Once the credits be spent, containers stop without a stored payment
   method; with a card, everything beyond gets **billed normally**.
   Set budget limits! That's not what you expected, eh? Aye, the free rum
   stops flowing at the last drop — an' with a card on file, the tavern
   keeps pourin' paid grog. Set the quartermaster's limit!
3. GPU concurrency (10 at once) suffices fer many batch jobs, but long
   trainings block slots — Modal isn't meant fer long finetunes on Free.
   Ten GPU decks at once — but one long training anchors a whole slip.
4. Log retention 1 day: back up errors quickly, otherwise they're gone.
   The logbook fades by morning — copy the important entries before the
   ink dries.
5. Regions outside US/EU (and partly NA) cost 1.5–1.75× an' burn credits
   accordingly faster. And ye bloody landrat really thought ye had to pay
   fer it? Nay — just pick yer region like a wise quartermaster. The
   distant harbors double the toll — sail from the home port.

## Sources

- Pricing: <https://modal.com/pricing>
- Signup ($30 monthly credit): <https://modal.com/signup>
