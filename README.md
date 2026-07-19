# Terraform Azure Infrastructure

A portfolio project demonstrating Infrastructure as Code (IaC) on Microsoft Azure using Terraform.

## Business Scenario

Contoso Ltd. wants to deploy its Azure infrastructure consistently and repeatedly using Terraform instead of manually creating resources through the Azure Portal.

This project demonstrates how Terraform can provision and manage Azure infrastructure following Infrastructure as Code best practices.

---

## Current Project Status

### Completed

- Terraform installed and configured
- AzureRM provider configured
- Azure CLI authentication
- Input variables created
- Output values configured
- Azure Resource Group deployed
- Resource tagging implemented

### In Progress

- Virtual Network
- Subnets
- Network Security Groups
- Linux Virtual Machine
- Storage Account
- Log Analytics Workspace

---

## Current Architecture

```text
Azure Subscription
│
└── Resource Group
    └── rg-contoso-terraform-dev
```

---

## Technologies Used

- Microsoft Azure
- Terraform
- AzureRM Provider
- Azure CLI
- Git
- GitHub

---

## Terraform Workflow

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

To remove all Terraform-managed resources:

```bash
terraform destroy
```

---

## Resource Tags

| Tag | Value |
|------|-------|
| Environment | dev |
| ManagedBy | Terraform |
| Owner | Shivam Pande |
| Project | Terraform Azure Infrastructure |

---

## Repository Structure

```text
terraform-azure-infrastructure/
│
├── .github/
├── docs/
├── environments/
├── modules/
├── scripts/
├── README.md
├── versions.tf
├── providers.tf
├── variables.tf
├── main.tf
├── outputs.tf
└── terraform.tfvars.example
```

---

## Security

The following files are excluded from version control:

- terraform.tfvars
- terraform.tfstate
- terraform.tfstate.backup
- .terraform/

This helps prevent sensitive or environment-specific information from being committed to GitHub.

---

## Future Enhancements

- Deploy Virtual Network
- Deploy Subnets
- Configure Network Security Groups
- Deploy Linux Virtual Machine
- Configure Storage Account
- Configure Log Analytics Workspace
- Implement Terraform Modules
- Configure Remote State
- Add GitHub Actions for Terraform validation