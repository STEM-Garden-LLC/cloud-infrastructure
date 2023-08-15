terraform {
  required_version = "~> 1.3"

  cloud {
    hostname = "app.terraform.io" 
    organization = "stem-garden-llc"
    
    workspaces {
      name = "sandbox-github-action-push-to-s3"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
    #   version = ">= 4.47.0"
      version = "~> 5.4"
    }
  }
}

// default provider
// Cloudfront can only use SSL certificates created in us-east-1
provider "aws" {
  region = "us-east-1"
  shared_config_files      = ["/Users/nigelwilson/.aws/config"]
  shared_credentials_files = ["/Users/nigelwilson/.aws/credentials"]
}
