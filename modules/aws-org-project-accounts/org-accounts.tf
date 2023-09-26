####################
##   Input Vars   ##
####################

variable "project_name" {
  type = string
  description = "Name to be used for Organizational Unit and as first part of Account names. Underscore delimited, use replace() to get space delimited or one word formats."
}

variable "account_name_suffix_list" {
  type = list(string)
  description = "Second part of Account names, used to distinguish different environments. Corresponds with workspcace list in module.tfc-project-with-workspaces"
}

variable "org_root_ou" {
  type = string
  default = "r-p2mx"
}


locals {
  spaced_project_name = replace(var.project_name, "_", " ")
  one_word_project_name = replace(var.project_name, "_", "")
}


#####################
##    Resources    ##
#####################

resource "aws_organizations_organizational_unit" "ou" {
  name      = title(local.spaced_project_name)
  parent_id = var.org_root_ou 
}

resource "aws_organizations_account" "accounts" {
  for_each = toset(var.account_name_suffix_list)

  name                       = title("${local.spaced_project_name} ${each.value}")
  email                      = "${local.one_word_project_name}+${each.value}@stemgarden.org"
  parent_id                  = aws_organizations_organizational_unit.ou.id
  close_on_deletion          = null
  create_govcloud            = null
  iam_user_access_to_billing = null
  role_name                  = null
}

