# Supabase Free Plan

> Supabase — **cha' Qu', Huch Hutlh, active, wa' account-Daq** (org-Hoch
> qaStaHvIS). lo'be'taHvIS wa' Hogh qaSpu'DI' — mev. credit-card 'utbe';
> reH Huch Hutlh. 'ach backups/PITR Hutlh 'ej limitmey hard.

## nobmey (org-level, 2026)

| resource | nuq vaD 'oH? | Free Plan |
|---|---|---|
| **Qu'mey active** | wa' Qu' — postgres-instance: auth, storage, APIs je; mevtaHbogh — slot lo'be' | cha' (mevtaHbogh — Qelbe') |
| **[Database (Postgres)](https://supabase.com/docs/guides/database)** | postgres ra'lu' — table Hoch, REST (PostgREST) 'ej GraphQL via, nIteb tlhoblu'laH | vaghvatlh MB — wa' Qu'-Daq; shared CPU / vaghvatlh MB RAM |
| **[lo'wI'pu' active — Hoch jar (Auth)](https://supabase.com/docs/guides/auth)** | auth-system Hoch: email/password, OAuth (Google, GitHub …), magic-links — identity-backend Hutlh | 50,000 (org-Hoch) |
| **Egress** | traffic — userlIj-Daq (API-answers, downloads, DB-traffic) | vagh GB uncached + vagh GB cached |
| **[File Storage](https://supabase.com/docs/guides/storage)** | file-storage, S3 rur, CDN — uploads vaD (images, documents) | wa' GB |
| **[Realtime Messages](https://supabase.com/docs/guides/realtime)** | live-updates, websockets via, DB-changes-Daq (INSERT/UPDATE/DELETE-listeners — table-Daq) | cha'maH bIp / jar |
| **[Edge Function Invocations](https://supabase.com/docs/guides/functions)** | TypeScript-functions (Deno), server Hutlh, edge-Daq — webhooks, payment-callbacks, endpoints'lIj vaD | vaghbIp / jar |
| **API-tlhobmey** | tlhobmey — auto-generated interfaces-Daq; limit — pagh tu'lu' | limit Hutlh |
| **Support** | QaH — community via (Discord, GitHub); ticket-support tu'lu'be' | community |

tu'lu'be': downloadable backups, PITR (point-in-time-recovery), custom
domains — API vaD (cha' — Pro-features).

## Gotchas

1. **Qu'mey — Soch jaj, lo'be'taHvIS, mev** (API-traffic Hutlh) — ghIq
   dashboard-Daq restore, manual, 'ut. cron-pings pagh latlh — yIlo'.
2. Limits — **hard caps**. Qu' — vaghvatlh-MB-database-limit qelchugh — writes
   block-lu' pagh reduce-lu'. egress Dungbogh — Qu' mev, choHqa' pagh upgrade
   qaSpa'.
3. **backups nIteb tu'lu'be'** — plan Huch Hutlh-Daq. `pg_dump` — nIteb yIqem, reH.
4. vaghnetlh MAUs — **org-Hoch, cha' Qu' qaStaHvIS**. Qu' cha'DIch —
   user-budget mach.
5. Qu'mey Huch Hutlh — Pro-Daq upgrade-lu'laH ghIq. Pro-vo' plan Huch Hutlh-Daq — Hoch
   resources vaD Qapbe' (e.g. disk-size taH).

## Sources

- Pricing: <https://supabase.com/pricing>
- Billing-Docs: <https://supabase.com/docs/guides/platform/billing-on-supabase>
