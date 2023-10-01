# Create SSL certificate

resource "aws_acm_certificate" "ssl_certificate" {
  domain_name               = local.complete_domain
  validation_method         = "DNS"
  # validation_method         = "EMAIL"
  
  validation_option {
    domain_name       = local.complete_domain
    validation_domain = var.apex_domain
  }
  lifecycle {
    create_before_destroy = true
  }
}

# Create certificate validation records (generally type CNAME)

resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.ssl_certificate.domain_validation_options : dvo.domain_name => {
      name    = dvo.resource_record_name
      record  = dvo.resource_record_value
      type    = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.hosted_zone_id
}

# Validate

resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn = aws_acm_certificate.ssl_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}

