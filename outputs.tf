output "resource_group_name" {
  description = "Name of the deployed Azure resource group."
  value       = azurerm_resource_group.main.name
}

output "resource_group_location" {
  description = "Azure region of the deployed resource group."
  value       = azurerm_resource_group.main.location
}

output "resource_group_id" {
  description = "Azure resource ID of the deployed resource group."
  value       = azurerm_resource_group.main.id
}