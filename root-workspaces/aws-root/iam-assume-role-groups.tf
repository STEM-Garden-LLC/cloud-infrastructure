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

resource "aws_iam_group_policy_attachment" "management_account_read_only" {
  group      = aws_iam_group.all_team_members.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
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




############################
##  STEM Garden Homepage  ##
############################

module "stem_garden_all_account_admins" {
  source = "../../modules/assume-role-group"
  project_name = "stem_garden"
  access_type = "all_account_admins"
  group_members = [
    "nigel-f-wilson",
  ]
  assumable_role_arns = [
    "arn:aws:iam::${module.stem_garden_project_accounts.account_ids.dev}:role/Admin",
    "arn:aws:iam::${module.stem_garden_project_accounts.account_ids.prod}:role/Admin",
    "arn:aws:iam::${module.stem_garden_project_accounts.account_ids.shared}:role/Admin",

  ]
}


####################
##  Mastery Math  ##
####################

module "mastery_math_all_account_admins" {
  source = "../../modules/assume-role-group"
  project_name = "mastery_math"
  access_type = "all_account_admins"
  group_members = [
    "nigel-f-wilson",
  ]
  assumable_role_arns = [
    "arn:aws:iam::${module.mastery_math_project_accounts.account_ids.dev}:role/Admin",
    "arn:aws:iam::${module.mastery_math_project_accounts.account_ids.prod}:role/Admin",
    "arn:aws:iam::${module.mastery_math_project_accounts.account_ids.shared}:role/Admin",
  ]
}



#########################
##  Club Hosting Tool  ##
#########################

module "club_host_all_account_admins" {
  source = "../../modules/assume-role-group"
  project_name = "chess_club_host"
  access_type = "all_account_admins"
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
  source = "../../modules/assume-role-group"
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
  source = "../../modules/assume-role-group"
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
  source = "../../modules/assume-role-group"
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
  source = "../../modules/assume-role-group"
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


