locals {
  project_name = "Terraform Azure Infrastructure"
  environment  = "dev"
  owner        = "Shivam Pande"
  managed_by   = "Terraform"

  common_tags = {
    Environment = local.environment
    Project     = local.project_name
    Owner       = local.owner
    ManagedBy   = local.managed_by
  }
}