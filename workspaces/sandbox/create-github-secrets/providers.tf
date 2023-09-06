terraform {
  required_version = "~> 1.5"

  cloud {
    hostname     = "app.terraform.io"
    organization = "stem-garden-llc"

    workspaces {
      name = "sandbox-create-github-secrets"
    }
  }

  required_providers {
    github = {
      source                = "integrations/github"
      version               = "~> 5.0"
      configuration_aliases = [github.personal]
    }
  }
}

provider "github" {
  owner = "stem-garden-llc"
}