module "sandbox_assumable_roles" {
  source = "../../../modules/assumable-roles"
  # This module is designed to usually use the default settings.
  # To create additional roles, first copy all the default .

}

output "role_arns" {
  value = module.sandbox_assumable_roles.role_arns
}