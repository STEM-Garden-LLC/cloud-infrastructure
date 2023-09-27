######################
##    Input Vars    ##
######################

variable "trusted_account_id" {
  type = string
  description = "ID of the Management Account where IAM Users and Groups are created."
  default = "889823018333"
}

variable "managed_access_policy_arns" {
  type = list(string)
  description = "Path and Role names used to generate IAM managed policy assumable roles."
  default = [ 
    "arn:aws:iam::aws:policy/AdministratorAccess",
    "arn:aws:iam::aws:policy/ReadOnlyAccess",
    "arn:aws:iam::aws:policy/job-function/Billing",
    "arn:aws:iam::aws:policy/job-function/DatabaseAdministrator",
  ]
}

##########################
##    Assumable Roles   ##
##########################

resource "aws_iam_role" "assumable_roles" {
  for_each = toset(var.managed_access_policies)

  name = "${each.value}"
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
  managed_policy_arns = var.managed_access_policy_arns
}

