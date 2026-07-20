variable "resource_group_name" {
  description = "Name of the resource group containing the compute resources."
  type        = string
}

variable "location" {
  description = "Azure region where compute resources are deployed."
  type        = string
}

variable "subnet_id" {
  description = "Resource ID of the subnet connected to the VM network interface."
  type        = string
}

variable "public_ip_name" {
  description = "Name of the public IP address used by the Linux VM."
  type        = string
}

variable "network_interface_name" {
  description = "Name of the network interface used by the Linux VM."
  type        = string
}

variable "linux_vm_name" {
  description = "Name of the Linux virtual machine."
  type        = string
}

variable "linux_vm_size" {
  description = "Azure VM size used by the Linux virtual machine."
  type        = string
}

variable "admin_username" {
  description = "Administrator username for the Linux virtual machine."
  type        = string
}

variable "ssh_public_key_path" {
  description = "Local path to the SSH public key used by the Linux virtual machine."
  type        = string
}

variable "tags" {
  description = "Tags applied to compute resources."
  type        = map(string)
}
