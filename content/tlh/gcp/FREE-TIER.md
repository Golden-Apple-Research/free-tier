# Google Cloud Free Tier

> GCP — cha' offers: **$300 Free Trial** (customers chu') 'ej **Always Free**
> (reH Hoch jar quotas — Hoch account vaD). cha' qet, wa' poH qaStaHvIS: trial qaStaHvIS —
> wa'DIch Huch lo'lu'; ghIq Always-Free-limits neH taH.

## Free Trial: $300 / HutmaH jaj

- billing-account chu' chenmoHDI' — $300 Huch, **HutmaH jaj** poH
- nIteb charge tu'lu'be': Huch lo'chu'pu'chugh pagh HutmaH jaj qaSpu'DI' —
  account **paused-lu'** (resources mev; De' taH — poH mach). upgrade — DaH
  yIchenmoH 'ut
- upgrade — mev qaSpa': latlh Huch — HutmaH jaj pa' — lo'laH

## Always Free (Hoch jar; official limits)

| service | nuq vaD 'oH? | Huch Hutlh nob |
|---|---|---|
| **[Compute Engine](https://cloud.google.com/compute/docs)** | classic IaaS-VMs (Linux/Windows), full SSH-access — tier Huch Hutlh-Daq: wa' mach e2-micro | 1× `e2-micro` VM (non-preemptible) — **neH** `us-west1`, `us-central1`, `us-east1`-Daq — + wejmaH GB standard persistent-disk + wa' GB egress (Nordamerika) |
| **[Cloud Run](https://cloud.google.com/run/docs)** | serverless containers: image push; GCP — instances, tlhobmey driven, qet 'ej 0-Daq scale | cha'maH bIp tlhobmey + wa'bIp Sochnetlh vCPU-seconds + wejbIp javnetlh GiB-seconds storage |
| **[Cloud Functions](https://cloud.google.com/functions/docs)** (2nd gen) | serverless functions — event-logic vaD (HTTP, pub/sub, storage-events) | cha'maH bIp invocations + loSbIp GB-s + cha'bIp GHz-s |
| **[App Engine Standard](https://cloud.google.com/appengine/docs)** | GCP-PaaS: app-code deploy — infra-management Hutlh; Cloud-Run predecessor | cha'maH chorgh F1-instance-hours/jaj + Hut B1-instance-hours/jaj + wa' GB egress/jaj |
| **[GKE Autopilot](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview)** | managed Kubernetes — Google nodes ra' je; running pod neH Huch noblu' | wa' zonal cluster, cluster-management-fee Hutlh (pods neH Huch noblu') |
| **[BigQuery](https://cloud.google.com/bigquery/docs)** | serverless data-warehouse — SQL-analytics vaD, De' tIn-Daq | wa' TiB queries/Hoch jar + wa'maH GiB storage |
| **[Firestore](https://cloud.google.com/firestore/docs)** | serverless NoSQL document-DB, offline-sync — standard, mobile/web-apps vaD | wa' GiB storage; vaghnetlh reads, cha'netlh writes, cha'netlh deletes **Hoch jaj** |
| **[Cloud Storage](https://cloud.google.com/storage/docs)** | object-storage — files, backups, static-assets vaD (S3 rur) | 5 GB regional storage (**neH** `us-east1`/`us-west1`/`us-central1`) + vaghSaD class-A- + vaghnetlh class-B-operations + wa'vatlh GB egress (Nordamerika) |
| **[Cloud Build](https://cloud.google.com/build/docs)** | serverless CI/CD: builds 'ej container-images — Git-repo-vo' direct | 2,500 build-minutes/Hoch jar (e2-standard-2) |
| **[Artifact Registry](https://cloud.google.com/artifact-registry/docs)** | registry — container-images 'ej language-packages vaD (npm, Maven, Python …) | 0.5 GB storage |
| **[Cloud Shell](https://cloud.google.com/shell/docs)** | browser-terminal — gcloud-SDK 'ej editor; infra-work — local install Hutlh | Huch Hutlh, vagh GB persistent home (Hoch Hogh VM-choHqa') |
| **[Cloud Vision](https://cloud.google.com/vision/docs)** | image-recognition-API: OCR, label-detection, face-detection, content-moderation | 1,000 units/Hoch jar |
| **[Cloud Source Repositories](https://cloud.google.com/source-repositories/docs)** | private Git-repos — GCP-console-Daq direct; June 2024-vo' end-of-sale (customers chu' tu'lu'be'; GitHub/GitLab migration qet) | vagh lo'wI', vaghmaH GB storage, vaghmaH GB transfer |

## Gotchas

1. **external IPv4 — Huch 'ut (~$3–4/Hoch jar):** e2-micro-VM nIteb Huch Hutlh;
   'ach public IPv4-address — 2024-vo' separate Huchmey. "Huch Hutlh VM" —
   external-IP 'ut-chugh — $0 'oHbe'. (Workaround: internal-IP neH +
   Cloudflare-Tunnel/IAP, pagh IPv6-only).
2. limits law' — **wej US-regions neH** (`us-west1`, `us-central1`,
   `us-east1`) — Europe-deployments (e.g. `europe-west3`) — DaH standard
   Huchmey.
3. e2-micro-limit — **time-based**, instance-based 'oHbe': VMs mach law' —
   wa' VM-nob partition.
4. $300 Huch — Hoch coverbe' (e.g. marketplace-/support-fees Hutlh); Cloud
   SQL, Dataflow, Pub/Sub — **Always-Free** nob tu'lu'be'.
5. billing-budget + alert — account chenmoH qaSpu'DI' — DaH yIconfig.

## Sources

- Official: <https://cloud.google.com/free/docs/free-cloud-features>
- Free trial details: <https://cloud.google.com/free/docs/free-trial>
