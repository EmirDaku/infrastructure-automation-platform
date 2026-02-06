data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}
resource "azurerm_virtual_network" "vnet" {
  name                  = var.vnet_name
  address_space         = [var.vnet_address_space]
  location              = data.azurerm_resource_group.rg.location
  resource_group_name   = data.azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                  = var.subnet_name
  resource_group_name   = data.azurerm_resource_group.rg.name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  address_prefixes      = [var.subnet_prefix]
}
resource "azurerm_public_ip" "pip" {
  count                       = var.enable_public_ip ? 1 : 0
  name                        = "${var.vm_name_linux}-pip"
  location                    = data.azurerm_resource_group.rg.location
  resource_group_name         = data.azurerm_resource_group.rg.name
  allocation_method           = "Static"
  sku                         = "Standard"
}
resource "azurerm_network_interface" "nic" {
  name                          = "${var.vm_name_linux}-nic"
  location                       = data.azurerm_resource_group.rg.location
  resource_group_name            = data.azurerm_resource_group.rg.name 

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = var.enable_public_ip ? azurerm_public_ip.pip[0].id : null
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                        = "${var.vm_name_linux}-nsg"
  location                    = data.azurerm_resource_group.rg.location
  resource_group_name         = data.azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "ssh_or_rdp" {
  name                        = var.os_type == "linux" ? "allow-ssh" : "allow-rdp"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = var.os_type == "linux" ? "22" : "3389"
  source_address_prefix       = var.allowed_cidrs
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}
resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id   
}
#infrastrucrure for vm creation os linux


resource "azurerm_linux_virtual_machine" "linux" {
  count = var.os_type == "linux" ? 1 : 0
  name = var.vm_name_linux
  location = data.azurerm_resource_group.rg.location
  resource_group_name   = data.azurerm_resource_group.rg.name
  size = var.vm_size_linux
  admin_username = var.admin_username_linux
  
  disable_password_authentication = true

  network_interface_ids = [azurerm_network_interface.nic.id]

  os_disk {
    name = "${var.vm_name_linux}-osdisk"
    caching = "ReadWrite"
    storage_account_type = var.os_disk_type
    disk_size_gb = var.os_disk_size_gb
  }

  source_image_reference {
    publisher = var.image_linux.publisher
    offer = var.image_linux.offer
    sku = var.image_linux.sku
    version = var.image_linux.version
  }

  admin_ssh_key {
    username = var.admin_username_linux
    public_key = file(var.ssh_public_key)
  }

 boot_diagnostics {  }

}

#infrastrucrure for vm creation os windows




resource "azurerm_windows_virtual_machine" "windows" {
  count = var.os_type == "windows" ? 1 : 0
  name = var.vm_name_windows
  location = data.azurerm_resource_group.rg.location
  resource_group_name   = data.azurerm_resource_group.rg.name
  size = var.vm_size_windows
  admin_username = var.admin_username_windows
  admin_password = var.admin_password_windows

  network_interface_ids = [azurerm_network_interface.nic.id]

  os_disk {
    name = "${var.vm_name_windows}-osdisk"
    caching = "ReadWrite"
    storage_account_type = var.os_disk_type
    disk_size_gb = var.os_disk_size_gb
  }

  source_image_reference {
    publisher = var.image_windows.publisher
    offer = var.image_windows.offer
    sku = var.image_windows.sku
    version = var.image_windows.version
  }

 boot_diagnostics {  }

}
