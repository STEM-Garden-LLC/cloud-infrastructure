variable "management_account_id" {
  type = string
  default = "889823018333"
}

module "sandbox_assumable_roles" {
  source = "../../../modules/assumable_roles"

  # These are the same as the default settings
  trusted_account_id = var.trusted_account_id
  managed_access_policies = [ 
    "AdministratorAccess",
    "ReadOnlyAccess",
    "job-function/Billing",
    "job-function/DatabaseAdministrator",
  ]
}

