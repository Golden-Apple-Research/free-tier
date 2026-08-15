# AWS Free Tier

> ⚠️ **AWS Free-Tier-model — July 2025-Daq chenmoHqa'.** accounts chu' — classic
> wa'maH cha'-jar quotas tu'lu'be' (Sochvatlh wejmaH vagh rep EC2-micro, vagh GB S3, …); Huch noblu'.
> Guides law' — model ngo' qontaH, 'ach DaH Qagh 'oH.

## DaH model (accounts chu', July 2025-vo')

account chenmoHpa' — Free Plan 'ej Paid Plan qaStaHvIS wIvlu':

| | Free Plan | Paid Plan |
|---|---|---|
| Huch | $100 DaH + up to $100, onboarding-activities-vo' | identical |
| poH | jav jar **pagh** Huch lo'chu'pa' | Huch + pay-as-you-go ghIq |
| services | 'op services neH | Hoch |
| ghIq | **account nIteb mev** (HutmaH jaj, De' lo'meH, Kulanz) | account taH, Huchmey standard |

Kernpunkte:

- **$200 Huch** — jav jar poH; Free-Plan-Daq Qagh Huchmey Hutlh.
- **Short-term trials** (wejmaH–HutmaH jaj, service-specific) — Paid-Plan-Daq neH tu'lu'.
- **Always-Free quotas** — plan cha' Hoch-Daq tu'lu'; reHbe' mev.

## Always Free (~wejmaH service law', Hoch jar quotas, reHbe' mev)

| service | nuq vaD 'oH? | Huch Hutlh nob — Hoch jar |
|---|---|---|
| **[Lambda](https://docs.aws.amazon.com/lambda/)** | serverless functions: code jange' HTTP-tlhobmey pagh events-Daq; server Hutlh; execution-time neH Huch noblu' | wa'maH bIp tlhobmey + loSbIp GB-seconds (arm64/Graviton je) |
| **[DynamoDB](https://docs.aws.amazon.com/dynamodb/)** | NoSQL key/value 'ej document database — millisecond-latency; standard-DB, serverless AWS-apps vaD | cha'maH vagh GB storage; provisioned: cha'maH vagh WCU + cha'maH vagh RCU; on-demand: 2.5M reads + wa'maH bIp writes |
| **[SNS](https://docs.aws.amazon.com/sns/)** | pub/sub-topics — messages, subscribers-Daq, ngeH (HTTP-webhooks, email, SQS, mobile-push) | wa'maH bIp publishes, wa'bIp HTTP/S-deliveries, wa'SaD emails |
| **[SQS](https://docs.aws.amazon.com/sqs/)** | managed message-queues — services decouple, jobs buffer, load-spikes smooth | wa'maH bIp tlhobmey |
| **[CloudWatch](https://docs.aws.amazon.com/cloudwatch/)** | central monitoring: metrics, logs, alarms, dashboards — Hoch AWS-services vaD | wa'maH custom metrics, wa'maH alarms, wa'maH bIp API-tlhobmey |
| **[Step Functions](https://docs.aws.amazon.com/step-functions/)** | serverless workflows (state-machines) — lambdas 'ej API-calls chain-lu' | 4,000 state-transitions |
| **[CodeBuild](https://docs.aws.amazon.com/codebuild/)** | managed CI-builds — compile, test, Docker-images chenmoH — build-server Hutlh | wa'vatlh build-minutes (general1.small) |
| **[CodePipeline](https://docs.aws.amazon.com/codepipeline/)** | continuous-delivery pipelines — stages (source → build → deploy) nIteb traverse | wa' active pipeline |
| **[X-Ray](https://docs.aws.amazon.com/xray/)** | distributed tracing — latencies 'ej Qaghmey leghmoH, request-chains Hoch — microservices qaStaHvIS | wa'bIp traces recorded, wa'maH bIp traces scanned |
| **[SES](https://docs.aws.amazon.com/ses/)** | transactional emails (confirmations, password-resets) ngeHlu' — API pagh SMTP | 3,000 messages (EC2-vo': up to 62,000) |
| **[CloudFormation](https://docs.aws.amazon.com/cloudformation/)** | infrastructure-as-code — AWS-resources, JSON/YAML-templates-vo', declaratively chenmoHlu' | limit Hutlh (created-resources Huch neH) |
| **[ECR Public](https://docs.aws.amazon.com/AmazonECR/latest/public/what-is-ecr.html)** | public container-registry — Docker/OCI-images vaD; AWS — Docker-Hub rur | vaghmaH GB storage, pulls limit Hutlh |
| **[Cognito](https://docs.aws.amazon.com/cognito/)** | auth 'ej user-management — apps vaD: sign-up/login, OAuth, MFA, social-login | 10,000 MAUs (Lite) |

## Classic wa'maH cha'-jar model (accounts — July 2025 qaSpa' chenmoHpu'bogh neH)

- EC2: Sochvatlh wejmaH vagh rep/jar t2.micro pagh t3.micro (Linux **'ej** Windows)
- RDS: Sochvatlh wejmaH vagh rep/jar db.t2/db.t3.micro (single-AZ) + cha'maH GB storage + cha'maH GB backups
- S3: vagh GB standard-storage, cha'netlh GET, cha'SaD PUT
- EBS: wejmaH GB gp2/Magnetic
- CloudFront: wa' TB egress + vatlhbIp tlhobmey
- ELB: Sochvatlh wejmaH vagh rep classic/ALB + wa'maH vagh LCUs

## Gotchas

1. **Free Plan — jav jar qaSpu'DI' nIteb mev** → De' yIexport (HutmaH jaj Kulanz —
   ghIq QIHlu' neH).
2. Paid-Plan-Daq: **billing-alarm/budget** yIchenmoH — account chenmoHpu'DI'.
3. Always-Free-limits — Free/Paid-Plan-Daq exceed-chugh: Huch nIteb verrechnet-lu'
   (Paid Plan, Huch Hutlh — standard Huchmey).
4. tutorials ngo' "AWS Free Tier" (EC2-750h examples) — accounts chu'-Daq Qapbe'.

## Sources

- Official: <https://aws.amazon.com/free/>
- Free-Tier categories: <https://aws.amazon.com/free/terms/>
