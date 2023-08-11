terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.45.0"
    }
  }
}

provider "tfe" {
  token = var.token
  organization = "stem-garden-llc"
}