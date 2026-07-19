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

output "storage_account_name" {
  description = "Name of the Azure Storage Account"
  value       = azurerm_storage_account.main.name
}

output "storage_container_name" {
  description = "Name of the private Blob container"
  value       = azurerm_storage_container.application_data.name
}

output "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace"
  value       = azurerm_log_analytics_workspace.main.name
}

output "log_analytics_workspace_id" {
  description = "Resource ID of the Log Analytics workspace"
  value       = azurerm_log_analytics_workspace.main.id
}

output "azure_monitor_agent_extension_name" {
  description = "Name of the Azure Monitor Agent extension"
  value       = azurerm_virtual_machine_extension.azure_monitor_agent.name
}

output "data_collection_rule_name" {
  description = "Name of the Azure Monitor Data Collection Rule"
  value       = azurerm_monitor_data_collection_rule.linux.name
}

output "data_collection_rule_id" {
  description = "Resource ID of the Azure Monitor Data Collection Rule"
  value       = azurerm_monitor_data_collection_rule.linux.id
}

output "data_collection_rule_association_id" {
  description = "Resource ID of the VM Data Collection Rule association"
  value       = azurerm_monitor_data_collection_rule_association.linux_vm.id
}

