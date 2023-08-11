terraform {
  required_version = ">= 1.3.1" # optomistic

  cloud {
    hostname     = "app.terraform.io"
    organization = "stem-garden-llc"

    workspaces {
      name = "next-amplify-test"
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


