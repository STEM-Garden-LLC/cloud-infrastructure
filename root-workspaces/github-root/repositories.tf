
# React with Vite Test
resource "github_repository" "react_with_vite_test" {
  name        = "react-with-vite-test"
  description = "Simple React starter app with Vite dev server and build system."

  visibility = "public"
}

# data "aws_s3_bucket" "bucket_to_push_to" {
#   bucket = "bucket.test.com"
# }

resource "github_actions_secret" "aws_s3_bucket" {
  repository       = github_repository.react_with_vite_test.name
  secret_name      = "AWS_S3_BUCKET" 
  plaintext_value  = var.bucket_to_push_to
  # plaintext_value  = aws_s3_bucket.bucket_to_push_to.bucket
}

resource "github_actions_secret" "aws_access_key_id" {
  repository       = github_repository.react_with_vite_test.name
  secret_name      = "AWS_ACCESS_KEY_ID" 
  plaintext_value  = var.aws_access_key_id
}

resource "github_actions_secret" "aws_secret_access_key" {
  repository       = github_repository.react_with_vite_test.name
  secret_name      = "AWS_SECRET_ACCESS_KEY" 
  plaintext_value  = var.aws_secret_access_key
}
