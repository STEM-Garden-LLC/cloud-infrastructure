
module "test_storage_account" {
  # It would be good to use a git tag or TFC module directory, 
  # but the local path option is simple and will work for now. 
  source = "../../modules/storage-account/azure"

  resource_group_name = azurerm_resource_group.rg.name
  storage_account_name = var.storage_account_name
  containers = {
    test1 = {
      container_name = "test-container-1"
      access_type    = "blob"
    },
    test2 = {
      container_name = "test-container-2"
    }
  }
}
