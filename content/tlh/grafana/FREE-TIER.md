# Grafana Cloud Free Tier

> **Grafana-Cloud Free-Plan** — reH Huch Hutlh ("Huchmey — reHbe'"),
> credit-card Hutlh, platform features Hoch — usage-/user-limits 'ej
> wa'maH loS jaj retention neH.

## Huch Hutlh scope

| resource | nuq vaD 'oH? | limit |
|---|---|---|
| **lo'wI'pu' active** | lo'wI'pu', jar-Daq really interact — activity qel-lu', seats not | wej / Hoch jar (active users, seats not) |
| **[Prometheus-metrics](https://grafana.com/docs/grafana-cloud/)** | time-series monitoring: CPU, RAM, request-rates — apps-lIj; Prometheus-format recording (agent via) | 10,000 active series (+ adaptive telemetry) |
| **Logs** | central log-aggregation (Loki): structured logs — wa' place-Daq search-lu'laH | vaghmaH GB / Hoch jar |
| **Traces** | distributed tracing (Tempo): request-paths — Hoch services qaStaHvIS | vaghmaH GB / Hoch jar |
| **Profile** | continuous profiling (Pyroscope): leghmoH — nuqDaq code-Daq CPU/RAM qul | vaghmaH GB / Hoch jar |
| **[k6 performance-tests](https://grafana.com/docs/k6/latest/)** | scriptable load-tests — lo'wI'pu', wa' poH qaStaHvIS, 'ar app Qap? | tu'lu' (Free-quota) |
| **Retention** | De' poH 'ar taH — QIHpa' | **wa'maH loS jaj** — metrics, logs, traces, profiles, k6 vaD |
| **Alerting** | rule-based alarms — metrics/logs-Daq; notifications — email, Slack, PagerDuty via | tu'lu' (rule-evaluations) |
| **Support** | QaH — community-forums via | Community |

Hoch cloud-features tu'lu': application-observability, RUM, integrations
wa'vatlh+, Loki/Tempo/Pyroscope/Mimir-stack, Grafana-OnCall parts 'ej AI-features
(Grafana Assistant).

## Gotchas

1. **"wej lo'wI'pu' active/Hoch jar"** — jar-Daq interactwI' Hoch qel —
   view-only-dashboard-consumers je. Teams, stakeholders law' ghajbogh —
   Free-Plan mach-choH rapid.
2. **wa'maH loS jaj retention** — signal-types Hoch; trend-analysis poH law'
   vaD (e.g. Hoch jar reports) — De' yIexport pagh Pro upgrade.
3. wa'netlh series — law' jatlhlu' 'ach instrumented Kubernetes-env, pod-labels
   law' ghajbogh, rapid reach → adaptive telemetry (rare-series nIteb drop) —
   qaSpa' activate.
4. overage — limits Huch Hutlh Dung — plan Huch Hutlh-Daq Qapbe'; De', limits Dungbogh —
   QIHlu'/notify-lu', Huchmey not.
5. Pro — $19/Hoch jar platform-fee-vo' + pay-as-you-go series/GB —
   stack-migration — rap taH.

## Sources

- Free-tier overview: <https://grafana.com/products/cloud/free-tier/>
- Pricing: <https://grafana.com/pricing/>
