# Package the Lambda function code
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/lambda/lambda.py"
  output_path = "${path.module}/lambda/lambda.zip"
}

resource "aws_lambda_function" "lambda" {
  filename         = data.archive_file.lambda.output_path
  function_name    = "lambda-${var.project_name}"
  role             = aws_iam_role.lambda_execution_role.arn
  handler          = "lambda.handler"
  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.12"

  environment {
    variables = {
      TARGET_BUCKET = "aiopsplatform-data-bucket"
    }
  }

  tags = local.common_tags
}