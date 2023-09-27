terraform {
  required_version = "~> 1.3"

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
      name = "mastery-math-prod"
    }
  }
}

// default provider
// Cloudfront can only use SSL certificates created in us-east-1
provider "aws" {
  region = "us-east-1"
  shared_config_files      = ["/Users/nigelwilson/.aws/config"]
  shared_credentials_files = ["/Users/nigelwilson/.aws/credentials"]

  assume_role {
    role_arn = "arn:aws:iam::408548555010:role/OrganizationAccountAccessRole"
  }

  default_tags {
    tags = {
      provisioned_by = "Terraform Cloud"
      project        = "Mastery Math"
      workspace      = "Prod"
    }
  }
}
