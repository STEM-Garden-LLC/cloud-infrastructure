resource "github_repository" "stemgarden_dot_org" {
  name = "stemgarden.org"
  description = "Homepage for the STEM Garden. To promote produce sales, private tutoring service, and host math games."
  homepage_url = "stemgarden.org"
  visibility = "public"
  has_issues = true
  has_projects = true
  has_discussions = true
  vulnerability_alerts = true
  has_wiki = false
  is_template = false
  archived = false
  archive_on_destroy = true
}

resource "github_branch" "main" {
  repository = github_repository.stemgarden_dot_org.name
  branch     = "main"
}

resource "github_branch_default" "default"{
  repository = github_repository.stemgarden_dot_org.name
  branch     = github_branch.main.branch
}

# data "aws_s3_bucket" "bucket_to_push_to" {
#   bucket = "bucket.test.com"
# }

# resource "github_actions_secret" "aws_s3_bucket" {
#   repository       = github_repository.react_with_vite_test.name
#   secret_name      = "AWS_S3_BUCKET" 
#   plaintext_value  = var.bucket_to_push_to
#   # plaintext_value  = aws_s3_bucket.bucket_to_push_to.bucket
# }

# resource "github_actions_secret" "aws_access_key_id" {
#   repository       = github_repository.react_with_vite_test.name
#   secret_name      = "AWS_ACCESS_KEY_ID" 
#   plaintext_value  = var.aws_access_key_id
# }

# resource "github_actions_secret" "aws_secret_access_key" {
#   repository       = github_repository.react_with_vite_test.name
#   secret_name      = "AWS_SECRET_ACCESS_KEY" 
#   plaintext_value  = var.aws_secret_access_key
# }
