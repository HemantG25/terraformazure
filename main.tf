
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_space
  resource_group_name  = var.resource_group_name
}

resource "azurerm_network_interface" "nic" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  ip_configuration {
    name                          = var.vm_name
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.dynamic
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                             = var.vm_name
  resource_group_name              = azurerm_resource_group.rg.name
  location                         = azurerm_resource_group.rg.location
  network_interface_ids            = [azurerm_network_interface.nic.id]
  vm_size                          = var.vm_size
  delete_data_disks_on_termination = var.true
  delete_os_disk_on_termination    = var.true

  storage_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = "latest"
  }

  storage_os_disk {
    name              = var.vm_name
    caching           = var.caching
    create_option     = var.create_option
    managed_disk_type = var.managed_disk_type
  }
  os_profile {
    computer_name  = var.vm_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
}