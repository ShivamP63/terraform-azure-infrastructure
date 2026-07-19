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