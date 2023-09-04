
# # Bucket
# resource "aws_s3_bucket" "react_with_vite_test" {
#   bucket = "react-with-vite-test"

#   tags = {
#     provisioned_by = "TFC"
#     environment    = "sandbox"
#   }
# }

# # Website Configuration
# resource "aws_s3_bucket_website_configuration" "react_with_vite_test" {
#   bucket = aws_s3_bucket.react_with_vite_test.id
#   index_document { suffix = "index.html" }
#   error_document { key = "error.html" }
# }

# # Bucket Policy
# resource "aws_s3_bucket_policy" "react_with_vite_test" {
#   bucket = aws_s3_bucket.react_with_vite_test.id
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         "Sid" : "PublicPutObject",
#         "Effect" : "Allow",
#         "Principal" : "*",
#         "Action" : "s3:PutObject",
#         "Resource" : "${aws_s3_bucket.react_with_vite_test.arn}/*"
#       }
#     ]
#   })
# }

# # Ownership Controls
# resource "aws_s3_bucket_ownership_controls" "react_with_vite_test" {
#   bucket = aws_s3_bucket.react_with_vite_test.id
#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }

# # Public Access Block
# resource "aws_s3_bucket_public_access_block" "react_with_vite_test" {
#   bucket = aws_s3_bucket.react_with_vite_test.id

#   block_public_acls       = false
#   block_public_policy     = false
#   ignore_public_acls      = false
#   restrict_public_buckets = false
# }

# # Public ACL
# resource "aws_s3_bucket_acl" "react_with_vite_test" {
#   depends_on = [
#     aws_s3_bucket_ownership_controls.react_with_vite_test,
#     aws_s3_bucket_public_access_block.react_with_vite_test,
#   ]

#   bucket = aws_s3_bucket.react_with_vite_test.id
#   acl    = "public-read-write"
# }