terraform {
  required_version = "~> 1.5"

  cloud {
    hostname     = "app.terraform.io"
    organization = "stem-garden-llc"

    workspaces {
      name = "sandbox-assumable-roles"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.4"
    }
    github = {
      source                = "integrations/github"
      version               = "~> 5.0"
      configuration_aliases = [github.personal]
    }
  }
}

// Default AWS provider
provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["/Users/nigelwilson/.aws/config"]
  shared_credentials_files = ["/Users/nigelwilson/.aws/credentials"]

  assume_role {
    role_arn = "arn:aws:iam::060852368196:role/OrganizationAccountAccessRole"
  }
}
