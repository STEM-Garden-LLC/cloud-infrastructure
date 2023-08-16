terraform {
  required_version = ">= 1.5.0"

  cloud {
    hostname     = "app.terraform.io"
    organization = "stem-garden-llc"

    workspaces {
      name = "github-root"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
      configuration_aliases = [ github.personal ]
    }
  }
}



# Could Not Get the following to work
# variable "github_app_id" {
#   type = string
# }

# variable "github_app_installation_id" {
#   type = string
# }

# variable "github_app_pem_file" {
#   type = string
# }

# provider "github" {
#   owner = "stem-garden-llc"

#   app_auth {
#     id              = var.github_app_id              # or `GITHUB_APP_ID`
#     installation_id = var.github_app_installation_id # or `GITHUB_APP_INSTALLATION_ID`
#     pem_file        = var.github_app_pem_file        # or `GITHUB_APP_PEM_FILE`
#   }
# }

# Default
# Configure the GitHub Provider to provision resources in stem-garden-llc account
# variable "github_token" {
#   type = string
# }

provider "github" {
  owner = "stem-garden-llc"
}


# Must Specify to use this provider
# Configure the GitHub Provider to provision resources in nigel-f-wilson user account
# provider "github" {
#   alias = "personal"

#   owner = "nigel-f-wilson"
#   token = var.github_token
# }




# Test Resource
resource "github_repository" "tfc_test_repo" {
  name        = "TFC-test-repo"
  description = "My awesome codebase"

  visibility = "public"
  has_issues = true
#   has_discussions = true
#   has_projects = true
  allow_squash_merge = true
  allow_rebase_merge = true


}