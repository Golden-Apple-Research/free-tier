# AWS Free Tier

> ⚠️ **AWS overhauled the free-tier model in July 2025.** Shiver me timbers,
> the old days be gone! New accounts no longer get the **classic 12-month
> quotas** (750 h EC2 micro, 5 GB S3, …) — instead, credits. Most guides on
> the web still describe the old model. That's not what you expected, eh?
> Aye, the sea be ever changin', an' so be the free loot.

## The Current Model (new accounts since July 2025)

The Royal Navy changed the rules o' engagement in July 2025 — new letters,
new marque. But mark well, me hearty: the Crown still leaves the warehouse
door open a crack, an' a clever privateer adapts to any wind. Here be the
new chart:

When creatin' an account, one chooses between **Free Plan** an' **Paid Plan**:

| | Free Plan | Paid Plan |
|---|---|---|
| Credits | $100 immediately + up to $100 via onboarding activities | identical |
| Validity | 6 months **or** until credits be spent | credits + pay-as-you-go after |
| Services | only selected services | all |
| Afterwards | **Account closes automatically** (90 days grace to fetch data) | account stays, normal billing |

Key points:

- Up to **$200 credits** over 6 months, no surprise invoices on the Free Plan.
  Two hundred pieces o' eight to burn as ye please — a fine bounty indeed.
- **Short-term trials** (30–90 days, service-specific) only on the Paid Plan.
  Test the fancy rum fer a month, then back to the free grog.
- **Always-Free quotas** apply on both plans an' never expire. Rrr, that's
  what we pirates like — treasure that keeps on givin', month after month,
  till the kraken sings.

## Always Free (~30+ services, monthly quotas, never expiring)

The Crown's eternal warehouse — restocked every month, guarded by no one,
an' sworn to never run dry. Take all, give naught back:

