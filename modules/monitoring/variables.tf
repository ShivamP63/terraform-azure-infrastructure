variable "resource_group_name" {
  description = "Name of the resource group containing the monitoring resources."
  type        = string
}

variable "location" {
  description = "Azure region where monitoring resources are deployed."
  type        = string
}

variable "linux_vm_id" {
  description = "Resource ID of the Linux virtual machine being monitored."
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace."
  type        = string
}

variable "log_analytics_retention_days" {
  description = "Number of days to retain Log Analytics data."
  type        = number
}

variable "azure_monitor_agent_name" {
  description = "Name of the Azure Monitor Agent VM extension."
  type        = string
}

variable "data_collection_rule_name" {
  description = "Name of the Azure Monitor Data Collection Rule."
  type        = string
}

variable "data_collection_rule_association_name" {
  description = "Name of the association between the VM and Data Collection Rule."
  type        = string
}

variable "action_group_name" {
  description = "Name of the Azure Monitor action group."
  type        = string
}

variable "action_group_short_name" {
  description = "Short name used in Azure Monitor notifications."
  type        = string
}

variable "alert_email_address" {
  description = "Email address receiving Azure Monitor alert notifications."
  type        = string
  sensitive   = true
}

variable "cpu_alert_name" {
  description = "Name of the VM CPU metric alert."
  type        = string
}

variable "cpu_alert_threshold" {
  description = "CPU percentage threshold that triggers the metric alert."
  type        = number
}

variable "tags" {
  description = "Tags applied to monitoring resources."
  type        = map(string)
}
