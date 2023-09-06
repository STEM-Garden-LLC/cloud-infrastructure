# 1. Create test repo.
# 2. Create repo secrets for AWS credentials.

resource "github_repository" "test_repo" {
  name        = "test-repo-for-tfc-secret-creation"
  description = "A repo that will be used to isolate the process for creating GitHub secrets via TFC"

  visibility = "public"

  has_issues = false
  has_discussions = false
  
}

data "github_actions_public_key" "example_public_key" {
  repository = github_repository.test_repo.name
}

resource "github_actions_secret" "aws_access_key_id" {
  repository       = github_repository.test_repo.name
  secret_name      = "aws_access_key_id"
  plaintext_value  = var.aws_access_key_id
}

resource "github_actions_secret" "example_secret" {
  repository       = github_repository.test_repo.name
  secret_name      = "aws_secret_access_key"
  encrypted_value  = var.aws_secret_access_key
}