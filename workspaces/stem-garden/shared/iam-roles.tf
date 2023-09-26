module "stem_garden_assumable_roles" {
  source = "../../../assumable_roles"

  managed_access_policy_names = [
    "AdministratorAccess",
    "DatabaseAdministrator",
    "ReadOnlyAccess",
    "Billing"
  ]
}