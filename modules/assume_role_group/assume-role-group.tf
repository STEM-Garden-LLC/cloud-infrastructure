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

# There are a lot of unanticipated modify in place changes showing up in plans that switch around the account numbers.
# Though harmless, they clutter up the plan output making it harder to verify intended changes.
# I think this is due to the fact this var gets converted to a Set and used with a for_each, thus not preserving order. 
# I should be able to resolve this by converting this var from a list to a map and converting the for each to use a Map instead of a Set.
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

#   # Change this to use a Map

