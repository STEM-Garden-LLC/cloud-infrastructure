variable "apex_domain" {
  type        = string
  description = "The apex domain used to retreive the Hosted Zone data."
}

variable "sub_domain" {
  type        = string
  description = "Optional subdomain to prefix on the apex domain to create the address to point to CloudFront distribution."
  default = ""
}

variable "hosted_zone_id" {
  type        = string
  description = "Provide an ID to a separately created Hosted Zone."
}

locals {
  complete_domain = (var.sub_domain == "") ? var.apex_domain : "${var.sub_domain}.${var.apex_domain}"
}

output "hosted_zone_id" {
  value = aws_route53_zone.main.zone_id
}

output "validated_certificate_arn" {
  value = aws_acm_certificate_validation.cert_validation.certificate_arn
}

  
