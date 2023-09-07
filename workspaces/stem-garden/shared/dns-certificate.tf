import {
  to = aws_acm_certificate.org_stemgarden
  id = "arn:aws:acm:us-east-1:889823018333:certificate/9aec3cc5-604c-45e6-9802-5bcfd3b401e8"
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