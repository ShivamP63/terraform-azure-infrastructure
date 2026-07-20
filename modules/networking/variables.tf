variable "resource_group_name" {
  description = "Name of the resource group containing the networking resources."
  type        = string
}

variable "location" {
  description = "Azure region where networking resources are deployed."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the Azure virtual network."
  type        = string
}

variable "virtual_network_address_space" {
  description = "Address space assigned to the virtual network."
  type        = list(string)
}

variable "web_subnet_name" {
  description = "Name of the web subnet."
  type        = string
}

variable "web_subnet_address_prefixes" {
  description = "Address prefixes assigned to the web subnet."
  type        = list(string)
}

variable "management_subnet_name" {
  description = "Name of the management subnet."
  type        = string
}

variable "management_subnet_address_prefixes" {
  description = "Address prefixes assigned to the management subnet."
  type        = list(string)
}

variable "network_security_group_name" {
  description = "Name of the network security group associated with the web subnet."
  type        = string
}

variable "allowed_ssh_source_address" {
  description = "IPv4 address or CIDR range permitted to connect using SSH."
  type        = string
}

variable "tags" {
  description = "Tags applied to networking resources."
  type        = map(string)
}