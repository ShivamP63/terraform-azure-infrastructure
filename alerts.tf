resource "azurerm_monitor_action_group" "operations" {
  name                = var.action_group_name
  resource_group_name = azurerm_resource_group.main.name
  short_name          = var.action_group_short_name

  email_receiver {
    name                    = "operations-email"
    email_address           = var.alert_email_address
    use_common_alert_schema = true
  }

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Owner       = "Shivam Pande"
    Project     = "Terraform Azure Infrastructure"
  }
}

resource "azurerm_monitor_metric_alert" "vm_cpu" {
  name                = var.cpu_alert_name
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [module.compute.linux_vm_id]
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

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Owner       = "Shivam Pande"
    Project     = "Terraform Azure Infrastructure"
  }
}