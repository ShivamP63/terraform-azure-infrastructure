module "storage" {
  source = "./modules/storage"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name

  tags = local.common_tags
}

moved {
  from = azurerm_storage_account.main
  to   = module.storage.azurerm_storage_account.main
}

moved {
  from = azurerm_storage_container.application_data
  to   = module.storage.azurerm_storage_container.application_data
}
