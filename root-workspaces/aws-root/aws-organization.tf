#########################################
##  Organization & Management Account  ##
#########################################

resource "aws_organizations_organization" "sgllc_org" {
  aws_service_access_principals = ["account.amazonaws.com"]
  enabled_policy_types          = []
  feature_set                   = "ALL"
}

resource "aws_organizations_account" "stem_garden_llc" {
  name                       = "STEM Garden LLC"
  parent_id                  = "r-p2mx"
  email                      = "nigel@stemgarden.org"
  close_on_deletion          = null
  create_govcloud            = null
  iam_user_access_to_billing = null
  role_name                  = null
}

############################
##  STEM Garden Homepage  ##
############################

resource "aws_organizations_organizational_unit" "stem_garden_ou" {
  name      = "STEM Garden Homepage"
  parent_id = "r-p2mx"
  tags      = {}
  tags_all  = {}
}

resource "aws_organizations_account" "stem_garden_prod" {
  name  = "STEM Garden Prod"
  email = "aws+sg-prod@stemgarden.org"
  parent_id = aws_organizations_organizational_unit.stem_garden_ou.id
}

####################
##  Mastery Math  ##
####################

resource "aws_organizations_organizational_unit" "mastery_math_ou" {
  name      = "Mastery Math"
  parent_id = "r-p2mx"
  tags      = {}
  tags_all  = {}
}

resource "aws_organizations_account" "mastery_math_dev" {
  name                       = "Mastery Math Dev"
  parent_id                  = "ou-p2mx-6hyxrmrf"
  email                      = "masterymath+dev@stemgarden.org"
  close_on_deletion          = null
  create_govcloud            = null
  iam_user_access_to_billing = null
  role_name                  = null
}

resource "aws_organizations_account" "mastery_math_prod" {
  name                       = "Mastery Math Prod"
  parent_id                  = "ou-p2mx-6hyxrmrf"
  email                      = "masterymath@stemgarden.org"
  close_on_deletion          = null
  create_govcloud            = null
  iam_user_access_to_billing = null
  role_name                  = null
}

#########################
##  Club Hosting Tool  ##
#########################

resource "aws_organizations_organizational_unit" "chessclubhost_ou" {
  name      = "Club Host Tool"
  parent_id = aws_organizations_organization.sgllc_org.roots[0].id
}

# resource "aws_organizations_account" "account" {
#   name  = "Club Host Tool Prod"
#   email = "chessclubhost+prod@stemgarden.org"
#   parent_id = aws_organizations_organizational_unit.chessclubhost_ou.id
# }

import {
  to = aws_organizations_account.chessclubhost_prod
  id = "636021045783"
}

# resource "aws_organizations_account" "chessclubhost_ou" {
#   name  = "Club Host Tool Prod"
#   email = "chessclubhost+prod@stemgarden.org"
#   parent_id = aws_organizations_organizational_unit.chessclubhost_ou.id
# }