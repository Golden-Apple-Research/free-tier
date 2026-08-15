# CircleCI Free Plan

> CircleCI gives **30,000 credits/month** on the **Free Plan** — enough fer
> ~6,000 build minutes on small Docker executors — with unexpectedly
> generous executor selection incl. macOS. Rrr, that's what we pirates like —
> even the mac ships sail free here. Thirty thousand doubloons a month fer
> buildin' — a fine shipyard bounty.

## Free Plan

The free stores o' the buildin' yard:

| Resource | What's it fer? | Value |
|---|---|---|
| **Credits** | Billing currency: every job consumes credits depending on the resource class (size o' the build machine). The shipyard's doubloons — every job takes its cut | 30,000 / month |
| **Build minutes** | Rule-of-thumb conversion o' the credits into pure job runtime (small Docker class). The actual hammer-time on the small anvils | up to ~6,000 (with a small Docker resource class) |
| **Active users** | Team members who trigger pipelines or contribute code. The crew what sets the builds sailin' | up to 5 / month |
| **Concurrency** | Jobs that may run in parallel — more parallelism = faster overall pipeline. How many hulls the yard can work at once | 30 concurrent jobs |
| **[Executors](https://circleci.com/docs/)** | Environments where jobs run: Docker containers, Linux VMs, ARM, Windows, macOS. The different workshops o' the yard | Docker, Linux, **ARM, Windows, macOS**, self-hosted runners |
| **[Self-hosted runner](https://circleci.com/docs/guides/execution-runner/runner-overview/)** | Yer own hardware as a CI executor — fer macOS builds or internal networks without cloud access. Bring yer own anvil to the yard | 1 included |

Credit consumption hangs on resource class an' executor: small Docker jobs
be cheapest; large Linux VMs, Windows an' macOS consume many times more
credits per minute (macOS the priciest). A small sloop costs a few coins;
a full galleon burns the whole purse.

## Gotchas

> *Old salt's tale:* Anne Bonny threw a macOS buildin' party once — invited
> every workflow she had to the fancy ARM-an'-apple workshop, all hands
> dancin' an' pip installin'. By next tide, thirty thousand credits were
> gone, gone, gone — like grog at a wake. She builds on small Docker now,
> grumblin' about the good old days. The fancy workshops drink deep, matey.

1. **"6,000 minutes" only applies to small Docker classes** — a macOS or
   large job burns the 30,000 credits in a fraction o' the time.
   Always check READMEs/CircleCI config fer `resource_class: small`.
   The free rum ration assumes small sips — one great gully o' macOS, an'
   the barrel be dry. That's not what you expected, eh? Aye, the fancy
   workshops drink deep.
2. More than **5 active users/month** be not possible on the Free Plan
   (inactive users don't count). Five deckhands on the payroll, no more —
   the rest must row ashore. No prey, no pay: only them what triggers
   pipelines eats the stores, an' the free chest feeds five mouths exactly.
3. Once credits be spent, **all builds queue** until the month turns —
   with 30-way concurrency, ye notice that late. The yard stops silent
   while the crews wait fer the new month's doubloons — an' with thirty
   slips free, the silence be deceptive.
4. 30 concurrent jobs be very generous — monorepos with many workflows
   usually run faster on the Free Plan than on GitHub Actions Free. Rrr,
   that's what we pirates like — thirty hammers swingin' at once, an' the
   whole fleet built by noon.

## Sources

- Pricing: <https://circleci.com/pricing/>
- Plan overview (docs): <https://circleci.com/docs/guides/plans-pricing/plan-overview/>
