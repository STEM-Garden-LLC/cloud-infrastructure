variable "location" {
  type    = string
  default = "Central US"
}

variable "storage_account_name" {
  description = "Name used for the storage account an associated resources."
  type        = string
}

variable "resource_group_name" {
  description = "Optional. If not provided a Resource Group will be created by this module. Do not consume this vlaue directly; instead use `local.resource_group_name`"
  type        = string
  default     = null
}

variable "account_tier" {
  type    = string
  default = "Premium"
}

variable "account_replication_type" {
  description = "https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#account_replication_type"
  type        = string
  default     = "LRS"
}

variable "containers" {
  description = "Specify containers to segment access to data in the storage account."
  type = map(object({
    container_name = string
    access_type    = optional(string, "private")
  }))

  validation {
    condition     = alltrue([for access_type in [for each in var.containers : each.access_type] : contains(["blob", "container", "private"], access_type)])
    error_message = "Invalid access_type. Must be one of 'blob', 'container', or 'private'."
  }
}

