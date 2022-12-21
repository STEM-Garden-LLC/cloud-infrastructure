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

provider "aws" {
  region = var.region

}
