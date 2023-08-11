terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.45.0"
    }
  }
}

provider "tfe" {
  # token = var.token   # Set with env var TFE_TOKEN instead
  organization = "stem-garden-llc"
}
