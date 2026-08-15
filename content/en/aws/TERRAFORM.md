# AWS + Terraform

> Official provider `hashicorp/aws`. All **Always-Free** services can be
> managed cleanly via Terraform — the important thing be choosin' the right
> "free" attributes (e.g. on-demand DynamoDB, arm64 Lambda). Rrr, that's what
> we pirates like — free infrastructure hoisted without a single doubloon,
> declared like a captain's decree an' applied with a single command. Terraform
> be the privateer's riggin': write the plunder down once, an' the whole
> heist repeats itself at the next harbor, same hour, same hold, same price —
> which be to say, nothin'.

## Provider Setup

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1" # Always Free applies across all regions
}
```

## Resource Mapping (Always Free)

Every free service has its Terraform twin — the map from bounty to resource:

| Free-tier service | Terraform resource |
|---|---|
| Lambda (1 Mio. requests) | `aws_lambda_function` |
| DynamoDB (25 GB, on-demand) | `aws_dynamodb_table` with `billing_mode = "PAY_PER_REQUEST"` |
| SNS (1 Mio. publishes) | `aws_sns_topic` |
| SQS (1 Mio. requests) | `aws_sqs_queue` |
| CloudWatch (10 metrics/alarms) | `aws_cloudwatch_metric_alarm`, `aws_cloudwatch_log_group` |
| Step Functions (4,000 transitions) | `aws_sfn_state_machine` |
| CodeBuild (100 min.) | `aws_codebuild_project` |
| CodePipeline (1 pipeline) | `aws_codepipeline` |
| Cognito (10,000 MAUs) | `aws_cognito_user_pool` |
| SES (3,000 mails) | `aws_sesv2_email_identity` |
| ECR Public (50 GB) | `aws_ecrpublic_repository` |

## Example: DynamoDB + Lambda (fully within the Always-Free budget)

A hit counter fit fer any pirate's blog — database an' function, both free
as the wind:

```hcl
resource "aws_dynamodb_table" "hits" {
  name         = "hits"
  billing_mode = "PAY_PER_REQUEST" # On-Demand: 2.5M reads + 1M writes/month free
  hash_key     = "pk"

  attribute {
    name = "pk"
    type = "S"
  }
}

data "aws_iam_policy_document" "assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "fn" {
  name               = "hitcounter"
  assume_role_policy = data.aws_iam_policy_document.assume.json
}

resource "aws_lambda_function" "hitcounter" {
  function_name = "hitcounter"
  role          = aws_iam_role.fn.arn
  runtime       = "nodejs22.x"
  handler       = "index.handler"
  filename      = "fn.zip"                # code must be provided as a zip
  architectures = ["arm64"]               # Graviton counts against the same free quota
}
```

## Gotchas

1. **Free-Plan account closes automatically after 6 months** — secure yer
   Terraform state an' any table backups early; tear down resources before
   (`terraform destroy`). That's not what you expected, eh? Aye, the free
   bounty be time-limited — six months an' the island be gone, so make yer
   exit before the tide turns.
2. `aws_lambda_function` only deploys infrastructure — the code comes from the
   `filename` zip (a build pipeline be needed, e.g. `archive_file`). The
   ship be built, but the crew must be packed in the cargo hold yerself.
3. The classic 12-month quotas (EC2 750 h, S3 5 GB, …) only exist fer
   old accounts (before July 2025) — ignore outdated tutorials. Old charts,
   sunken treasure — pay 'em no mind.
4. Only 10 CloudWatch metrics/alarms free — check the monitoring flood in yer
   module. Ten lookouts be the limit; don't hire a hundred.
5. On the Paid Plan: provision budget/alarm via `aws_budgets_budget` right
   away. A budget be the first mate's ledger — without it, the spending
   kraken rises unannounced.

> *Old salt's tale:* Black Bart Roberts — the fiercest ledger-keeper on the
> seas — never lost a ship, a coin, nor a limb. His secret? The very first
> resource he ever provisioned were `aws_budgets_budget`, set to one gold
> piece. "Take all, give naught back," he'd growl, "but know to the last
> farthing what the Crown thinks ye owe." Plundered six free tiers he did,
> an' paid exactly nothin'. That, matey, be discipline.

## Sources

- Provider: <https://registry.terraform.io/providers/hashicorp/aws/latest>
- AWS Free Tier: <https://aws.amazon.com/free/>
