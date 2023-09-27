variable "management_account_id" {
  type = string
  default = "889823018333"
}

module "sandbox_assumable_roles" {
  source = "../../../modules/assumable_roles"
  # These are the same as the default settings
  trusted_account_id = var.management_account_id
  managed_access_policy_arns = [ 
    "arn:aws:iam::aws:policy/AdministratorAccess",
    "arn:aws:iam::aws:policy/ReadOnlyAccess",
    "arn:aws:iam::aws:policy/job-function/Billing",
    "arn:aws:iam::aws:policy/job-function/DatabaseAdministrator",
  ]
}

