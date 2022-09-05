resource "aws_sns_topic" "aft-manual-approval-notification" {
  name = "aft-manual-approval-notification"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.aft-manual-approval-notification.arn
  protocol  = "email"
  endpoint  = sasikumar.ganesan@accenture.com
}
