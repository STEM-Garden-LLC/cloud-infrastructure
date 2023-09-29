resource "aws_route53_zone" "org_stemgarden" {
  provider = aws.management_account

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

# The following certificate was created and validated in the console and imported. 
# Later on the "dns-certificate" module was created to handle this process in one apply.

resource "aws_acm_certificate" "org_stemgarden" {
  provider = aws.management_account

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
