# WARNING:
# Multiple aws_iam_group_membership resources with the same group name will produce inconsistent behavior!

#########################################
##    Read Root & Self Manage Login    ##
#########################################

resource "aws_iam_group_membership" "self_manage_login" {
  name = "users-who-can-self-manage-login" # This will be ALL users so perhaps it makes more sense to create a group that is ALL users and attatch multiple policies including the self manage policy.  

  users = [
    aws_iam_user.user_one.name,
    aws_iam_user.user_two.name,
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group" "self_manage_login" {
  name = "self-manage-login"
  path = "/"
}

resource "aws_iam_group_policy" "self_manage_login_policy" {
  name  = "self_manage_login_policy"
  group = aws_iam_group.self_manage_login.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
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