## Storage Account

This is a minimalist module that creates an Azure Storage Account. Depending on the inputs the module is called with it may also create a resource group and/or containers within the storage account.

### Alternatives Considered

There are two similar modules in the Terraform Cloud Registry that are from community providers: [Avinor](https://registry.terraform.io/modules/avinor/storage-account/azurerm/latest) and [Claranet](https://registry.terraform.io/modules/avinor/storage-account/azurerm/latest). Upon considering these modules, it was determined that they are too heavy for our use case. Rather than depend on a complex community module we are going to create a simpler internal module for this purpose. The burden of maintaining it ourselves will likely be less than that of keeping up with changes to a community module. 

