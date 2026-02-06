variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}
variable "vnet_address_space" {
  type        = string
  description = "adress of vnet"
}
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}
variable "subnet_prefix" {
  description = "The address prefix for the subnet"
  type        = string
}
variable "vm_name_linux" {
  description = "The name of the Linux virtual machine"
  type        = string
}
variable "allowed_cidrs" {
  description = "The CIDR block allowed to access the VM"
  type        = string
}
variable "enable_public_ip" {
  description = "Whether to create a public IP for the VM"
  type        = bool
}
variable "vm_size_linux" {
  type        = string
  description = "size of vm"
}
variable "admin_username_linux" {
  type        = string
  description = "Admin username for Linux VM" 
}
variable "os_disk_type" {
  type        = string
  description = "types of storage disk"  
}
variable "os_disk_size_gb" {
  type        = number
  description = "size of disk turned in gb" 
}
variable "ssh_public_key" {
  description = "Path to the SSH public key file for Linux VM"
  type        = string
}

variable "image_linux" {
  description = "Parametrat e imazhit Linux për VM"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}
#variables for windows vm
variable "vm_name_windows" {
  description = "The name of the Windows virtual machine"
  type        = string
}
variable "vm_size_windows" {
  type        = string
  description = "size of windows vm"
}
variable "admin_username_windows" {
  type        = string
  description = "Admin username for Windows VM" 
  
}
variable "admin_password_windows" {
  type        = string
  description = "Admin password for Windows VM" 
}
variable "os_type" {
  description = "The operating system type of the virtual machine"
  type        = string
}
variable "image_windows" {
  description = "Parametrat e imazhit Windows për VM"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}
