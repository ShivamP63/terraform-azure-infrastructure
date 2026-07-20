output "virtual_network_id" {
  description = "Resource ID of the virtual network."
  value       = azurerm_virtual_network.main.id
}

output "virtual_network_name" {
  description = "Name of the virtual network."
  value       = azurerm_virtual_network.main.name
}

output "web_subnet_id" {
  description = "Resource ID of the web subnet."
  value       = azurerm_subnet.web.id
}

output "management_subnet_id" {
  description = "Resource ID of the management subnet."
  value       = azurerm_subnet.management.id
}

output "network_security_group_id" {
  description = "Resource ID of the web network security group."
  value       = azurerm_network_security_group.web.id
}