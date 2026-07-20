module "networking" {
  source = "./modules/networking"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  virtual_network_name          = var.virtual_network_name
  virtual_network_address_space = var.virtual_network_address_space

  web_subnet_name             = var.web_subnet_name
  web_subnet_address_prefixes = var.web_subnet_address_prefixes

  management_subnet_name             = var.management_subnet_name
  management_subnet_address_prefixes = var.management_subnet_address_prefixes

  network_security_group_name = var.network_security_group_name
  allowed_ssh_source_address  = var.allowed_ssh_source_address

  tags = local.common_tags
}

moved {
  from = azurerm_virtual_network.main
  to   = module.networking.azurerm_virtual_network.main
}

moved {
  from = azurerm_subnet.web
  to   = module.networking.azurerm_subnet.web
}

moved {
  from = azurerm_subnet.management
  to   = module.networking.azurerm_subnet.management
}

moved {
  from = azurerm_network_security_group.web
  to   = module.networking.azurerm_network_security_group.web
}

moved {
  from = azurerm_subnet_network_security_group_association.web
  to   = module.networking.azurerm_subnet_network_security_group_association.web
}