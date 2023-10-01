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
  default = ""
}

variable "existing_hosted_zone_id" {
  type        = string
  description = "Provide a value to use a preexisting Hosted Zone, otherwise one will be created."
  default = null
}

locals {
  use_existing_hosted_zone = (var.existing_hosted_zone_id == null) ? false : true
  hosted_zone_id = coalesce(var.existing_hosted_zone_id[0], aws_route53_zone.main.zone_id[0])
  # hosted_zone_id = coalesce(data.aws_route53_zone.main.zone_id, aws_route53_zone.main.zone_id[0])


  # bucket_name = "${var.tfc_project}-${var.tfc_workspace}"
  complete_domain = (var.sub_domain == "") ? var.apex_domain : "${var.sub_domain}.${var.apex_domain}"
}

output "hosted_zone_id" {
  value = coalesce(data.aws_route53_zone.main.zone_id[0], aws_route53_zone.main.zone_id[0])
}

output "validated_certificate_arn" {
  value = aws_acm_certificate_validation.cert_validation.certificate_arn
}

  
