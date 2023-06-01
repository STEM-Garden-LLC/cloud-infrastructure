resource "azurerm_resource_group" "resource_group" {
  count    = local.create_resource_group ? 1 : 0
  name     = local.resource_group_name
  location = var.location
}