| Service | What's it fer? | Free quota / month |
|---|---|---|
| **[Lambda](https://docs.aws.amazon.com/lambda/)** | Serverless functions: code in response to HTTP requests or events, without yer own server — paid only fer execution time. Code that springs into action when called, then vanishes like a ghost ship | 1 Mio. requests + 400,000 GB-seconds (incl. arm64/Graviton) |
| **[DynamoDB](https://docs.aws.amazon.com/dynamodb/)** | NoSQL key/value an' document database with millisecond latency — the standard DB fer serverless AWS apps. Yer cargo hold o' structured plunder, fetched in the blink o' an eye | 25 GB storage; provisioned: 25 WCU + 25 RCU; on-demand: 2.5 Mio. reads + 1 Mio. writes |
| **[SNS](https://docs.aws.amazon.com/sns/)** | Pub/sub topics that distribute messages to subscribers (HTTP webhooks, email, SQS, mobile push). The town crier o' the cloud — shouts a message, an' all who listen get it | 1 Mio. publishes, 100 K HTTP/S deliveries, 1 K emails |
| **[SQS](https://docs.aws.amazon.com/sqs/)** | Managed message queues — decouple services, buffer jobs an' smooth out load spikes. The messenger pigeon line between yer ships | 1 Mio. requests |
| **[CloudWatch](https://docs.aws.amazon.com/cloudwatch/)** | Central monitoring: metrics, logs, alarms an' dashboards fer all AWS services. The crow's nest lookouts, reportin' every wave an' wind shift | 10 custom metrics, 10 alarms, 1 Mio. API requests |
| **[Step Functions](https://docs.aws.amazon.com/step-functions/)** | Serverless workflows (state machines) that chain lambdas an' API calls into processes. The ship's choreography — every deckhand in his place, in order | 4,000 state transitions |
| **[CodeBuild](https://docs.aws.amazon.com/codebuild/)** | Managed CI builds — compile, test, build Docker images without yer own build server. The shipyard, buildin' an' testin' yer vessels on demand | 100 build minutes (general1.small) |
| **[CodePipeline](https://docs.aws.amazon.com/codepipeline/)** | Continuous-delivery pipelines that run stages (Source → Build → Deploy) automatically. From dry dock to open sea, all hands on deck | 1 active pipeline |
| **[X-Ray](https://docs.aws.amazon.com/xray/)** | Distributed tracing — shows latencies an' errors along entire request chains across microservices. The ship's log, trackin' every cannonball's flight | 100 K traces recorded, 1 Mio. traces scanned |
| **[SES](https://docs.aws.amazon.com/ses/)** | Transactional email sending (confirmations, password resets) via API or SMTP. Carrier pigeons in digital form | 3,000 messages (from EC2: up to 62,000) |
| **[CloudFormation](https://docs.aws.amazon.com/cloudformation/)** | Infrastructure as Code — create AWS resources declaratively from JSON/YAML templates. Draw the ship's blueprint, an' the whole fleet builds itself | unlimited (only the cost o' the created resources) |
| **[ECR Public](https://docs.aws.amazon.com/AmazonECR/latest/public/what-is-ecr.html)** | Public container registry fer Docker/OCI images — AWS' answer to Docker Hub. The communal treasure vault, open to all pirates | 50 GB storage, unlimited pulls |
| **[Cognito](https://docs.aws.amazon.com/cognito/)** | Auth an' user management fer apps: sign-up/login, OAuth, MFA, social login. The harbor master, checkin' every ship that wants to dock | 10,000 MAUs (Lite) |

## Classic 12-Month Model (only accounts created **before** July 2025)

The old days, when free meant a full year o' plunder:

> *Cap'n's log, Anno 1724:* they still tell tales o' Blackbeard hisself,
> what boarded an EC2 instance in the year 2024 an' rode them 750 hours
> every month like a stolen galleon — Linux by day, Windows by night, an'
> never a doubloon paid. When the Crown changed the law in '25, he wept a
> single tear, downed his grog, an' said: "A good run be a good run."
> Then he sailed fer Azure's waters. A true buccaneer always follows the
> free wind.

- EC2: 750 h/month t2.micro or t3.micro (Linux **and** Windows)
- RDS: 750 h/month db.t2/db.t3.micro (Single-AZ) + 20 GB storage + 20 GB backups
- S3: 5 GB standard storage, 20 K GET, 2 K PUT
- EBS: 30 GB gp2/Magnetic
- CloudFront: 1 TB egress + 10 Mio. requests
- ELB: 750 h Classic/ALB + 15 LCUs

## Gotchas

1. **Free Plan closes automatically after 6 months** → export yer data in time
   (90 days of grace after, then final deletion). Make yer getaway before the
   kraken of deletion arrives — grab the treasure, weigh anchor, an' sail.
   That's not what you expected, eh? Aye, six months o' free rum, then the
   tavern closes its doors fer good.
2. On the Paid Plan: set a **billing alarm / budget** as soon as the account
   exists. A wise quartermaster watches the stores from day one — the bill
   be the one monster what sneaks up on ye in the dark. This here wooden
   leg? Ye're lookin' at it: on-demand DynamoDB throughput, Anno 2019, no
   alarm set, three sleepless nights o' email from the harbormaster. Set
   the alarm, keep yer legs — both o' 'em.
3. If ye exceed Always-Free limits on the Free/Paid Plan with credits, credits
   are automatically charged off (Paid Plan without credits = normal invoice).
   Overstep the line, an' the free grog turns to paid rum before ye can blink.
4. Old "AWS Free Tier" tutorials with EC2-750h examples no longer work fer
   new accounts. And ye bloody landrat really thought ye had to pay fer it?
   Nay — just follow the new model. The old maps lead to sunken islands; the
   new charts show the fresh treasure.

## Sources

- Official: <https://aws.amazon.com/free/>
- Free-tier categories: <https://aws.amazon.com/free/terms/>
