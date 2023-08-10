terraform {
  # required_version = "~> 1.3.1" # pessimistic
  required_version = ">= 1.3.1" # optimistic

  cloud {
    hostname     = "app.terraform.io"
    organization = "stem-garden-llc"

    workspaces {
      name = "organization"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.47.0"
    }
  }
}

# ROOT ACCOUNT PROVIDER

provider "aws" {
  region = var.region

}

# ALIASED PROVIDERS to other ACCOUNTS

# provider "aws" {
#   assume_role {
#     role_arn = "arn:aws:iam::${aws_organizations_account.users.id}:role/Admin"
#   }

#   alias  = "users"
#     region = var.region

# }

# provider "aws" {
#   assume_role {
#     role_arn = "arn:aws:iam::${aws_organizations_account.staging.id}:role/Admin"
#   }

#   alias  = "staging"
#     region = var.region

# }

# provider "aws" {
#   assume_role {
#     role_arn = "arn:aws:iam::${aws_organizations_account.production.id}:role/Admin"
#   }

#   alias  = "production"
#     region = var.region

# }


