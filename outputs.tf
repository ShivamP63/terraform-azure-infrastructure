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

output "linux_vm_name" {
  description = "Name of the Linux virtual machine"
  value       = azurerm_linux_virtual_machine.web.name
}

output "linux_vm_public_ip" {
  description = "Public IP address of the Linux virtual machine"
  value       = azurerm_public_ip.web.ip_address
}

output "linux_vm_private_ip" {
  description = "Private IP address of the Linux virtual machine"
  value       = azurerm_network_interface.web.private_ip_address
}

output "ssh_connection_command" {
  description = "Command used to connect to the Linux virtual machine"
  value       = "ssh -i ~/.ssh/terraform-azure-infrastructure ${var.admin_username}@${azurerm_public_ip.web.ip_address}"
}