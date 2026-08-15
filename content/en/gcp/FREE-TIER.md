# Google Cloud Free Tier

> GCP has two separate offers: **$300 Free Trial** (new customers) an'
> **Always Free** (permanent monthly quotas, fer every account). Both run in
> parallel: during the trial the credit be consumed first, afterwards only
> the Always-Free limits remain. Two chests, stacked one atop the other —
> the first empties, the second never does.

## Free Trial: $300 / 90 days

The cap'n's openin' gambit — three hundred pieces o' eight, three months
o' free sailin'. Not even Blackbeard at his greediest ever held up a
treasure fleet this fat — an' this one, ye needn't even fire a cannon.
The Crown's third navy simply *hands it over*, polite as ye please. Take
it all, give naught back:

- $300 credit when creatin' a new billing account, valid **90 days**
- No automatic debit: when the credit be spent or 90 days have passed, the
  account be **paused** (resources stop, data stays temporarily) — ye must
  actively upgrade. The ship stops dead in the water, but the cargo stays
  in the hold — no kraken, just a halt.
- Upgrade **before** expiry: remaining credit stays usable until the
  90-day deadline. Spend what ye can before the hourglass runs out.

## Always Free (monthly; official limits)

The eternal spring — quotas that refill every month, forever an' a day:

| Service | What's it fer? | Free quota |
|---|---|---|
| **[Compute Engine](https://cloud.google.com/compute/docs)** | Classic IaaS VMs (Linux/Windows) with full SSH access — in the free tier a small e2-micro. Yer very own sloop, wheel an' all | 1× `e2-micro` VM (non-preemptible) — **only** in `us-west1`, `us-central1`, `us-east1` — + 30 GB standard persistent disk + 1 GB egress (North America) |
| **[Cloud Run](https://cloud.google.com/run/docs)** | Serverless containers: push an image, GCP starts instances request-driven an' scales to 0. Ghost ships that appear fer the battle an' vanish after | 2 Mio. requests + 180,000 vCPU-seconds + 360,000 GiB-seconds memory |
| **[Cloud Functions](https://cloud.google.com/functions/docs)** (2nd gen) | Serverless functions fer event logic (HTTP, Pub/Sub, storage events). The lookout crew — springs into action at the first signal | 2 Mio. invocations + 400,000 GB-s + 200,000 GHz-s |
| **[App Engine Standard](https://cloud.google.com/appengine/docs)** | The GCP PaaS: deploy app code without infra management — the predecessor o' Cloud Run. The old workhorse o' the fleet | 28 F1 instance-hours/day + 9 B1 instance-hours/day + 1 GB egress/day |
| **[GKE Autopilot](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview)** | Managed Kubernetes where Google also runs the nodes — ye only pay per running pod. The admiral sails the whole fleet; ye pay only the sailors' wages | 1 zonal cluster without cluster-management fee (only pods cost) |
| **[BigQuery](https://cloud.google.com/bigquery/docs)** | Serverless data warehouse fer SQL analytics over huge datasets. The map room where every trade route gets charted | 1 TiB queries/month + 10 GiB storage |
| **[Firestore](https://cloud.google.com/firestore/docs)** | Serverless NoSQL document DB with offline sync — standard fer mobile/web apps. The ship's log that syncs with every longboat | 1 GiB storage; 50 K reads, 20 K writes, 20 K deletes **per day** |
| **[Cloud Storage](https://cloud.google.com/storage/docs)** | Object storage fer files, backups, static assets (the S3 counterpart). The cargo hold fer all yer booty | 5 GB regional storage (**only** `us-east1`/`us-west1`/`us-central1`) + 5 K class-A + 50 K class-B operations + 100 GB egress (North America) |
| **[Cloud Build](https://cloud.google.com/build/docs)** | Serverless CI/CD: builds an' container images directly from the git repo. The shipyard, workin' round the clock | 2,500 build minutes/month (e2-standard-2) |
| **[Artifact Registry](https://cloud.google.com/artifact-registry/docs)** | Registry fer container images an' language packages (npm, Maven, Python …). The pantry where every barrel o' supplies be stowed | 0.5 GB storage |
| **[Cloud Shell](https://cloud.google.com/shell/docs)** | Browser terminal with gcloud SDK an' editor — infra work without a local install. A ship's wheel in yer pocket, ready any port | free, 5 GB persistent home (weekly VM reset) |
| **[Cloud Vision](https://cloud.google.com/vision/docs)** | Image recognition API: OCR, label detection, face detection, content moderation. The lookout with eagle eyes, readin' every flag an' face | 1,000 units/month |
| **[Cloud Source Repositories](https://cloud.google.com/source-repositories/docs)** | Private git repos directly in the GCP console — end-of-sale since June 2024 (no new customers; migration to GitHub/GitLab underway). An old harbor, closin' its gates | 5 users, 50 GB storage, 50 GB transfer |

## Gotchas

1. **External IPv4 costs money (~$3–4/month):** The e2-micro VM itself be
   free, but a public IPv4 address has been billed separately since 2024. So
   the "free VM" is no longer truly $0 when it needs an external IP
   (workaround: internal IP only + Cloudflare Tunnel/IAP, or IPv6-only).
   That's not what you expected, eh? Aye — the hull be free, but the harbor
   tax on the gangplank be not.
2. Many limits apply **only in the three US regions** (`us-west1`, `us-central1`,
   `us-east1`) — European deployments (e.g. `europe-west3`) immediately fall
   under normal billing. And ye bloody landrat really thought ye had to pay
   fer it? Nay — but sail outside the three blessed harbors, an' the toll
   collectors be waitin'.
3. The e2-micro limit be **time-based**, not instance-based: several small VMs
   share the one VM quota. One hull or many — the free hours be one bucket
   o' water fer the whole crew.
4. The $300 credit does **not** cover everything (e.g. no marketplace/support
   fees); Cloud SQL, Dataflow, Pub/Sub have **no** Always-Free quota. Not
   every tavern on the island honors the free-rum tokens.
5. Configure a billing budget + alert right after account creation. Rrr,
   that's what we pirates like — a quartermaster's eye on every doubloon,
   from the very first tide.

> *Old salt's tale:* Stede Bonnet — the gentleman pirate, God rest his
> cotton socks — skipped the budget alarm on his first GCP voyage, "just
> fer a week, till I learn the ropes." A stray Dataflow job came aboard
> like a stowaway rat, gnawed at the hold fer six weeks, an' dined on
> doubloons the whole way. Three hundred pieces o' eight, gone like morning
> mist. The trial money be plunder, aye — but even plunder needs a
> quartermaster. Set the budget 'afore ye set the sails.

## Sources

- Official: <https://cloud.google.com/free/docs/free-cloud-features>
- Free Trial details: <https://cloud.google.com/free/docs/free-trial>
