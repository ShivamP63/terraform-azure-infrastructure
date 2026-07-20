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
  value       = module.compute.linux_vm_name
}

output "linux_vm_public_ip" {
  description = "Public IP address of the Linux virtual machine"
  value       = module.compute.linux_vm_public_ip
}

output "linux_vm_private_ip" {
  description = "Private IP address of the Linux virtual machine"
  value       = module.compute.linux_vm_private_ip
}

output "ssh_connection_command" {
  description = "Command used to connect to the Linux virtual machine"
  value       = "ssh -i ~/.ssh/terraform-azure-infrastructure ${var.admin_username}@${module.compute.linux_vm_public_ip}"
}

output "storage_account_name" {
  description = "Name of the Azure Storage Account"
  value       = module.storage.storage_account_name
}

output "storage_container_name" {
  description = "Name of the private Blob container"
  value       = module.storage.storage_container_name
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

output "action_group_name" {
  description = "Name of the Azure Monitor action group."
  value       = azurerm_monitor_action_group.operations.name
}

output "action_group_id" {
  description = "Resource ID of the Azure Monitor action group."
  value       = azurerm_monitor_action_group.operations.id
}

output "cpu_metric_alert_name" {
  value = azurerm_monitor_metric_alert.vm_cpu.name
}

output "cpu_metric_alert_id" {
  value = azurerm_monitor_metric_alert.vm_cpu.id
}

