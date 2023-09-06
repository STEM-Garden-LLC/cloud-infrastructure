# 1. Create test repo.
# 2. Create repo secrets for AWS credentials.

# STATUS -> SUCCESS

# Lesson Learned:
# The way things are currently set up variable sets are applied to workspaces manually.
# There are two var sets having to do with GitHub: app registration & personal access token.
# The Personal Access Token is required to create resources in GH.
# Some var sets (such as AWS creds) are currently applied to all workspaces but the GH vars must be added manually. 

# Testing Process:
# Added starting config for repo and secrets. Apply failed due to provider authentication.
# In TFC UI add var set with GH Org App Registration. Apply still fails for same reason.
# In TFC UI add var set with GH Personal Access Token. Apply succeeds.
# Manually remove both var sets, add net test secret, and confirm that apply fails.
# Add code to TFC root workspace to associate vars and apply. Check TFC UI to verify manually deleted var set is re-created in test workspace. 
# Attempt apply with only Personal Access Token and not Org App Registration. 



variable "aws_access_key_id" {
  type = string
}

variable "aws_secret_access_key" {
  type = string
}

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

resource "github_actions_secret" "aws_secret_access_key" {
  repository       = github_repository.test_repo.name
  secret_name      = "aws_secret_access_key"
  plaintext_value  = var.aws_secret_access_key
}

resource "github_actions_secret" "fake_test_secret" {
  repository       = github_repository.test_repo.name
  secret_name      = "fake_gh_actions_secret"
  plaintext_value  = "Blah Blah Blah"
}