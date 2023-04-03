terraform {
  required_version = ">= 1.3.1" # optimistic

  cloud {
    hostname     = "app.terraform.io"
    organization = "stem-garden-llc"

    workspaces {
      name = "aws_iam"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.47.0"
    }
  }
}

# Default Provider - Un-Aliased

provider "aws" {
  region = var.region

}


# Aliased Providers -- Not really sure which Workspace these belong in yet.

provider "aws" {
  alias  = "users"
  region = var.region

  # assume_role {
  #   role_arn = "arn:aws:iam::${aws_organizations_account.users.id}:role/Admin"
  # }
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.stem_garden_llc.id}:role/Admin"
  }
}

# provider "aws" {
#   assume_role {
#     role_arn = "arn:aws:iam::${aws_organizations_account.staging.id}:role/Admin"
#   }

#   alias  = "staging"
#   region = var.region
# }

# provider "aws" {
#   assume_role {
#     role_arn = "arn:aws:iam::${aws_organizations_account.production.id}:role/Admin"
#   }

#   alias  = "production"
#   region = var.region
# }

