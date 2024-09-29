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
      name = "stem-garden-prod"
    }
  }
}

# Default AWS Provider (in the Project Account)
# Cloudfront can only use SSL certificates created in us-east-1
provider "aws" {
  region = "us-east-1"
  shared_config_files      = ["/Users/nigelwilson/.aws/config"]
  shared_credentials_files = ["/Users/nigelwilson/.aws/credentials"]

  assume_role {
    role_arn = "arn:aws:iam::383081817694:role/OrganizationAccountAccessRole"
  }

   default_tags {
    tags = {
      provisioned_by = "Terraform Cloud"
      project        = "STEM Garden"
      workspace      = "Prod"
    }
  }
}

# Secondary Provider (in the Org Management Account)
# Because NS records for the subdomain need to be added to the 
# hosted zone in the account that owns the apex domain.
provider "aws" {
  alias = "management_account"
  region = "us-east-1"
  shared_config_files      = ["/Users/nigelwilson/.aws/config"]
  shared_credentials_files = ["/Users/nigelwilson/.aws/credentials"]

  assume_role {
    role_arn = "arn:aws:iam::889823018333:role/sgllc-admin"
  }

   default_tags {
    tags = {
      provisioned_by = "Terraform Cloud"
      project        = "STEM Garden"
      workspace      = "Prod"
    }
  }
}

