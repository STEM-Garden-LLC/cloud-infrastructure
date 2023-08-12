terraform {
  required_version = ">= 1.5.0"

  cloud {
    hostname     = "app.terraform.io"
    organization = "stem-garden-llc"

    workspaces {
      name = "terraform-cloud-root"
    }
  }

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.45.0"
    }
  }
}

provider "tfe" {
  # token = var.token   # Set with env var TFE_TOKEN instead
  organization = "stem-garden-llc"
}
