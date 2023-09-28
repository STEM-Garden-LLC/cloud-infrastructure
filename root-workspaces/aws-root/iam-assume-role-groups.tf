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
}

# WARNING:
# Multiple aws_iam_group_membership resources with the same group name will produce inconsistent behavior!
resource "aws_iam_group_membership" "all_team_members" {
  name = "all-team-members"  
  group = aws_iam_group.all_team_members.name
  # All users seen in iam-users.tf including imported and created
  users = setunion(
    # [ aws_iam_user.nigel_wilson.name ],
    toset([ for profile in module.users : profile.username ])
  )
}


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

module "club_host_all_accountadmins" {
  source = "../../modules/assume_role_group"
  project_name = "chess_club_hosts"
  access_type = "admins"
  group_members = [
    "nigel-f-wilson",
  ]
  assumable_role_arns = [
    "arn:aws:iam::${module.club_host_project_accounts.account_ids.dev}:role/Admin",
    "arn:aws:iam::${module.club_host_project_accounts.account_ids.shared}:role/Admin",
    "arn:aws:iam::${module.club_host_project_accounts.account_ids.production}:role/Admin",
  ]
}

module "club_host_database_administrators" {
  source = "../../modules/assume_role_group"
  project_name = "chess_club_host"
  access_type = "database_administrator"
  group_members = [
    "nigels-test-user",
    "bruce-lindman"
  ]
  assumable_role_arns = [
    "arn:aws:iam::${module.club_host_project_accounts.account_ids.dev}:role/DBA",
    "arn:aws:iam::${module.club_host_project_accounts.account_ids.production}:role/DBA",
  ]
}

module "club_host_readers" {
  source = "../../modules/assume_role_group"
  project_name = "chess_club_host"
  access_type = "all_account_read_only"
  group_members = [
    "nigels-test-user",
    "bruce-lindman"
  ]
  assumable_role_arns = [
    "arn:aws:iam::${module.club_host_project_accounts.account_ids.dev}:role/ReadOnly",
    "arn:aws:iam::${module.club_host_project_accounts.account_ids.shared}:role/ReadOnly",
    "arn:aws:iam::${module.club_host_project_accounts.account_ids.production}:role/ReadOnly"
  ]
}


#####################
##     Sandbox     ##
#####################

module "sandbox_admins" {
  source = "../../modules/assume_role_group"
  project_name = "sandbox"
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
  project_name = "sandbox"
  access_type = "read_only"
  group_members = [
    "nigels-test-user",
    "bruce-lindman"
  ]
  assumable_role_arns = [
    "arn:aws:iam::${module.sandbox_project_accounts.account_ids.main}:role/ReadOnly"
  ]
}


