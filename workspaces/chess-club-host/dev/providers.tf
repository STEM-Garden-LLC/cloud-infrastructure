terraform {
  required_version = "~> 1.5.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.4"
    }
  }

  cloud {
    organization = "stem-garden-llc"
    hostname = "app.terraform.io" 
    workspaces {
      name = "chess-club-host-dev"
    }
  }
}

// default provider
provider "aws" {
  region = "us-east-1"
  shared_config_files      = ["/Users/nigelwilson/.aws/config"]
  shared_credentials_files = ["/Users/nigelwilson/.aws/credentials"]

  default_tags {
    tags = {
      provisioned_by = "Terraform Cloud"
      project        = "Chess Club Host"
      workspace      = "Dev"
    }
  }
}
