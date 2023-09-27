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
}

resource "aws_organizations_account" "stem_garden_prod" {
  name      = "STEM Garden Prod"
  email     = "aws+sg-prod@stemgarden.org"
  parent_id = aws_organizations_organizational_unit.stem_garden_ou.id
}

####################
##  Mastery Math  ##
####################

# resource "aws_organizations_organizational_unit" "mastery_math_ou" {
#   name      = "Mastery Math"
#   parent_id = "r-p2mx"
# }

# resource "aws_organizations_account" "mastery_math_dev" {
#   name                       = "Mastery Math Dev"
#   email                      = "masterymath+dev@stemgarden.org"
#   # parent_id                  = aws_organizations_organizational_unit.mastery_math_ou.id
#   parent_id = "r-p2mx"
#   close_on_deletion          = false
#   create_govcloud            = null
#   iam_user_access_to_billing = null
#   role_name                  = null
# }

# resource "aws_organizations_account" "mastery_math_prod" {
#   name                       = "Mastery Math Prod"
#   email                      = "masterymath@stemgarden.org"
#   parent_id                  = aws_organizations_organizational_unit.mastery_math_ou.id
#   close_on_deletion          = null
#   create_govcloud            = null
#   iam_user_access_to_billing = null
#   role_name                  = null
# }

module "mastery_math_project_accounts" {
  source = "../../modules/aws-org-project-accounts"

  project_name = "mastery_math"
  account_name_suffix_list = [
    "dev", 
    "prod", 
    "shared"
  ]
}

import {
  to = module.mastery_math_project_accounts.aws_organizations_account.accounts["dev"]
  id = "496750456511"
}

#########################
##  Club Hosting Tool  ##
#########################

module "club_host_project_accounts" {
  source = "../../modules/aws-org-project-accounts"

  project_name = "chess_club_host"
  account_name_suffix_list = [
    "dev", 
    "prod", 
    "shared",
    "production"
  ]
}


#########################
##   Sandbox Account   ##
#########################

module "sandbox_project_accounts" {
  source = "../../modules/aws-org-project-accounts"

  project_name = "sandbox"
  account_name_suffix_list = [
    "main"
  ]
}