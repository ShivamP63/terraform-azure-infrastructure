output "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.main.name
}

output "log_analytics_workspace_id" {
  description = "Resource ID of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.main.id
}

output "azure_monitor_agent_extension_name" {
  description = "Name of the Azure Monitor Agent extension."
  value       = azurerm_virtual_machine_extension.azure_monitor_agent.name
}

output "data_collection_rule_name" {
  description = "Name of the Azure Monitor Data Collection Rule."
  value       = azurerm_monitor_data_collection_rule.linux.name
}

output "data_collection_rule_id" {
  description = "Resource ID of the Azure Monitor Data Collection Rule."
  value       = azurerm_monitor_data_collection_rule.linux.id
}

output "data_collection_rule_association_id" {
  description = "Resource ID of the VM Data Collection Rule association."
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
  description = "Name of the VM CPU metric alert."
  value       = azurerm_monitor_metric_alert.vm_cpu.name
}

output "cpu_metric_alert_id" {
  description = "Resource ID of the VM CPU metric alert."
  value       = azurerm_monitor_metric_alert.vm_cpu.id
}
