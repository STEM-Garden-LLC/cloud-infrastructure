terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  owner = "STEM-Garden-LLC"

#   app_auth {
#     # id              = var.app_id              # or `GITHUB_APP_ID`
#     # installation_id = var.app_installation_id # or `GITHUB_APP_INSTALLATION_ID`
#     # pem_file        = var.app_pem_file        # or `GITHUB_APP_PEM_FILE`
#   }
}

# Add a user to the organization
# resource "github_membership" "membership_for_user_x" {
#   # ...
# }

resource "github_repository" "tfc_test_repo" {
  name        = "TFC Test Repo"
  description = "My awesome codebase"

  visibility = "public"
  has_issues = true
#   has_discussions = true
#   has_projects = true
  allow_squash_merge = true
  allow_rebase_merge = true


  template {
    owner                = "github"
    repository           = "terraform-template-module"
    include_all_branches = true
  }
}