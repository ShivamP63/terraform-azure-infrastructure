resource "azurerm_log_analytics_workspace" "main" {
  name                = var.log_analytics_workspace_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  sku               = "PerGB2018"
  retention_in_days = var.log_analytics_retention_days

  internet_ingestion_enabled = true
  internet_query_enabled     = true

  tags = local.common_tags
}

resource "azurerm_virtual_machine_extension" "azure_monitor_agent" {
  name                       = var.azure_monitor_agent_name
  virtual_machine_id         = module.compute.linux_vm_id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorLinuxAgent"
  type_handler_version       = "1.42"
  auto_upgrade_minor_version = true
  automatic_upgrade_enabled  = true

  tags = local.common_tags
}

resource "azurerm_monitor_data_collection_rule" "linux" {
  name                = var.data_collection_rule_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

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

  tags = local.common_tags
}

resource "azurerm_monitor_data_collection_rule_association" "linux_vm" {
  name                    = var.data_collection_rule_association_name
  target_resource_id      = module.compute.linux_vm_id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.linux.id
  description             = "Associates the Linux VM with its Syslog data collection rule."

  depends_on = [
    azurerm_virtual_machine_extension.azure_monitor_agent
  ]
}

