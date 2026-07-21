locals {
  project_name = "Terraform Azure Infrastructure"
  managed_by   = "Terraform"

  common_tags = {
    Environment = var.environment
    Project     = local.project_name
    Owner       = var.owner
    ManagedBy   = local.managed_by
  }
}
