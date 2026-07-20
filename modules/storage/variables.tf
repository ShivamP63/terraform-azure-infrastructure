variable "resource_group_name" {
  description = "Name of the resource group containing the storage resources."
  type        = string
}

variable "location" {
  description = "Azure region where the storage account is deployed."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account."
  type        = string
}

variable "storage_container_name" {
  description = "Name of the private Blob container."
  type        = string
}

variable "tags" {
  description = "Tags applied to storage resources."
  type        = map(string)
}
