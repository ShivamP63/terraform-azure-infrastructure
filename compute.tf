module "compute" {
  source = "./modules/compute"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  subnet_id           = module.networking.web_subnet_id

  public_ip_name         = var.public_ip_name
  network_interface_name = var.network_interface_name
  linux_vm_name          = var.linux_vm_name
  linux_vm_size          = var.linux_vm_size
  admin_username         = var.admin_username
  ssh_public_key_path    = var.ssh_public_key_path

  tags = local.common_tags
}

moved {
  from = azurerm_public_ip.web
  to   = module.compute.azurerm_public_ip.web
}

moved {
  from = azurerm_network_interface.web
  to   = module.compute.azurerm_network_interface.web
}

moved {
  from = azurerm_linux_virtual_machine.web
  to   = module.compute.azurerm_linux_virtual_machine.web
}
