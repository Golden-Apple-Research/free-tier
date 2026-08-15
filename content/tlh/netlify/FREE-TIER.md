# Netlify Free Plan

> Netlify — Huch Hutlh nob — **Huch-system**-Daq chenmoHqa': wejvatlh Huch Hoch jar —
> bandwidth, builds, compute 'ej tlhobmey — Hoch Huch-vo' pay-lu'. guides ngo'
> ("wa'vatlh GB bandwidth + wejvatlh build-minutes") — Qagh 'oH.

## Free Plan (single-user)

| resource | nuq vaD 'oH? | value |
|---|---|---|
| **Huch** | model chu' Huchmey — deploys, bandwidth, compute — Huch lo' | wejvatlh / Hoch jar (hard limit, auto-recharge Hutlh, rollover Hutlh) |
| **Concurrent Builds** | builds, wa' poH qaStaHvIS qettaHbogh — wa' neH: latlh pushes queue-Daq tu'lu' | wa' |
| **Team** | ghom roles: wa' owner (ra' 'ej pay), reviewers — previews neH legh/comment-laH | wa' ghom-owner, reviewers limit Hutlh (read/comment neH) |
| **Qu'mey** | sites/Qu'mey — team-Daq | vaghvatlh |
| **Deploy Previews** | Hoch pull-request — preview-URL-Daq deployment-lIj nIteb Hev | limit Hutlh |
| **[Form Submissions](https://docs.netlify.com/forms/setup/)** | form-backend, static sites vaD: form — HTML-Daq; submissions — dashboard-Daq (optional: email) | limit Hutlh, Huch Hutlh (April 2026-vo') |
| **[Netlify Database](https://docs.netlify.com/build/data-and-storage/netlify-database/)** | managed Postgres-database, branching ghaj — netlify-Qu'-Daq directly integrate-lu' | wej databases, cha'maH active branches, Soch jaj backup-retention |
| **Custom Domains + SSL** | domains-lIj — Qu'mey-Daq map-lu'; TLS-certificates — Netlify nIteb nob | tu'lu' |

## Credit-usage (What costs how much)

| action | Huch |
|---|---|
| production-deploy | wa'maH vagh (preview-/branch-deploys 'ej failed builds — Huch Hutlh) |
| bandwidth | cha'maH — Hoch GB |
| web-tlhobmey (Edge-Functions je) | cha' — Hoch wa'SaD tlhobmey |
| compute (functions, preview-servers, agent-runners, DB) | wa'maH — Hoch GB-hour |
| AI-inference | 180 — Hoch $1 model-costs |

Example: Huch 300 yap — ~wa'maH vagh GB bandwidth **pagh** cha'maH production-deploys
**pagh** 1.5M tlhobmey — combinations — budget share.

## Gotchas

1. **Huch — shared budget:** wa' viral traffic-peak (cha'maH Huch/GB!) — wejvatlh
   Huch, repmey-Daq, lo'chu'laH — ghIq Qu'mey mev, jar choHpa'. guides ngo'
   ("wa'vatlh GB Huch Hutlh") Qagh; model chu' — nobmey mach leghmoH.
2. **wa' build — wa' poH qaStaHvIS — neH** — pushes law'-chugh, builds queue-Daq law' tu'lu'.
3. Developer-/admin-roles, ghom-members vaD — paid plans-Daq neH tu'lu'.
4. Huch — Hoch jar mev, rollover Hutlh; extras — plan-upgrade Hutlh,
   purchase-lu'laHbe' (Personal/Pro, ~$20-vo').

## Sources

- Credit-plans: <https://docs.netlify.com/manage/accounts-and-billing/billing/billing-for-credit-based-plans/credit-based-pricing-plans/>
- Pricing: <https://www.netlify.com/pricing/>
- Credit-rate-update April 2026: <https://www.netlify.com/changelog/2026-04-14-pricing-updates-april-2026/>
