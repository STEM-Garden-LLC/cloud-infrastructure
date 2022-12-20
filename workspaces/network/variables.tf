variable "workspace" {
  description = "The Terraform Cloud Workspace. Corresponds to the name of this directory."
  type = string
}

variable "region" {
  description = "The AWS region the workspace corresponds to."
  type = string
  default = "us-east-2"   # Ohio
}
