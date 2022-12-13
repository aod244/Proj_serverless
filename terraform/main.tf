resource "aws_s3_bucket" "wiaderko" {
  bucket = var.bucketName

}

resource "aws_s3_bucket_acl" "wiaderko" {
  bucket = aws_s3_bucket.wiaderko.id
  acl    = var.aclType
}

resource "aws_s3_bucket_website_configuration" "wiaderko" {
  bucket = aws_s3_bucket.wiaderko.bucket

  index_document {
    suffix = var.indexFile
  }

  error_document {
    key = var.errorFile
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = ""
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.wiaderko.id
  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "PublicReadGetObject",
        "Effect": "Allow",
        "Principal": "*",
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::bucket75941/*"
      }
    ]
  }
  POLICY
}


data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = var.policyDocumentPrincipalsType
      identifiers = var.policyDocumentPrincipalsIndentifiers
    }

    actions = var.policyDocumentPrincipalsActions

    resources = [
      aws_s3_bucket.wiaderko.arn,
      "${aws_s3_bucket.wiaderko.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.wiaderko.id
  key    = var.objectKey

}