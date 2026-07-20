resource "azurerm_log_analytics_workspace" "main" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku               = "PerGB2018"
  retention_in_days = var.log_analytics_retention_days

  internet_ingestion_enabled = true
  internet_query_enabled     = true

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "azure_monitor_agent" {
  name                       = var.azure_monitor_agent_name
  virtual_machine_id         = var.linux_vm_id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorLinuxAgent"
  type_handler_version       = "1.42"
  auto_upgrade_minor_version = true
  automatic_upgrade_enabled  = true

  tags = var.tags
}

resource "azurerm_monitor_data_collection_rule" "linux" {
  name                = var.data_collection_rule_name
  resource_group_name = var.resource_group_name
  location            = var.location

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.main.id
      name                  = "log-analytics-destination"
    }
  }

  data_flow {
    streams      = ["Microsoft-Syslog"]
    destinations = ["log-analytics-destination"]
  }

  data_sources {
    syslog {
      name = "linux-syslog"

      facility_names = [
        "auth",
        "authpriv",
        "cron",
        "daemon",
        "kern",
        "syslog",
        "user"
      ]

      log_levels = [
        "Warning",
        "Error",
        "Critical",
        "Alert",
        "Emergency"
      ]

      streams = ["Microsoft-Syslog"]
    }
  }

  tags = var.tags
}

resource "azurerm_monitor_data_collection_rule_association" "linux_vm" {
  name                    = var.data_collection_rule_association_name
  target_resource_id      = var.linux_vm_id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.linux.id
  description             = "Associates the Linux VM with its Syslog data collection rule."

  depends_on = [
    azurerm_virtual_machine_extension.azure_monitor_agent
  ]
}

resource "azurerm_monitor_action_group" "operations" {
  name                = var.action_group_name
  resource_group_name = var.resource_group_name
  short_name          = var.action_group_short_name

  email_receiver {
    name                    = "operations-email"
    email_address           = var.alert_email_address
    use_common_alert_schema = true
  }

  tags = var.tags
}

resource "azurerm_monitor_metric_alert" "vm_cpu" {
  name                = var.cpu_alert_name
  resource_group_name = var.resource_group_name
  scopes              = [var.linux_vm_id]
  description         = "Alert when VM CPU exceeds the configured threshold."

  severity    = 2
  enabled     = true
  frequency   = "PT1M"
  window_size = "PT5M"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.cpu_alert_threshold
  }

  action {
    action_group_id = azurerm_monitor_action_group.operations.id
  }

  tags = var.tags
}
