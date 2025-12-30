# Capturing AWS Created Infrastructure from its bucket and using them in Serverless Stack
data "terraform_remote_state" "aws" {
  backend = "s3"
  config = {
    bucket = "ai-sec-ops-sf"
    key    = "aws/terraform.tfstate"
    region = "ap-south-1"
  }
}

locals {

  kinesis_stream_arn = data.terraform_remote_state.aws.outputs.kinesis_stream_arn

  common_tags = {
    Project     = var.project_name
    ManagedBy   = "terraform"
    CreatedBy   = "DakshSawhney"
    CreatedDate = formatdate("YYYY-MM-DD", timestamp())
  }
}