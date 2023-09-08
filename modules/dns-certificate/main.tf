# 1. Get Hosted Zone data. Resource is managed by aws-root workspace.
# 2. Create ACM certificate

data "aws_route53_zone" "hosted_zone" {
  name = var.apex_domain
}

resource "aws_acm_certificate" "cert" {
  domain_name               = var.apex_domain
  subject_alternative_names = var.subject_alternative_names
  key_algorithm             = "RSA"
  validation_method         = "DNS"
 
  options {
    certificate_transparency_logging_preference = "ENABLED"
  }
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_route53_record" "cert_validation_cnames" {
  allow_overwrite = true
  name =  tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_name
  records = [tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_value]
  type = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_type
  zone_id = aws_route53_zone.hosted_zone.zone_id
  ttl = 60
}

resource "aws_acm_certificate_validation" "cert_validate" {
  certificate_arn = aws_acm_certificate.cert.arn
  validation_record_fqdns = [aws_route53_record.cert_validation_cnames.fqdn]
}