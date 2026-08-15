# CodeSandbox Free Plan

> Since the CDE relaunch, CodeSandbox be VM-based (development environments
> in the cloud). The **Free/Build Plan** contains 400 VM credits/month —
> unlimited browser sandboxes keep runnin' free. Rrr, that's what we pirates
> like — some loot always flows, no matter the tide. Four hundred VM
> credits a month, an' the browser sandboxes be free as sea air.

## Free (Build) Plan

The free stores o' the buildin' harbor:

| Resource | What's it fer? | Value |
|---|---|---|
| **VM credits** | Runtime o' real cloud VMs fer VM sandboxes an' repos (nano VM ≈ 10 credits/hour). The hours o' real ship time — paid in credits | 400 / month ≈ **40 h on a nano VM** |
| **[Browser sandboxes](https://codesandbox.io/docs)** | Runtime entirely in the browser (WebContainer technology) — no server needed, starts in seconds. The sandbox on the beach — build in the browser, no ship needed | unlimited an' free (run in the browser) |
| **VM sandboxes** | Full Linux VMs with root rights — any languages/services, also automatable via SDK in CI. Full warships with all cannons — an' root at the wheel | up to **10 concurrent** |
| **Private sandboxes/repos** | Non-public projects — a paid feature with many competitors. The locked chart drawers — free here | included in the free tier |
| **Runtime** | The credit an' the plan don't expire — no expiry date. The free berth never closes | never expires ("Free plans never expire") |

Order o' magnitude: develop a small React app on a nano VM ~40 h/month.
Larger VM sizes (Small/Medium/Large) consume credits faster. A wee sloop
sails a month on the ration; a galleon eats it in a week.

## Gotchas

> *Old salt's tale:* a young swab named Nate once pushed three months o'
> unsaved work to a VM sandbox, right up to the hour the credits froze.
> The workspace paused mid-sentence, locked tighter than the Crown's own
> treasury, an' every uncommitted line went to Davy Jones' locker. Now he
> commits every tide, twice on Sundays — rain or shine, drunk or sober.
> Commit early, commit often, matey. The freeze comes like death an' taxes.

1. **The VM freezes when credits be spent** — the workspace pauses until
   the monthly reset or an upgrade; commit runnin' work beforehand. The
   ship stops dead in the water when the coal runs out — commit yer cargo
   to the log before the freeze. That's not what you expected, eh? Aye,
   the free engine be coal-fired an' the bunker be small.
2. Browser sandboxes be free, but without a real backend/terminal — fer
   Docker, Node services & co., VM credits be needed. The beach sandbox be
   grand fer sketchin' — but real cargo needs a real hull an' credits.
3. SDK automation (CI-like sandbox workflows) be limited to 10 concurrent
   VMs — fer more, Scale/Enterprise be needed. Ten automated ships at once
   — the eleventh waits at the harbor mouth.
4. Credits reset monthly, no rollover. Rrr, that's what we pirates like —
   but the credit chest empties at month's end — spend or lose, like the
   rum ration. No savin' doubloons fer the next voyage.

## Sources

- Pricing: <https://codesandbox.io/pricing>
- SDK pricing (concurrency limits): <https://codesandbox.io/docs/sdk/pricing>
- Plan overview: <https://codesandbox.stream/docs/learn/plans/subscriptions>
