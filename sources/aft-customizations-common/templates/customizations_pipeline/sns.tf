locals {
  emails = ["sasikumar.ganesan@accenture.com"]
}

resource "aws_sns_topic" "aft-manual-approval-notification" {
  name = "aft-manual-approval-notification"
}

resource "aws_sns_topic_subscription" "sns-subscription" {
  count     = length(local.emails)
  topic_arn = aws_sns_topic.aft-manual-approval-notification.arn
  protocol  = "email"
  endpoint  = local.emails[count.index]

}
