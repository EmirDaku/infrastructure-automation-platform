resource_group_name  = "1-c1c082b6-playground-sandbox"
vnet_name            = "iap-vnet"
vnet_address_space   = "10.0.0.0/16"
subnet_name          = "iap-subnet"
subnet_prefix        = "10.0.0.0/24"
vm_name_linux              = "iap-vm"
vm_size_linux              = "Standard_DS1_v2"
allowed_cidrs        = "0.0.0.0/0"
enable_public_ip     = true
admin_username_linux = "azureuser"
os_disk_type         = "Premium_LRS"
os_disk_size_gb      = 30
ssh_public_key = "key-azure/iap_vm_key.pub"



image_linux = {
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-focal"
  sku       = "20_04-lts"
  version   = "latest"
}

# Windows VM variables
vm_name_windows     = "iap-windows-vm"
vm_size_windows = "Standard_DS1_v2"
admin_username_windows = "azureuser"
admin_password_windows = "P@ssw0rd1234!"

image_windows = {
  publisher = "MicrosoftWindowsServer"
  offer     = "WindowsServer"
  sku       = "2019-Datacenter"
  version   = "latest"
}



os_type              = "linux"
