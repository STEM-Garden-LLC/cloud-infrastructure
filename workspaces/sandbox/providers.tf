provider "aws" {
  region = var.region

  shared_config_files      = ["/Users/tf_user/.aws/config"]
  shared_credentials_files = ["/Users/tf_user/.aws/credentials"]
  profile                  = "sgllc-admin"
}
