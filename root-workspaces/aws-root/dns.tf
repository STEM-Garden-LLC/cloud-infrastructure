##########################
##       Sandbox        ##
##########################


##########################
##     Mastery Math     ##
##########################

resource "aws_route53_zone" "org_masterymath" {
  comment           = "Mastery Math"
  delegation_set_id = null
  force_destroy     = null
  name              = "masterymath.org"

  tags = {
    project        = "Mastery Math"
    provisioned_by = "Terraform Cloud"
    workspace      = "AWS Root"
  }
}

##########################
##      STEM Garden     ##
##########################

resource "aws_route53_zone" "org_stemgarden" {
  comment           = "STEM Garden"
  delegation_set_id = null
  force_destroy     = null
  name              = "stemgarden.org"
  
  tags = {
    project        = "STEM Garden"
    provisioned_by = "Terraform Cloud"
    workspace      = "AWS Root"
  }
}

##########################
##   Chess Club Host    ##
##########################

resource "aws_route53_zone" "com_chessclubhost" {
  comment           = "HostedZone created by Route53 Registrar"
  delegation_set_id = null
  force_destroy     = null
  name              = "chessclubhost.com"
  tags              = {}
  tags_all          = {}
}
