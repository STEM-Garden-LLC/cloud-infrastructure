# The storage_account resource must be placed in a resource group. 
# resource_group_name is therefore a required input to the storage_account resource.
# This module accepts resource_group_name as an optional input.
# In case you wish to use this module to create a storage account within a prexisting resource group provide its name as an input. 
# If resource_group_name is not provided, a resource_group resource will be created with a name based on the required input storage_account_name.

# BEWARE: If you use an external resource group, deleting that resource group will also delete resources nested within it, such as a storage account created by this module.

locals {
  create_resource_group = var.resource_group_name == null ? true : false
  resource_group_name   = coalesce(var.resource_group_name, "rg-${var.storage_account_name}")

}
