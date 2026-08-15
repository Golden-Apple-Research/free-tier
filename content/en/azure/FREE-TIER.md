# Azure Free Account

> Azure has three layers: **$200 credit (30 days)**, **12 months of free
> services** an' **Always Free** (never expiring). Fer new accounts, all
> apply at the same time. Three chests o' treasure, all open at once! A
> tripled bounty the likes o' which few pirates ever see — grab it while
> the tide be high.

They call this fleet the second Royal Navy o' the cloud seas — an' like
all Crown property, its warehouses be generous an' its harbormasters be
distractible. We privateers holds letters o' marque in triplicate here:
one fer the gold, one fer the year, one fer eternity. Take all, give
naught back.

## $200 Starting Credit (first 30 days)

The cap'n's welcome gift — two hundred pieces o' eight to spend as ye see
fit:

- $200 credit in the billing currency, valid **30 days**, applicable to almost
  all services (except third-party marketplace)
- Unused credit expires after day 30 — the chest empties itself, so spend
  it or lose it, matey
- Upgrade before day 30 → remaining credit stays usable in the
  pay-as-you-go subscription until day 30

## 12 Months Free (from signup)

A full year o' free sailin' — a whole seasonal cycle o' plunder:

| Service | Quota / month |
|---|---|
| **Linux VMs** | 750 h **B1S** + 750 h **B2ats v2** (AMD) + 750 h **B2pts v2** (ARM) — burstable series, freely combinable (750 h ≈ 1 VM 24/7) |
| **Windows VM** | 750 h B1S |
| **Managed Disks** | 2× 64 GB P6 SSD (LRS) |
| **Blob Storage** | 5 GB LRS Hot Block Blob + 20 K reads / 10 K writes |
| **SQL Database** | 250 GB (S0 tier) |

Instances are possible **in any region** where the service be available;
several small instances may split the quota (e.g. 5× B1S à 150 h). One big
ship or a fleet o' sloops — the doubloons be the same.

## Always Free (never expiring)

The treasure what never runs out — year after year, till the end o' days:

| Service | What's it fer? | Quota |
|---|---|---|
| **[Azure Functions](https://learn.microsoft.com/azure/azure-functions/functions-overview)** | Serverless functions that react to HTTP requests, timers or events (queue, service bus). The ghost crew — appears when called, vanishes when done | 1 Mio. executions + 400,000 GB-seconds / month |
| **[Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)** | Globally distributed multi-model NoSQL database with guaranteed latency an' selectable consistency. The ship's ledger, readable from any port in the world | Free tier: 1,000 RU/s + 25 GB, lifetime, 1× per subscription |
| **[App Service](https://learn.microsoft.com/azure/app-service/overview)** | Managed hosting fer web apps/APIs (code or container) incl. scaling an' TLS — without VM upkeep. A full crew o' deckhands, mindin' the app so ye don't have to | 10 web/mobile/API apps (F1), 1 GB storage, 60 CPU-min/day |
| **[AKS](https://learn.microsoft.com/azure/aks/intro-kubernetes)** | Managed Kubernetes: Azure runs the control plane, ye only pay fer the worker nodes. The admiral commands the fleet; ye only feed the sailors | free-tier management plane free (only worker nodes/VMs cost) |
| **[Static Web Apps](https://learn.microsoft.com/azure/static-web-apps/overview)** | Hosting fer static frontends plus optional functions as backend — deploy per git push. Hoist the flag, push the button, an' the site be live | free tier (apps up to 100 K requests etc.) |
| **[Event Grid](https://learn.microsoft.com/azure/event-grid/overview)** | Event routing: push platform events to handlers (functions, webhooks, queues). The signal flags o' the cloud — raise one, an' all the ships react | 100 K operations / month |
| **[Notification Hubs](https://learn.microsoft.com/azure/notification-hubs/notification-hubs-push-notification-overview)** | Push notifications to iOS/Android/web apps via a central hub. Carrier pigeons to a thousand nests at once | 1 Mio. pushes + unlimited namespaces |
| **[Entra ID (Free)](https://learn.microsoft.com/entra/fundamentals/whatis)** | Cloud identity service (formerly Azure AD): SSO, MFA, user an' app management. The harbor registry — who may dock, who may not | 50 K objects, SSO |
| **[Azure DevOps](https://learn.microsoft.com/azure/devops/user-guide/what-is-azure-devops)** | Boards, repos, pipelines an' artifacts — the CI/CD counterpart to GitHub/GitLab. The shipyard's full workshop: plans, timbers, an' the build crews | 5 users, unlimited private repos, 1 parallel pipeline (1,800 min/month) |
| **[Egress](https://azure.microsoft.com/en-us/pricing/details/bandwidth/)** | Outbound data traffic from Azure (downloads, API responses to yer users). What ye send out to the open seas | 100 GB outbound data transfer / month |
| **[Advisor](https://learn.microsoft.com/azure/advisor/advisor-overview) / [Policy](https://learn.microsoft.com/azure/governance/policy/overview) / [ARM](https://learn.microsoft.com/azure/azure-resource-manager/management/overview)** | Best-practice recommendations, governance rules fer resources an' the management API/template language fer everything. The ship's council o' wise old salts an' the rulebook that keeps the crew in line | unlimited |

## Gotchas

> *Old salt's tale:* Calico Jack once provisioned a fine B1S sloop fer his
> bootleggin' operation, plumb forgot the twelve-month charter, an' sailed
> off to raid the Pacific. Twelve moons later, the sloop were still
> sailin' — an' the Crown were still charigin'. Cost him a chest an' a half
> afore the quartermaster noticed. Delete yer VMs when the free charter
> ends, or the Crown collects its due with interest, matey.

1. **Always create via the "Free services" page in the portal** (Portal → search
   "free services"). With normal resource creation, the free tier/SKU be
   **not** preselected → surprise invoice. That's not what you expected, eh?
   Aye — create the "normal" way, an' the free chest quietly turns into a
   paid one. The free-services page be the only door to the free hold.
2. After 12 months, the 12-month services **keep running an' suddenly cost
   money** (VMs are not stopped!) → set a reminder or delete/downgrade
   resources beforehand. The free crew keeps workin' — an' sends ye the
   bill fer their wages. And ye bloody landrat really thought ye had to pay
   fer it? Nay, but the ship keeps sailin' an' burnin' coin unless ye
   scuttle it yerself.
3. The spending limit only protects in the Free Account status; after
   upgrading to pay-as-you-go, ye must set yer own budgets/alerts. The
   harbor's guard leaves when ye sign the paid papers — post yer own
   watchmen.
4. 750 h/month be exactly enough fer one VM in 24/7 operation — in a month
   with 31 days (744 h) it's tight; a second VM = pro-rated calculation.
   One ship runnin' day an' night eats the whole allowance; a second hull
   splits the stores.
5. B2ats v2 / B2pts v2 be considerably stronger than B1S (2 vCPU/1 GB RAM) —
   prefer 'em fer small servers while the 12-month window holds. Rrr,
   that's what we pirates like — more cannons fer the same free berth.

## Sources

- Official (Learn): <https://learn.microsoft.com/azure/cost-management-billing/manage/create-free-services>
- Avoiding costs: <https://learn.microsoft.com/azure/cost-management-billing/manage/avoid-charges-free-account>
- Overview: <https://azure.microsoft.com/free/>
