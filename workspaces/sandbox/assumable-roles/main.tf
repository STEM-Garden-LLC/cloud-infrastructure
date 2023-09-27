module "sandbox_assumable_roles" {
  source = "../../../modules/assumable_roles"


  # These are the same as the default settings
  trusted_account_id = aws_organizations_account.stem_garden_llc.id
  managed_access_policies = [ 
    "AdministratorAccess",
    "ReadOnlyAccess",
    "job-function/Billing",
    "job-function/DatabaseAdministrator",
  ]
}

