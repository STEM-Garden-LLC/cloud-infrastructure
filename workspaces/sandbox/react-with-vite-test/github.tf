# React with Vite Test
resource "github_repository" "react_with_vite_test" {
  name        = "react-with-vite-test"
  description = "Simple React starter app with Vite dev server and build system."

  visibility           = "public"
  has_downloads        = true
  has_issues           = true
  has_projects         = true
  vulnerability_alerts = true
}

resource "github_actions_secret" "aws_s3_bucket" {
  repository      = github_repository.react_with_vite_test.name
  secret_name     = "AWS_S3_BUCKET"
  plaintext_value  = module.static_site_s3.bucket_name
}

resource "github_actions_secret" "aws_access_key_id" {
  repository      = github_repository.react_with_vite_test.name
  secret_name     = "AWS_ACCESS_KEY_ID"
  plaintext_value = var.AWS_ACCESS_KEY_ID
}

resource "github_actions_secret" "aws_secret_access_key" {
  repository      = github_repository.react_with_vite_test.name
  secret_name     = "AWS_SECRET_ACCESS_KEY"
  plaintext_value = var.AWS_SECRET_ACCESS_KEY
}
