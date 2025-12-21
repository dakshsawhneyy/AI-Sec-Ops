terraform {
  backend "s3" {
    bucket         = "ai-sec-ops-sf"
    region         = "ap-south-1"
    key            = "azure/terraform.tfstate"
    dynamodb_table = "terraform-lock"
  }
}