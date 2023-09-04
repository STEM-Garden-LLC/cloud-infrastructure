variable "tfc_project" {
  type        = string
  description = "The name of the terraform cloud project this module is to be applied within."
}

variable "tfc_workspace" {
  type        = string
  description = "The name of the terraform cloud workspace this module is to be applied within."
}

variable "domain_name" {
  type        = string
  description = "The domain name for the website."
}

variable "use_preexisting_bucket" {
  type        = bool
  description = "Whether to treat the bucket_name as the name of an existing bucket or to create a new bucket with that name."
}

# variable "bucket_name" {
#   type        = string
#   description = "The name of the S3 bucket to serve website contents from."
# }

variable "common_tags" {
  description = "Common tags you want applied to all components."
}

locals {
  bucket_name = "${var.tfc_project}-${var.tfc_workspace}"
}