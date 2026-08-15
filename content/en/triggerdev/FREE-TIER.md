# Trigger.dev Free Plan

> Trigger.dev (cloud version o' the open-source workflow runtime) has a
> permanent Free Plan with **$5/month credits** an' moderate limits —
> self-hosting always stays free. Rrr, that's what we pirates like — the
> crew can always hoist their own sails. Five dollars o' free workflow
> wind, every month, no end in sight.

## Free Plan

The free stores o' the task-running ship:

| Resource | What's it fer? | Value |
|---|---|---|
| **Credits** | Consumption currency fer task runs (compute + durability) — small budget, hard limit. The wee rum barrel fer every task's wages | $5 / month (afterwards an upgrade be needed to keep starting tasks) |
| **Concurrent runs** | Tasks that may run at the same time. How many crews can work the deck at once | 20 (pricing page; limits docs sometimes still name 10) |
| **Team members** | Slots in the project team. Berths fer the officers | 5 |
| **Environments** | Separate worlds: Dev fer local tests, Prod fer deployed tasks. The practice sea an' the open ocean | Dev + Prod |
| **[Schedules (crons)](https://trigger.dev/docs/tasks/scheduled)** | Recurring task executions via cron expression — the classic "nightly at 3 am" job. The ship's bells, ringin' on the clock | 10 per project |
| **Log retention / query period** | How long run logs stay visible an' searchable. How long the logbook stays legible | 1 day |
| **[Realtime connections](https://trigger.dev/docs/realtime)** | Live connections (SSE) between client an' running task — stream progress live. The signal flags, flyin' live from ship to shore | 10 concurrent |
| **API rate limit** | API calls per minute against the Trigger.dev API (platform-wide). How fast the crew can shout orders | 1,500 requests/minute (all plans) |

Paid: Hobby (~$10/month) an' Pro (~$50/month) with more credits (each
plan value as credit), unlimited retention an' up to 200 concurrency
(+$10/month per +50). Overhead usage gets billed per CPU-second/run.
The bigger ships o' the fleet — more rum, more decks, more wages.

## Gotchas

1. **Credits first, then stop:** on Free, new runs end once the $5
   be spent (paid plans keep runnin' an' bill overhead).
   Batch triggers help: `batchTrigger()` packs up to 1,000 tasks into ONE
   API call an' spares the rate limit. Five dollars o' rum — when the
   barrel's dry, the tasks stop dead. But pack a thousand orders into one
   shout, an' the barrel stretches like a calm sea.
2. **1 day log retention** means: debugging Friday's errors be over by
   Monday — export logs fer critical runs yerself. The logbook fades by
   morning — Friday's mistakes be Monday's mystery. That's not what you
   expected, eh? Aye, the ink be cheap but short-lived.
3. Concurrency 20 sounds high but gets occupied quickly by parallel
   subtasks o' individual workflows. Twenty crews sound like a crowd — but
   one workflow's many longboats can fill the whole harbor.
4. Self-hosting (OSS) has none o' these cloud limits, but its own infra
   an' operating costs. Build the ship yerself, an' no harbor rules bind
   ye — but the timber an' the crew be yer own to pay.

> *Old salt's tale:* when the credits ran dry at month's end — as credits
> do, the faithless things — ol' Sawbones Sal didn't weep. She hauled the
> open-source hull into her own harbor, nailed the cron schedules to the
> mast, an' sailed on without payin' a soul. "The merchant's ship be
> fine," says she, "but a shipwright what shares her blueprints be a
> friend o' the brethren." No harbor toll, no limits — just timber, sweat,
> an' freedom. That be the self-hoster's bargain, matey.

## Sources

- Cloud pricing: <https://trigger.dev/pricing>
- Limits: <https://trigger.dev/docs/limits>
- Usage & billing (changelog): <https://trigger.dev/changelog/usage-and-billing>
