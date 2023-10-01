# SSL Certificate
resource "aws_acm_certificate" "ssl_certificate" {
  domain_name               = local.complete_domain
  validation_method         = "DNS"
  
  validation_option {
    domain_name       = "testing.example.com"
    validation_domain = "example.com"
  }
  
  lifecycle {
    create_before_destroy = true
  }
}

# Uncomment the validation_record_fqdns line if you do DNS validation instead of Email.
resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn = aws_acm_certificate.ssl_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}
