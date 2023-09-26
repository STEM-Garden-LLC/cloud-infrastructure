####################
##   Input Vars   ##
####################

variable "project_name" {
  type = string
  description = "An underscore separated string that indicates which Project the Group grants access to."
}

variable "access_type" {
  type = string
  description = "An underscore separated string that indicates the level of access granted by the Role ARNs below."
}

variable "group_members" {
  type = list(string)
  description = "The names of the IAM Users to add to the Group."
}

variable "assumable_role_arns" {
  type = list(string)
  description = "Used to attach one or more Project Account Role to a single Group in the Management Account."
}

locals {
  spaced_project_name = replace(var.project_name, "_", " ")
  one_word_project_name = replace(var.project_name, "_", "")
  group_name = "${var.project_name}_${var.access_type}"
}


#################
##    Group    ##
#################

resource "aws_iam_group" "assume_role_group" {
  name = local.group_name
  path = "/${var.project_name}/"
}

###################
##    Members    ##
###################

resource "aws_iam_group_membership" "assume_role_group" {
  name = "${local.group_name}_members"  
  group = aws_iam_group.assume_role_group.name
  users = toset(var.group_members)
}


##########################
##   Role Attachments   ##
##########################

resource "aws_iam_group_policy" "assume_role_group" {
  for_each = toset(var.assumable_role_arns)

  name = "${local.group_name}_policy"
  group      = aws_iam_group.assume_role_group.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      { 
        Sid = "AssumeRoleInMemberAccount"
        Effect   = "Allow"
        Action = "sts:AssumeRole"
        Resource = "${each.value}"
      },
    ]
  })
}
