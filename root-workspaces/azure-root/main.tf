# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
}

module "test_storage_account" {
  # It would be good to use a git tag or TFC module directory, 
  # but the local path option is simple and will work for now. 
  source = "../../modules/storage-account/azure"

  storage_account_name = "teststorageaccount"
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
