import {
  to = aws_route53_zone.org_stemgarden
  id = "Z04644452DUB6MD4Z75A7"
}

resource "aws_route53_zone" "org_stemgarden" {
  comment           = "Managed by Terraform"
  delegation_set_id = null
  force_destroy     = null
  name              = "stemgarden.org"
  tags = {
    project = "stemgarden.org"
  }
  tags_all = {
    project = "stemgarden.org"
  }
}

resource "aws_acm_certificate" "org_stemgarden" {
  certificate_authority_arn = null
  certificate_body          = null
  certificate_chain         = null
  domain_name               = "stemgarden.org"
  early_renewal_duration    = null
  key_algorithm             = "RSA_2048"
  private_key               = null # sensitive
  subject_alternative_names = ["*.stemgarden.org", "stemgarden.org"]
  tags                      = {}
  tags_all                  = {}
  validation_method         = "DNS"
  options {
    certificate_transparency_logging_preference = "ENABLED"
  }
}