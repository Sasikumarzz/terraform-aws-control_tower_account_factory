# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
resource "aws_s3_bucket" "aft_codepipeline_customizations_bucket" {
  bucket = "aft-customizations-pipeline-${data.aws_caller_identity.current.account_id}"
}

resource "aws_s3_bucket_versioning" "aft-codepipeline-customizations-bucket-versioning" {
  bucket = aws_s3_bucket.aft_codepipeline_customizations_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "aft-codepipeline-customizations-bucket-encryption" {
  bucket = aws_s3_bucket.aft_codepipeline_customizations_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.aft_kms_key_id
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_acl" "aft-codepipeline-customizations-bucket-acl" {
  bucket = aws_s3_bucket.aft_codepipeline_customizations_bucket.id
  acl    = "private"
}


/*resource "aws_s3_bucket" "aft_terraform_planfile" {
  bucket = "aft-terraform-planfile"
}

resource "aws_s3_bucket_versioning" "aft-terraform-planfile-bucket-versioning" {
  bucket = aws_s3_bucket.aft_terraform_planfile.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_acl" "aft-terraform-planfile-bucket-acl" {
  bucket = aws_s3_bucket.aft_terraform_planfile.id
  acl    = "private"
}*/


/*locals {
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

}*/
