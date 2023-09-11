terraform {
  required_version = ">= 1.5.0"

  cloud {
    hostname     = "app.terraform.io"
    organization = "stem-garden-llc"

    workspaces {
      name = "aws-root"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.12.0"
    }
  }
}

# Shared credential files are used for local runs including "imports"
# TFC runs ignore these files and use TF vars stored in the workspace

provider "aws" {
  region = "us-east-1"
  shared_config_files      = ["/Users/nigelwilson/.aws/config"]
  shared_credentials_files = ["/Users/nigelwilson/.aws/credentials"]

  default_tags {
    tags = {
      Owner            = "SGLLC"
      Project          = "Cloud Provider Roots"
      Workspace        = "AWS Root"
      Provisioned_via  = "Terraform Cloud"
    }
  }
}


