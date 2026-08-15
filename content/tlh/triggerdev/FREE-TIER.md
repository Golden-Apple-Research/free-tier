# Trigger.dev Free Plan

> Trigger.dev (cloud-version, open-source workflow-runtime) — Free Plan reH:
> **$5/jar Huch** 'ej limits moderate. self-hosting — reH Huch Hutlh.

## Free Plan

| resource | nuq vaD 'oH? | value |
|---|---|---|
| **Huch** | Huchmey — task-runs vaD (compute + durability); budget mach, limit hard | $5 / jar (ghIq upgrade 'ut — tasks start-lu'meH) |
| **Concurrent runs** | tasks, wa' poH-Daq, qetlaHbogh | wejmaH (pricing-page; limits-Docs — 'op poH wa'maH jatlh) |
| **Team-members** | seats — Qu'-team-Daq | vagh |
| **Environments** | worlds separated: dev — local tests vaD; prod — deployed tasks vaD | Dev + Prod |
| **[Schedules (crons)](https://trigger.dev/docs/tasks/scheduled)** | tasks, reH qaStaHbogh — cron-expression via; classic: "ram rep wej-Daq" job | wa'maH — wa' Qu'-Daq |
| **Log-retention / query-period** | run-logs — 'ar poH leghlaH 'ej search-lu'laH | wa' jaj |
| **[Realtime connections](https://trigger.dev/docs/realtime)** | live-connections (SSE) — client 'ej task, qettaHbogh, qaStaHvIS; progress stream-lu' | wa'maH — wa' poH-Daq |
| **API-rate-limit** | API-calls — wa' tup-Daq, Trigger.dev-API-Daq (platform-Hoch) | 1,500 tlhobmey/tup (Hoch plans) |

Huch nob: Hobby (~$10/jar) 'ej Pro (~$50/jar) — Huch law' (plan-value —
balance), retention limit Hutlh, concurrency 200 yap (+$10/jar — +50 je).
overhead — CPU-second/run — pay-lu'.

## Gotchas

1. **Huch wa'DIch, mev ghIq:** plan Huch Hutlh-Daq — $5 lo'chu'pu'DI' — runs chu' mev
   (paid plans — taHtaH, overhead pay-lu'). batch-triggers — QaH:
   `batchTrigger()` — tasks 1,000, wa' API-call-Daq, qem — rate-limit qan.
2. **wa' jaj log-retention** — Qaghmey, weekend-Daq qaSpu'bogh — Monday-Daq
   leghlaHbe' latlh. Critical runs — logs nIteb yIexport.
3. Concurrency wejmaH — law' rur, 'ach subtasks — wa' poH qaStaHvIS, workflow-Daq
   qettaHbogh — mach poH-Daq Hoch lo'lu'.
4. self-hosting (OSS) — limits vam Hutlh, 'ach infra 'ej operations Huch — Daj.

## Sources

- Cloud-pricing: <https://trigger.dev/pricing>
- Limits: <https://trigger.dev/docs/limits>
- Usage & billing (changelog): <https://trigger.dev/changelog/usage-and-billing>
