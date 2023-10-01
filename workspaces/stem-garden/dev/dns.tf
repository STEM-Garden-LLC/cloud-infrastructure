resource "aws_route53_zone" "main" {
  name = local.complete_domain
}

module "ssl_certificate" {
  source = "../../../modules/validated-ssl-cert"

  hosted_zone_id = aws_route53_zone.main
  apex_domain = var.apex_domain
  sub_domain = var.sub_domain
}