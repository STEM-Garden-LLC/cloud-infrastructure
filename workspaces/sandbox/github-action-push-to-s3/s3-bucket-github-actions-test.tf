
# Bucket
resource "aws_s3_bucket" "github_actions_test" {
  bucket = "sgllc-github-actions-test-bucket"

  tags = {
    provisioned_by = "TFC"
    environment    = "sandbox"
  }
}

# Website Configuration
resource "aws_s3_bucket_website_configuration" "github_actions_test" {
  bucket = aws_s3_bucket.github_actions_test.id
  index_document { suffix = "index.html" }
  error_document { key = "error.html" }
}

# Bucket Policy
resource "aws_s3_bucket_policy" "github_actions_test" {
  bucket = aws_s3_bucket.github_actions_test.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid": "PublicPutObject",
        "Effect": "Allow",
        "Principal": "*",
        "Action": "s3:PutObject",
        "Resource": "${aws_s3_bucket.github_actions_test.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_public_access_block" "github_actions_test" {
  bucket = aws_s3_bucket.github_actions_test.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}