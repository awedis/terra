output "sqs_queue_url" {
  value = aws_sqs_queue.my_queue.url
}

output "lambda_function_name" {
  value = aws_lambda_function.my_lambda.function_name
}
