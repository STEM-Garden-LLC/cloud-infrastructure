locals {
  common_tags = {
    created_by = "Terraform"
    region     = var.region
    workspace  = var.workspace
  }
}
