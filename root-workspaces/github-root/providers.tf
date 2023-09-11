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

variable "github_token" {
  type = string
  default = null
}

# Default
# Configure the GitHub Provider to provision resources in stem-garden-llc account
provider "github" {
  owner = "stem-garden-llc"
  token = var.github_token
}

# Must Specify to use this provider
# Configure the GitHub Provider to provision resources in nigel-f-wilson user account
provider "github" {
  alias = "personal"
  owner = "nigel-f-wilson"
  token = var.github_token
}

