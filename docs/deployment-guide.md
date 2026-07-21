# Deployment guide

## 1. Prepare Azure access

```bash
az login
az account list --output table
az account set --subscription "<subscription-id>"
az account show --output table
```

Confirm the displayed tenant and subscription before proceeding.

## 2. Create an SSH key

```bash
ssh-keygen -t ed25519 -f ~/.ssh/terraform-azure-infrastructure
```

Terraform reads the `.pub` file only. Never commit the private key.

## 3. Configure variables

```bash
cp terraform.tfvars.example terraform.tfvars
```

Update the placeholders. The allowed SSH source should be one public IPv4 address in `/32` form whenever possible.

## 4. Initialize the remote backend

The backend Storage account and container must already exist.

```bash
terraform init \
  -backend-config="resource_group_name=<state-resource-group>" \
  -backend-config="storage_account_name=<state-storage-account>" \
  -backend-config="container_name=<state-container>" \
  -backend-config="key=terraform-azure-infrastructure-dev.tfstate"
```

Do not put backend access keys in command history. Azure CLI authentication is preferred.

## 5. Validate

```bash
terraform fmt -check -recursive
terraform validate
terraform plan -out=tfplan
terraform show tfplan
```

Review all additions, changes, and destructions before applying.

## 6. Apply

```bash
terraform apply tfplan
```

## 7. Verify

```bash
terraform output
az resource list --resource-group rg-contoso-terraform-dev --output table
```

Useful checks include:

```bash
az vm extension list \
  --resource-group rg-contoso-terraform-dev \
  --vm-name vm-contoso-web-dev \
  --output table
```

```bash
az monitor data-collection rule association list \
  --resource <vm-resource-id> \
  --output table
```

## 8. Cost control

Stop or deallocate the VM when the environment is not being demonstrated:

```bash
az vm deallocate \
  --resource-group rg-contoso-terraform-dev \
  --name vm-contoso-web-dev
```

Deallocation stops compute charges, but disks, public IPs, Log Analytics ingestion, alerts, and storage may still incur small charges.
