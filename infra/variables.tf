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
variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}
variable "os_type" {
  description = "The operating system type of the virtual machine"
  type        = string
}
variable "allowed_cidrs" {
  description = "The allowed CIDR blocks for the network security group"
  type        = list(string)
}