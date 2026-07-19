variable "subscription_id" {
  description = "Azure subscription ID used for deployment."
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Name of the Azure resource group."
  type        = string
  default     = "rg-contoso-terraform-dev"
}

variable "location" {
  description = "Azure region where resources will be deployed."
  type        = string
  default     = "Canada Central"
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be dev, test, or prod."
  }
}

variable "owner" {
  description = "Owner tag applied to Azure resources."
  type        = string
  default     = "Shivam Pande"
}

variable "virtual_network_name" {
  description = "Name of the Azure virtual network"
  type        = string
  default     = "vnet-contoso-dev"
}

variable "virtual_network_address_space" {
  description = "Address space used by the virtual network"
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "web_subnet_name" {
  description = "Name of the web subnet"
  type        = string
  default     = "snet-web"
}

variable "web_subnet_address_prefixes" {
  description = "Address prefixes used by the web subnet"
  type        = list(string)
  default     = ["10.10.1.0/24"]
}

variable "management_subnet_name" {
  description = "Name of the management subnet"
  type        = string
  default     = "snet-management"
}

variable "management_subnet_address_prefixes" {
  description = "Address prefixes used by the management subnet"
  type        = list(string)
  default     = ["10.10.2.0/24"]
}

variable "network_security_group_name" {
  description = "Name of the network security group"
  type        = string
  default     = "nsg-contoso-web-dev"
}