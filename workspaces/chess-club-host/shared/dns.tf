import {
  to = aws_route53_zone.com_chessclubhost
  id = "Z0709817284VP6KJ4AIUQ"
}

resource "aws_route53_zone" "com_chessclubhost" {
  comment           = "HostedZone created by Route53 Registrar"
  delegation_set_id = null
  force_destroy     = null
  name              = "chessclubhost.com"
  tags              = {}
  tags_all          = {}
}