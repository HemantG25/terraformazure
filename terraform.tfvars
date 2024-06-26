resource_group_name = "vmcreation"
location            = "eastus"
vnet_name           = "vmvnet"
vnet_space          = [ "10.0.0.0/16" ]
subnet              = "subnet"
subnet_space        = [ "10.0.2.0/24" ]
vm_name             = "bsltest"
dynamic             = "Dynamic"
vm_size             = "Standard_DS1_v2"
true                = "true"
publisher           = "Canonical"
offer               = "0001-com-ubuntu-server-jammy"
sku                 = "22_04-lts"
caching             = "ReadWrite"
create_option       = "FromImage"
managed_disk_type   = "Standard_LRS"
admin_username      = "testadmin"
admin_password      = "Password1234!"