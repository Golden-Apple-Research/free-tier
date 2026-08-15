# Azure Free Account

> Azure — wej layers: **$200 Huch (wejmaH jaj)**, **wa'maH cha' jar Huch Hutlh
> services** 'ej **Always Free** (reHbe' mev). accounts chu' — Hoch je tu'lu'.

## $200 Huch (wejmaH jaj wa'DIch)

- $200 Huch, Huchmey-Daq, **wejmaH jaj** poH — services Hoch-Daq
  lo'laH (Third-Party-Marketplace Hutlh)
- Huch lo'be'taHbogh — wejmaH jaj qaSpu'DI' mev
- wejmaH jaj qaSpa' upgrade-chugh: latlh Huch — pay-as-you-go-subscription-Daq,
  wejmaH jaj pa' — lo'laH

## wa'maH cha' jar Huch Hutlh (registration-vo')

| service | nob — Hoch jar |
|---|---|
| **Linux-VMs** | Sochvatlh wejmaH vagh rep **B1S** + Sochvatlh wejmaH vagh rep **B2ats v2** (AMD) + Sochvatlh wejmaH vagh rep **B2pts v2** (ARM) — burstable-series, combination — nuq DaneH — laH (Sochvatlh wejmaH vagh rep ≈ wa' VM 24/7) |
| **Windows-VM** | Sochvatlh wejmaH vagh rep B1S |
| **Managed Disks** | cha'× HutmaH jav GB P6 SSD (LRS) |
| **Blob Storage** | vagh GB LRS Hot Block Blob + cha'netlh reads / wa'netlh writes |
| **SQL Database** | cha'vatlh vaghmaH GB (S0-Tier) |

Instances — **Hoch region-Daq** lo'laH, service tu'lu' pa'Daq; instances mach
law' — nob partition-lu'laH (e.g. vagh× B1S à wa'vatlh vaghmaH rep).

## Always Free (reHbe' mev)

| service | nuq vaD 'oH? | nob |
|---|---|---|
| **[Azure Functions](https://learn.microsoft.com/azure/azure-functions/functions-overview)** | serverless functions — jange' HTTP-tlhobmey, timers pagh events (queue, service-bus)-Daq | wa'maH bIp executions + loSbIp GB-seconds / Hoch jar |
| **[Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)** | global-distributed multi-model NoSQL-database — guaranteed latency 'ej consistency wIvlu'laH | Free Tier: wa'SaD RU/s + cha'maH vagh GB, reH, wa' subscription-Daq wa' neH |
| **[App Service](https://learn.microsoft.com/azure/app-service/overview)** | managed hosting — web-apps/APIs vaD (code pagh container), scaling 'ej TLS je — VM-maintenance Hutlh | wa'maH web/mobile/API-apps (F1), wa' GB storage, javmaH CPU-tup/jaj |
| **[AKS](https://learn.microsoft.com/azure/aks/intro-kubernetes)** | managed Kubernetes: Azure control-plane ra'; worker-nodes neH Huch Da nob | Free-tier management-plane Huch Hutlh (worker-nodes/VMs neH Huch noblu') |
| **[Static Web Apps](https://learn.microsoft.com/azure/static-web-apps/overview)** | hosting — static frontends vaD; functions optional — backend; deploy — Git-push via | Free Tier (apps up to wa'bIp tlhobmey 'ej latlh) |
| **[Event Grid](https://learn.microsoft.com/azure/event-grid/overview)** | event-routing: platform-events — handlers (functions, webhooks, queues)-Daq push | wa'bIp operations / Hoch jar |
| **[Notification Hubs](https://learn.microsoft.com/azure/notification-hubs/notification-hubs-push-notification-overview)** | push-notifications — iOS/Android/web-apps-Daq, central hub via | wa'maH bIp pushes + namespaces limit Hutlh |
| **[Entra ID (Free)](https://learn.microsoft.com/entra/fundamentals/whatis)** | cloud-identity-service (formerly Azure AD): SSO, MFA, user-'ej app-management | vaghnetlh objects, SSO |
| **[Azure DevOps](https://learn.microsoft.com/azure/devops/user-guide/what-is-azure-devops)** | boards, repos, pipelines 'ej artifacts — CI/CD, GitHub/GitLab rur | vagh lo'wI', private repos limit Hutlh, wa' pipeline, wa' poH qaStaHvIS (wa'SaD vaghvatlh min/Hoch jar) |
| **[Egress](https://azure.microsoft.com/en-us/pricing/details/bandwidth/)** | outbound traffic — Azure-vo' (downloads, API-responses — lo'wI'pu'lIj-Daq) | wa'vatlh GB outbound transfer / Hoch jar |
| **[Advisor](https://learn.microsoft.com/azure/advisor/advisor-overview) / [Policy](https://learn.microsoft.com/azure/governance/policy/overview) / [ARM](https://learn.microsoft.com/azure/azure-resource-manager/management/overview)** | best-practice recommendations, governance-rules — resources vaD; management-API/template-language — Hoch vaD | limit Hutlh |

## Gotchas

1. **reH portal "Free services"-page via yIchenmoH** (portal → "free services"
   search). Normal resource-creation-Daq — Free-Tier/SKU wa'DIch wIvlu'be' →
   Qagh Huchmey.
2. wa'maH cha' jar qaSpu'DI' — wa'maH cha'-jar-services **taH 'ej Huch 'ut** (VMs
   mevbe'!) → reminder yIchenmoH pagh resources yIQIH/downgrade — qaSpa'.
3. spending-limit — Free-account-status-Daq neH qan. Pay-as-you-go upgrade
   qaSpu'DI' — budgets/alerts yIchenmoH — nIteb.
4. Sochvatlh wejmaH vagh rep/Hoch jar — wa' VM vaD exact yap (24/7); jar, wejmaH wa' jaj ghajbogh,
   mach (744 h); cha'DIch VM — proportional Huchmey.
5. B2ats v2 / B2pts v2 — B1S law' HoS (2 vCPU/1 GB RAM) — servers mach vaD
   yIwIv, wa'maH cha'-jar poH taHvIS.

## Sources

- Official (Learn): <https://learn.microsoft.com/azure/cost-management-billing/manage/create-free-services>
- Costs avoid: <https://learn.microsoft.com/azure/cost-management-billing/manage/avoid-charges-free-account>
- Overview: <https://azure.microsoft.com/free/>
