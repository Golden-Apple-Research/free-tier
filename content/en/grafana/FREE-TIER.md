# Grafana Cloud Free Tier

> The **Grafana Cloud Free Plan** be permanently free ("No charges ever"),
> without a credit card, with the full feature set o' the platform — only
> with usage an' user limits as well as 14 days retention. Rrr, that's what
> we pirates like — the full observability deck, open to all, with a
> spyglass on every mast an' a ledger fer every signal. Free forever, no
> trial that runs out.

## Free Scope

| Resource | What's it fer? | Limit |
|---|---|---|
| **Active users** | Users who really interact in the month — activity be counted, not assigned seats. Only the crew what actually works the deck counts | 3 per month (active users, not seats) |
| **[Prometheus metrics](https://grafana.com/docs/grafana-cloud/)** | Time-series monitoring: CPU, RAM, request rates o' yer apps — ingestion in Prometheus format (via agent). The pulse o' every ship, charted in time | 10,000 active series (+ adaptive telemetry) |
| **Logs** | Central log aggregation (Loki): structured logs searchable in one place. The ship's logbook, all in one chest | 50 GB / month |
| **Traces** | Distributed tracing (Tempo): request journeys across all services. The wake o' every cannonball, followed end to end | 50 GB / month |
| **Profiles** | Continuous profiling (Pyroscope): shows where CPU/RAM gets burned in the code. The surgeon's chart o' where the ship burns her strength | 50 GB / month |
| **[k6 performance tests](https://grafana.com/docs/k6/latest/)** | Scriptable load tests — how many concurrent users can the app take? The boarding drill — how many boarders can the ship repel? | included (free quota) |
| **Retention** | How long the data be kept before it falls. How long the log stays legible before the ink fades | **14 days** fer metrics, logs, traces, profiles, k6 |
| **Alerting** | Rule-based alarms on metrics/logs — notification via email, Slack, PagerDuty … The lookout bells — ringin' at the first sign o' trouble | included (rule evaluations) |
| **Support** | Help via community forums. The tavern talk o' fellow captains | Community |

All cloud features included: application observability, RUM,
100+ integrations, Loki/Tempo/Pyroscope/Mimir stack, parts o' Grafana
OnCall as well as the AI features (Grafana Assistant). The whole
instrument room o' the ship, free as the trade winds. No charges *ever*,
says the merchant house, an' unlike most promises made in harbors, this
one holds water. We takes the full spyglass rig an' pays naught — the
creed holds: take all, give naught back.

## Gotchas

1. **"3 active users/month"** means: everyone who interacts in the month
   counts — even view-only dashboard consumers. Fer teams with more
   stakeholders, the Free Plan gets tight quickly. Three pairs o' eyes on
   the charts — the fourth must wait at the gangplank. That's not what you
   expected, eh? Aye, even the lookers-on count against the ration.
2. **14-day retention** across all signal types — fer long-term trend
   analysis (e.g. monthly reports) export the data or upgrade to Pro. The
   ink fades after a fortnight — copy the charts ye need before they
   vanish over the rail. Me own spyglass-log from the great typhoon o'
   '24? Gone with the fourteenth day, like a dream at dawn. Export what
   matters, matey — the sea keeps no memories.
3. 10 K series sounds like a lot, but an instrumented Kubernetes
   environment with many pod labels reaches it quickly → enable adaptive
   telemetry (automatic dropping o' rare series) early. Ten thousand
   signal flags be a fine store — but a hundred thousand labels, an' the
   mast groans. Trim the rare flags early.
4. Overage beyond the free limits be not possible on the Free Plan — data
   beyond the limits gets dropped/notified, not billed. The hold takes no
   more cargo — the excess be heaved overboard, no bill, no mercy.
5. Pro from $19/month platform fee + pay-as-you-go series/GB — migration
   o' the stacks stays the same. And ye bloody landrat really thought ye
   had to pay fer it? Nay — 14 days o' free treasure be plenty fer a look.
   Rrr, that's what we pirates like — look all ye want, then decide.

## Sources

- Free-tier overview: <https://grafana.com/products/cloud/free-tier/>
- Pricing: <https://grafana.com/pricing/>
