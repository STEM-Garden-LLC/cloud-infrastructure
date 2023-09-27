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
  close_on_deletion          = false
  role_name                  = null
}

############################
##  STEM Garden Homepage  ##
############################

module "stem_garden_project_accounts" {
  source = "../../modules/aws-org-project-accounts"
  project_name = "stem_garden"
  account_name_suffix_list = [
    "dev", 
    "prod", 
    "shared"
  ]
}

####################
##  Mastery Math  ##
####################

module "mastery_math_project_accounts" {
  source = "../../modules/aws-org-project-accounts"
  project_name = "mastery_math"
  account_name_suffix_list = [
    "dev", 
    "prod", 
    "shared"
  ]
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