import {
  to = aws_route53_zone.com_chessclubhost
  id = "Z0709817284VP6KJ4AIUQ"
}

import {
  to = aws_route53_zone.org_masterymath
  id = "Z06677023RZS93Q99ME56"
}

import {
  to = aws_route53_zone.org_stemgarden
  id = "Z04644452DUB6MD4Z75A7"
}

resource "aws_route53_zone" "com_chessclubhost" {
  comment           = "HostedZone created by Route53 Registrar"
  delegation_set_id = null
  force_destroy     = null
  name              = "chessclubhost.com"
  tags              = {}
  tags_all          = {}
}

resource "aws_route53_zone" "org_masterymath" {
  comment           = "Managed by TFC"
  delegation_set_id = null
  force_destroy     = null
  name              = "masterymath.org"
  tags = {
    project        = "Mastery Math"
    provisioned_by = "Terraform Cloud"
    workspace      = "Shared"
  }
  tags_all = {
    project        = "Mastery Math"
    provisioned_by = "Terraform Cloud"
    workspace      = "Shared"
  }
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