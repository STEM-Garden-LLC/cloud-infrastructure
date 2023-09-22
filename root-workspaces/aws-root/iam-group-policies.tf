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




resource "aws_iam_group" "sgllc_root_readonly" {
  name = "sgllc-root-readonly"
  path = "/"
}




resource "aws_iam_group" "self_manage_login" {
  name = "self-manage-login"
  path = "/"
}

resource "aws_iam_group" "sgllc_root_readonly" {
  name = "sgllc-root-readonly"
  path = "/"
}


############################
##  STEM Garden Homepage  ##
############################

resource "aws_iam_group" "stem_garden_admins" {
  name = "stem-garden-admins"
  path = "/"
}


####################
##  Mastery Math  ##
####################

resource "aws_iam_group" "mastery_math" {
  name = "mastery-math"
  path = "/"
}

resource "aws_iam_group" "mastery_math_admins" {
  name = "mastery-math-admins"
  path = "/mastery-math"
}

resource "aws_iam_group" "mastery_math_devs" {
  name = "mastery-math-devs"
  path = "/mastery-math"
}


#########################
##  Club Hosting Tool  ##
#########################

resource "aws_iam_group" "chessclubhost" {
  name = "chess-club-host-admins"
  path = "/"
}