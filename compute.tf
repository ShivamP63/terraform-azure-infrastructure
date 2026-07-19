resource "azurerm_public_ip" "web" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  allocation_method = "Static"
  sku               = "Standard"

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = var.owner
    Project     = "Terraform Azure Infrastructure"
  }
}

resource "azurerm_network_interface" "web" {
  name                = var.network_interface_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.web.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.web.id
  }

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = var.owner
    Project     = "Terraform Azure Infrastructure"
  }
}

resource "azurerm_linux_virtual_machine" "web" {
  name                = var.linux_vm_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  size                = var.linux_vm_size
  admin_username      = var.admin_username

  disable_password_authentication = true

  network_interface_ids = [
    azurerm_network_interface.web.id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(pathexpand(var.ssh_public_key_path))
  }

  os_disk {
    name                 = "${var.linux_vm_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  boot_diagnostics {}

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = var.owner
    Project     = "Terraform Azure Infrastructure"
  }
}