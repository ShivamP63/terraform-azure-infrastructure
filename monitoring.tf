resource "azurerm_log_analytics_workspace" "main" {
  name                = var.log_analytics_workspace_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  sku               = "PerGB2018"
  retention_in_days = var.log_analytics_retention_days

  internet_ingestion_enabled = true
  internet_query_enabled     = true

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = var.owner
    Project     = "Terraform Azure Infrastructure"
  }
}