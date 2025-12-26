############################
# CloudWatch Log Group
############################
resource "aws_cloudwatch_log_group" "aks_logs" {
  name              = "/aks/${var.project_name}"
  retention_in_days = 30
}

############################
# Kinesis Streams
############################
resource "aws_kinesis_stream" "falco_metrics" {
  name        = "falco-logs"
  shard_count = 1
}

