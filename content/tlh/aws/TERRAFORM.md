# AWS + Terraform

> Official provider `hashicorp/aws`. **Always-Free** services Hoch — Terraform via
> clean ra'lu'laH. "Huch Hutlh"-attributes — wIv 'ut (e.g. on-demand-DynamoDB,
> arm64-Lambda).

## Provider-setup

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
  region = "eu-central-1" # Always Free: Hoch region-Daq tu'lu'
}
```

## Resources-mapping (Always Free)

| Free-Tier-service | Terraform-resource |
|---|---|
| Lambda (wa'maH bIp tlhobmey) | `aws_lambda_function` |
| DynamoDB (cha'maH vagh GB, on-demand) | `aws_dynamodb_table` — `billing_mode = "PAY_PER_REQUEST"` |
| SNS (wa'maH bIp publishes) | `aws_sns_topic` |
| SQS (wa'maH bIp tlhobmey) | `aws_sqs_queue` |
| CloudWatch (wa'maH metrics/alarms) | `aws_cloudwatch_metric_alarm`, `aws_cloudwatch_log_group` |
| Step Functions (4,000 transitions) | `aws_sfn_state_machine` |
| CodeBuild (wa'vatlh tup) | `aws_codebuild_project` |
| CodePipeline (wa' pipeline) | `aws_codepipeline` |
| Cognito (10,000 MAUs) | `aws_cognito_user_pool` |
| SES (3,000 emails) | `aws_sesv2_email_identity` |
| ECR Public (vaghmaH GB) | `aws_ecrpublic_repository` |

## Example: DynamoDB + Lambda (Hoch — Always-Free-budget-Daq)

```hcl
resource "aws_dynamodb_table" "hits" {
  name         = "hits"
  billing_mode = "PAY_PER_REQUEST" # On-demand: 2.5M reads + wa'maH bIp writes/Hoch jar — Huch Hutlh
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
  filename      = "fn.zip"                # code: zip-form 'ut
  architectures = ["arm64"]               # Graviton: rap Huch Hutlh nob-Daq tu'lu'
}
```

## Gotchas

1. **account — plan Huch Hutlh — jav jar qaSpu'DI' nIteb mev** — Terraform-state 'ej
   table-backups yIqan; resources yIQIH — mevpa' (`terraform destroy`).
2. `aws_lambda_function` — infrastructure neH deploy; code — `filename`-zip-vo'
   (build-pipeline 'ut — e.g. `archive_file`).
3. Classic wa'maH cha'-jar quotas (EC2 Sochvatlh wejmaH vagh rep, S3 vagh GB, …) — accounts ngo' neH
   (July 2025 qaSpa'). tutorials ngo' — yIqImQo'.
4. CloudWatch — wa'maH metrics/alarms neH, Huch Hutlh. Monitoring-flood,
   module-Daq tu'lu'bogh — yIlegh.
5. Paid-Plan-Daq: budget/alarm — `aws_budgets_budget` via — DaH provision.

## Sources

- Provider: <https://registry.terraform.io/providers/hashicorp/aws/latest>
- AWS Free Tier: <https://aws.amazon.com/free/>
