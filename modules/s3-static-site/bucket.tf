# # # # # # # # # # # # # ## # # # # # # # # # # 
# S3 bucket for website.                       #
# # # # # # # # # # # # # ## # # # # # # # # # # 

resource "aws_s3_bucket" "static_site_bucket" {
  bucket = local.bucket_name
  tags = var.common_tags
}

# Website Configuration
resource "aws_s3_bucket_website_configuration" "static_site_bucket" {
  bucket = aws_s3_bucket.static_site_bucket.id
  index_document { suffix = "index.html" }
  error_document { key = "error.html" }
}

# CORS Configuration
resource "aws_s3_bucket_cors_configuration" "example" {
  bucket = aws_s3_bucket.static_site_bucket.id
  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://www.${var.domain_name}"]
    max_age_seconds = 3000
  }
}

# Bucket Ownership
resource "aws_s3_bucket_ownership_controls" "static_site_bucket" {
  bucket = aws_s3_bucket.static_site_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Public Access
resource "aws_s3_bucket_public_access_block" "static_site_bucket" {
  bucket = aws_s3_bucket.static_site_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Bucket ACL
resource "aws_s3_bucket_acl" "static_site_bucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.static_site_bucket,
    aws_s3_bucket_public_access_block.static_site_bucket,
  ]
  bucket = aws_s3_bucket.static_site_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "static_site_bucket" {
  bucket = aws_s3_bucket.static_site_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid": "PublicReadGetObject",
        "Effect": "Allow",
        "Principal": "*",
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::${aws_s3_bucket.static_site_bucket.bucket}/*"
      }
    ]
  })
}

# I think there is a better way to handle redirects
# This code was taken from an example that inaccurately stated that the S3 bucket must be named identical to the domain name. 
# I have since learned that this is only required when NOT using CloudFront. I believe that the best way to do this is not to have two S3 
# buckets but to have a single bucket, and a single CF distribution with an Alternate domain configured. 

# # # # # # # # # # # # # # ## # # # # # # # # # # 
# # S3 bucket for redirecting non-www to www.    #
# # # # # # # # # # # # # # ## # # # # # # # # # # 

# resource "aws_s3_bucket" "root_bucket" {
#   bucket = var.domain_name
#   tags = var.common_tags
# }

# # Root Redirect Website Configuration
# resource "aws_s3_bucket_website_configuration" "root_bucket" {
#   bucket = aws_s3_bucket.root_bucket.id
#   redirect_all_requests_to {
#     host_name = "https://www.${var.domain_name}"
#   }
# }

# # CORS Configuration
# resource "aws_s3_bucket_cors_configuration" "root_bucket" {
#   bucket = aws_s3_bucket.root_bucket.id
#   cors_rule {
#     allowed_headers = ["Authorization", "Content-Length"]
#     allowed_methods = ["GET", "POST"]
#     allowed_origins = ["https://www.${var.domain_name}"]
#     max_age_seconds = 3000
#   }
# }

# # Bucket Ownership
# resource "aws_s3_bucket_ownership_controls" "root_bucket" {
#   bucket = aws_s3_bucket.root_bucket.id
#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }

# # Public Access
# resource "aws_s3_bucket_public_access_block" "root_bucket" {
#   bucket = aws_s3_bucket.root_bucket.id
#   block_public_acls       = false
#   block_public_policy     = false
#   ignore_public_acls      = false
#   restrict_public_buckets = false
# }

# # Bucket ACL
# resource "aws_s3_bucket_acl" "root_bucket" {
#   depends_on = [
#     aws_s3_bucket_ownership_controls.root_bucket,
#     aws_s3_bucket_public_access_block.root_bucket,
#   ]
#   bucket = aws_s3_bucket.root_bucket.id
#   acl    = "public-read"
# }

# resource "aws_s3_bucket_policy" "root_bucket" {
#   bucket = aws_s3_bucket.root_bucket.id
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         "Sid": "PublicReadGetObject",
#         "Effect": "Allow",
#         "Principal": "*",
#         "Action": "s3:GetObject",
#         "Resource": "arn:aws:s3:::${aws_s3_bucket.root_bucket.bucket}/*"
#       }
#     ]
#   })
# }

