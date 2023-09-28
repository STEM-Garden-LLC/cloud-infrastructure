# import {
#   to = aws_route53_zone.com_chessclubhost
#   id = "Z0709817284VP6KJ4AIUQ"
# }

resource "aws_route53_zone" "com_chessclubhost" {
  provider = aws.management_account

  comment           = "HostedZone created by Route53 Registrar"
  delegation_set_id = null
  force_destroy     = null
  name              = "chessclubhost.com"
  tags              = {}
  tags_all          = {}
}

module "acm_certificate_for_chessclubhost" {
  providers = { aws.management_account }
  source = "../../../modules/dns-certificate"

  apex_domain = "chessclubhost.com"
  subject_alternative_names = [ "*.chessclubhost.com" ]
}