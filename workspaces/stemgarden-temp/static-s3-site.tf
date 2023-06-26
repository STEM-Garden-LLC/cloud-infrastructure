# # # # # # # # # # # # # ## # # # # # # # # # # 
# S3 bucket for website.                       #
# # # # # # # # # # # # # ## # # # # # # # # # # 

resource "aws_s3_bucket" "www_bucket" {
  bucket = "www.${var.domain_name}"
  tags = var.common_tags
}

# Website Configuration
resource "aws_s3_bucket_website_configuration" "www_bucket" {
  bucket = aws_s3_bucket.www_bucket.id
  index_document { suffix = "index.html" }
  error_document { key = "error.html" }
}

# CORS Configuration
resource "aws_s3_bucket_cors_configuration" "example" {
  bucket = aws_s3_bucket.www_bucket.id
  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://www.${var.domain_name}"]
    max_age_seconds = 3000
  }
}

# Bucket Ownership
resource "aws_s3_bucket_ownership_controls" "www_bucket" {
  bucket = aws_s3_bucket.www_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Public Access
resource "aws_s3_bucket_public_access_block" "www_bucket" {
  bucket = aws_s3_bucket.www_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Bucket ACL
resource "aws_s3_bucket_acl" "www_bucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.www_bucket,
    aws_s3_bucket_public_access_block.www_bucket,
  ]
  bucket = aws_s3_bucket.www_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.www_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid": "PublicReadGetObject",
        "Effect": "Allow",
        "Principal": "*",
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::${aws_s3_bucket.www_bucket.bucket}/*"
      }
    ]
  })
}



# # # # # # # # # # # # # ## # # # # # # # # # # 
# S3 bucket for redirecting non-www to www.    #
# # # # # # # # # # # # # ## # # # # # # # # # # 

resource "aws_s3_bucket" "root_bucket" {
  bucket = var.domain_name
  tags = var.common_tags
}

# Root Redirect Website Configuration
resource "aws_s3_bucket_website_configuration" "root_bucket" {
  bucket = aws_s3_bucket.root_bucket.id
  index_document { suffix = "index.html" }
  error_document { key = "error.html" }
  redirect_all_requests_to = "https://www.${var.domain_name}"
  tags = var.common_tags
}

# CORS Configuration
# resource "aws_s3_bucket_cors_configuration" "root_bucket" {
#   bucket = aws_s3_bucket.www_bucket.id
#   cors_rule {
#     allowed_headers = ["Authorization", "Content-Length"]
#     allowed_methods = ["GET", "POST"]
#     allowed_origins = ["https://www.${var.domain_name}"]
#     max_age_seconds = 3000
#   }
#   tags = var.common_tags
# }

# Bucket Ownership
resource "aws_s3_bucket_ownership_controls" "root_bucket" {
  bucket = aws_s3_bucket.root_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
  tags = var.common_tags
}

# Public Access
resource "aws_s3_bucket_public_access_block" "root_bucket" {
  bucket = aws_s3_bucket.root_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  tags = var.common_tags
}

# Bucket ACL
resource "aws_s3_bucket_acl" "root_bucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.root_bucket,
    aws_s3_bucket_public_access_block.root_bucket,
  ]
  bucket = aws_s3_bucket.root_bucket.id
  acl    = "public-read"
  tags = var.common_tags
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.root_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid": "PublicReadGetObject",
        "Effect": "Allow",
        "Principal": "*",
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::${aws_s3_bucket.root_bucket.bucket}/*"
      }
    ]
  })
}

