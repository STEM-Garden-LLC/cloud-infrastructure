#########################################
##  Organization & Management Account  ##
#########################################

import {
  to = aws_organizations_organization.sgllc_org
  id = "o-c2jf6qw1ou"
}

resource "aws_organizations_organization" "sgllc_org" {
  aws_service_access_principals = ["account.amazonaws.com"]
  enabled_policy_types          = []
  feature_set                   = "ALL"
}

# import {
#   to = aws_organizations_organizational_unit.root_ou
#   id = "r-p2mx"
# }

import {
  to = aws_organizations_account.stem_garden_llc
  id = "889823018333"
}

resource "aws_organizations_account" "stem_garden_llc" {
  close_on_deletion          = null
  create_govcloud            = null
  email                      = "nigel@stemgarden.org"
  iam_user_access_to_billing = null
  name                       = "STEM Garden LLC"
  parent_id                  = "r-p2mx"
  role_name                  = null
  tags                       = {}
  tags_all                   = {}
}

############################
##  STEM Garden Homepage  ##
############################

import {
  to = aws_organizations_organizational_unit.stem_garden_ou
  id = "ou-p2mx-9w3b2mnl"
}

resource "aws_organizations_organizational_unit" "stem_garden_ou" {
  name      = "STEM Garden Homepage"
  parent_id = "r-p2mx"
  tags      = {}
  tags_all  = {}
}




# No Accounts to import here, will create using TF
# import {
#   to = aws_organizations_account.stem_garden_dev
#   id = "111111111111"
# }

####################
##  Mastery Math  ##
####################

import {
  to = aws_organizations_organizational_unit.mastery_math_ou
  id = "ou-p2mx-6hyxrmrf"
}

resource "aws_organizations_organizational_unit" "mastery_math_ou" {
  name      = "Mastery Math"
  parent_id = "r-p2mx"
  tags      = {}
  tags_all  = {}
}

import {
  to = aws_organizations_account.mastery_math_dev
  id = "496750456511"
}


resource "aws_organizations_account" "mastery_math_dev" {
  close_on_deletion          = null
  create_govcloud            = null
  email                      = "masterymath+dev@stemgarden.org"
  iam_user_access_to_billing = null
  name                       = "Mastery Math Dev"
  parent_id                  = "ou-p2mx-6hyxrmrf"
  role_name                  = null
  tags                       = {}
  tags_all                   = {}
}

import {
  to = aws_organizations_account.mastery_math_prod
  id = "529386439094"
}

resource "aws_organizations_account" "mastery_math_prod" {
  close_on_deletion          = null
  create_govcloud            = null
  email                      = "masterymath@stemgarden.org"
  iam_user_access_to_billing = null
  name                       = "Mastery Math Prod"
  parent_id                  = "ou-p2mx-6hyxrmrf"
  role_name                  = null
  tags                       = {}
  tags_all                   = {}
}


#########################
##  Club Hosting Tool  ##
#########################

# resource "aws_organizations_organizational_unit" "chessclubhost_ou" {
#   name      = "Club Host Tool"
#   parent_id = aws_organizations_organization.sgllc_org.roots[0].id
# }

# resource "aws_organizations_account" "account" {
#   name  = "Club Host Tool Prod"
#   email = "chessclubhost+prod@stemgarden.org"
# }