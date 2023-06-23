terraform {
  required_version = "~> 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.4"
    }
  }

  cloud {
    # The following is provided as documentation only. 
    # This workspace is configured to use the VCS workflow, meaning that this config will be ignored and what is in the workspace settings will actually be in effect. 
    organization = "steg-garden-llc"
    hostname = "app.terraform.io" // same as default
    workspaces {
      name = "stemgarden-temp"
    }
  }
}

// default provider
provider "aws" {
  region = "us-east-2"
  shared_config_files      = ["/Users/tf_user/.aws/conf"]
  shared_credentials_files = ["/Users/tf_user/.aws/creds"]
  profile                  = "personal-account-admin"
}

// Cloudfront can only use SSL certificates created in us-east-1
provider "aws" {
  alias = "acm_provider"
  region = "us-east-1"
}
