output "storage_account_id" {
  description = "Resource ID of the Azure Storage Account."
  value       = azurerm_storage_account.main.id
}

output "storage_account_name" {
  description = "Name of the Azure Storage Account."
  value       = azurerm_storage_account.main.name
}

output "storage_container_name" {
  description = "Name of the private Blob container."
  value       = azurerm_storage_container.application_data.name
}
