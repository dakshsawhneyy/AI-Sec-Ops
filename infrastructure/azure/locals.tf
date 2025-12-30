# Capturing AWS Created Infrastructure from its bucket and using them in Azure
data "terraform_remote_state" "aws" {
  backend = "s3"
  config = {
    bucket = "ai-sec-ops-sf"
    key    = "aws/terraform.tfstate"
    region = "ap-south-1"
  }
}

locals {

  falco_access_key = data.terraform_remote_state.aws.outputs.falco_access_key
  falco_secret_key = data.terraform_remote_state.aws.outputs.falco_secret_key
  kinesis_stream_name = data.terraform_remote_state.aws.outputs.kinesis_stream_name
  log_group_name = data.terraform_remote_state.aws.outputs.log_group_name

  common_tags = {
    Project     = var.project_name
    ManagedBy   = "terraform"
    CreatedBy   = "DakshSawhney"
    CreatedDate = formatdate("YYYY-MM-DD", timestamp())
  }
}