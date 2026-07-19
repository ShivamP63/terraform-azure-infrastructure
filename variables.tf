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

variable "public_ip_name" {
  description = "Name of the public IP address used by the Linux VM"
  type        = string
  default     = "pip-contoso-web-dev"
}

variable "network_interface_name" {
  description = "Name of the network interface used by the Linux VM"
  type        = string
  default     = "nic-contoso-web-dev"
}

variable "linux_vm_name" {
  description = "Name of the Linux virtual machine"
  type        = string
  default     = "vm-contoso-web-dev"
}

variable "linux_vm_size" {
  description = "Azure VM size used by the Linux virtual machine"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "Administrator username for the Linux virtual machine"
  type        = string
  default     = "azureadmin"
}

variable "ssh_public_key_path" {
  description = "Local path to the SSH public key used by the Linux virtual machine"
  type        = string
  default     = "~/.ssh/terraform-azure-infrastructure.pub"
}

variable "allowed_ssh_source_address" {
  description = "Public IPv4 address permitted to connect to the Linux VM using SSH"
  type        = string
}

variable "storage_account_name" {
  description = "Globally unique name of the Azure Storage Account"
  type        = string

  validation {
    condition = (
      length(var.storage_account_name) >= 3 &&
      length(var.storage_account_name) <= 24 &&
      can(regex("^[a-z0-9]+$", var.storage_account_name))
    )
    error_message = "The storage account name must contain 3-24 lowercase letters and numbers only."
  }
}

variable "storage_container_name" {
  description = "Name of the private Blob storage container"
  type        = string
  default     = "application-data"
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace"
  type        = string
  default     = "law-contoso-dev"
}

variable "log_analytics_retention_days" {
  description = "Number of days to retain Log Analytics data"
  type        = number
  default     = 30
}

variable "azure_monitor_agent_name" {
  description = "Name of the Azure Monitor Agent VM extension"
  type        = string
  default     = "AzureMonitorLinuxAgent"
}

variable "data_collection_rule_name" {
  description = "Name of the Azure Monitor Data Collection Rule"
  type        = string
  default     = "dcr-contoso-linux-dev"
}

variable "data_collection_rule_association_name" {
  description = "Name of the association between the VM and the Data Collection Rule"
  type        = string
  default     = "dcra-contoso-linux-dev"
}