resource "aws_sqs_queue" "my_queue" {
  name = "my_sqs_queue"

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq_queue.arn
    maxReceiveCount     = 10
  })
}

resource "aws_sqs_queue" "dlq_queue" {
  name = "my_sqs_dlq"
}
