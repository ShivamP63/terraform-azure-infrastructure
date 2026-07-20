module "monitoring" {
  source = "./modules/monitoring"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  linux_vm_id         = module.compute.linux_vm_id

  log_analytics_workspace_name          = var.log_analytics_workspace_name
  log_analytics_retention_days          = var.log_analytics_retention_days
  azure_monitor_agent_name              = var.azure_monitor_agent_name
  data_collection_rule_name             = var.data_collection_rule_name
  data_collection_rule_association_name = var.data_collection_rule_association_name

  action_group_name       = var.action_group_name
  action_group_short_name = var.action_group_short_name
  alert_email_address     = var.alert_email_address
  cpu_alert_name          = var.cpu_alert_name
  cpu_alert_threshold     = var.cpu_alert_threshold

  tags = local.common_tags
}

moved {
  from = azurerm_log_analytics_workspace.main
  to   = module.monitoring.azurerm_log_analytics_workspace.main
}

moved {
  from = azurerm_virtual_machine_extension.azure_monitor_agent
  to   = module.monitoring.azurerm_virtual_machine_extension.azure_monitor_agent
}

moved {
  from = azurerm_monitor_data_collection_rule.linux
  to   = module.monitoring.azurerm_monitor_data_collection_rule.linux
}

moved {
  from = azurerm_monitor_data_collection_rule_association.linux_vm
  to   = module.monitoring.azurerm_monitor_data_collection_rule_association.linux_vm
}

moved {
  from = azurerm_monitor_action_group.operations
  to   = module.monitoring.azurerm_monitor_action_group.operations
}

moved {
  from = azurerm_monitor_metric_alert.vm_cpu
  to   = module.monitoring.azurerm_monitor_metric_alert.vm_cpu
}
