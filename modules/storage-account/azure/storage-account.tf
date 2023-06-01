resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = local.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_storage_container" "storage_containers" {
  for_each = var.containers

  name                  = each.value.container_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = each.value.access_type
}

