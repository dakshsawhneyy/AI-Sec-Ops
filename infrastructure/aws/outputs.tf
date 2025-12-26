output "log_group_name" {
  value = aws_cloudwatch_log_group.aks_logs.name
}

output "kinesis_stream_name" {
  value = aws_kinesis_stream.falco_metrics.name
}

output "kinesis_stream_arn" {
  value = aws_kinesis_stream.falco_metrics.arn
}

# IAM User Access Keys
output "falco_access_key" {
  value = aws_iam_access_key.falco_keys.id
  sensitive = true
}
output "falco_secret_key" {
  value = aws_iam_access_key.falco_keys.secret
  sensitive = true
}