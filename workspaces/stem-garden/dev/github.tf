data "github_repository" "stemgarden_dot_org" {
  full_name = "STEM-Garden-LLC/stemgarden.org"
}

resource "github_actions_secret" "aws_s3_bucket" {
  repository      = data.github_repository.stemgarden_dot_org.name
  secret_name     = "AWS_S3_BUCKET"
  plaintext_value  = local.bucket_name
}

resource "github_actions_secret" "aws_access_key_id" {
  repository      = data.github_repository.stemgarden_dot_org
  secret_name     = "AWS_ACCESS_KEY_ID"
  plaintext_value = var.aws_access_key_id
}

resource "github_actions_secret" "aws_secret_access_key" {
  repository      = data.github_repository.stemgarden_dot_org.name
  secret_name     = "AWS_SECRET_ACCESS_KEY"
  plaintext_value = var.aws_secret_access_key
}
