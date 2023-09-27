######################
##    Input Vars    ##
######################

variable "trusted_account_id" {
  type = string
  description = "ID of the Management Account where IAM Users and Groups are created."
  default = "889823018333"
}

variable "managed_access_roles" {
  type = list(object({ 
    role_name = string,
    policy_arn = string
  }))
  description = "Path and Role names used to generate IAM managed policy assumable roles."
  default = [ 
    {
      role_name = "Admin",
      policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess",
    },
    {
      role_name = "ReadOnly",
      policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess",
    },
    {
      role_name = "Billing",
      policy_arn = "arn:aws:iam::aws:policy/job-function/Billing",
    },
    {
      role_name = "DBA",
      policy_arn = "arn:aws:iam::aws:policy/job-function/DatabaseAdministrator",
    }
  ]
}

##########################
##    Assumable Roles   ##
##########################

resource "aws_iam_role" "assumable_roles" {
  for_each = toset(var.managed_access_roles)

  name = "${each.value.role_name}"
  description = "Role that Users in the Org's management account can assume to manage resources in member account."
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "EnableCrossAccountAssumeRole"
        Effect = "Allow"
        Action = "sts:AssumeRole"
        "Principal": { "AWS": "arn:aws:iam::${var.trusted_account_id}:root" }
      },
    ]
  })
  inline_policy {}
  managed_policy_arns = [ "arn:aws:iam::aws:policy/${each.value.policy_arn}" ]
}

