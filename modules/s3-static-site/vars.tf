variable "tfc_project" {
  type        = string
  description = "The name of the terraform cloud project this module is to be applied within."
}

variable "tfc_workspace" {
  type        = string
  description = "The name of the terraform cloud workspace this module is to be applied within."
}

variable "apex_domain" {
  type        = string
  description = "The apex domain used to retreive the Hosted Zone data."
}

variable "sub_domain" {
  type        = string
  description = "Optional subdomain to prefix on the apex domain to create the address to point to CloudFront distribution."
}


variable "common_tags" {
  description = "Common tags you want applied to all components."
}

locals {
  bucket_name = "${var.tfc_project}-${var.tfc_workspace}"
  complete_domain = "${var.sub_domain}.${var.apex_domain}"
}

output "bucket_name" {
  value = aws_s3_bucket.static_site_bucket.id
}