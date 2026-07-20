output "linux_vm_id" {
  description = "Resource ID of the Linux virtual machine."
  value       = azurerm_linux_virtual_machine.web.id
}

output "linux_vm_name" {
  description = "Name of the Linux virtual machine."
  value       = azurerm_linux_virtual_machine.web.name
}

output "linux_vm_public_ip" {
  description = "Public IP address of the Linux virtual machine."
  value       = azurerm_public_ip.web.ip_address
}

output "linux_vm_private_ip" {
  description = "Private IP address of the Linux virtual machine."
  value       = azurerm_network_interface.web.private_ip_address
}

output "public_ip_id" {
  description = "Resource ID of the public IP address."
  value       = azurerm_public_ip.web.id
}

output "network_interface_id" {
  description = "Resource ID of the network interface."
  value       = azurerm_network_interface.web.id
}

output "principal_id" {
  description = "Principal ID of the VM system-assigned managed identity."
  value       = azurerm_linux_virtual_machine.web.identity[0].principal_id
}
