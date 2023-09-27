#########################################
##  Organization & Management Account  ##
#########################################

resource "aws_iam_group" "all_team_members" {
  name = "all-team-members"
  path = "/"
}

resource "aws_iam_group_policy_attachment" "all_team_self_manage_mfa_and_credentials" {
  group      = aws_iam_group.all_team_members.name
  policy_arn = aws_iam_policy.self_manage_mfa_and_credentials.arn
  # policy_arn = aws_iam_policy.self_manage_password.arn
}

# locals {
#   sandbox_main_account_id = module.sandbox_project_accounts
#   # "060852368196"
# }


# resource "aws_iam_group" "sgllc_root_readonly" {
#   name = "sgllc-root-readonly"
#   path = "/"
# }





############################
##  STEM Garden Homepage  ##
############################

# resource "aws_iam_group" "stem_garden_admins" {
#   name = "stem-garden-admins"
#   path = "/stemgarden/"
# }

# module "stem_garden_admins" {
#   source = "../../modules/assume_role_group"
#   group_name = "stem_garden_admins"
#   group_members = [
#     "nigel-f-wilson",
#     "nigels-test-user"
#   ]
#   assumeable_role_arns = [

#   ]
# }

####################
##  Mastery Math  ##
####################

# resource "aws_iam_group" "mastery_math_admins" {
#   name = "mastery-math-admins"
#   path = "/masterymath/"
# }

# resource "aws_iam_group" "mastery_math_devs" {
#   name = "mastery-math-devs"
#   path = "/masterymath/"
# }

#########################
##  Club Hosting Tool  ##
#########################

# resource "aws_iam_group" "club_host_admins" {
#   name = "chess-club-host-admins"
#   path = "/clubhost/"
# }

# resource "aws_iam_group_policy" "club_host_admin" {
#   name = "chess-club-host-admins"
#   group      = aws_iam_group.club_host_admins.name
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       { 
#         Sid = "AssumeAdminRoleInMemberAccount"
#         Effect   = "Allow"
#         Action = "sts:AssumeRole"
#         Resource = "arn:aws:iam::${aws_organizations_account.chessclubhost_prod.id}"
#       },
#     ]
#   })
# }

# resource "aws_iam_group" "club_host_dbas" {
#   name = "chess-club-host-database-admins"
#   path = "/clubhost/"
# }

# resource "aws_iam_group" "club_host_readonly" {
#   name = "chess-club-host-readonly"
#   path = "/clubhost/"
# }

# arn:aws:iam::aws:policy/job-function/DatabaseAdministrator

#####################
##     Sandbox     ##
#####################

module "sandbox_admins" {
  source = "../../modules/assume_role_group"
  project_name = "stem_garden"
  access_type = "admins"
  group_members = [
    "nigel-f-wilson",
  ]
  assumable_role_arns = [
    "arn:aws:iam::${module.sandbox_project_accounts.account_ids.main}:role/Admin"
  ]
}

module "sandbox_readers" {
  source = "../../modules/assume_role_group"
  project_name = "stem_garden"
  access_type = "read_only"
  group_members = [
    "nigels-test-user",
    "bruce_lindman"
  ]
  assumable_role_arns = [
    "arn:aws:iam::${module.sandbox_project_accounts.account_ids.main}:role/ReadOnly"
  ]
}


