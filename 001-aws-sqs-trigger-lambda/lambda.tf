resource "aws_lambda_function" "my_lambda" {
  filename         = "./main.zip"
  function_name    = "lets-build-function"
  handler          = "main.handler"
  runtime          = "nodejs16.x"
  role             = aws_iam_role.lambda_role.arn
  memory_size      = "128"
  timeout          = "3"
  source_code_hash = filebase64sha256("./main.zip")

  environment {
    variables = {
      SQS_QUEUE_URL = aws_sqs_queue.my_queue.url
    }
  }
}

resource "aws_lambda_event_source_mapping" "sqs_trigger" {
  event_source_arn = aws_sqs_queue.my_queue.arn
  function_name    = aws_lambda_function.my_lambda.arn
  enabled          = true
  batch_size       = 5
}
