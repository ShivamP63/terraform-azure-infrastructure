# Cleanup runbook

## Purpose

Remove the workload safely while preserving the remote backend until the Terraform state is no longer required.

## Pre-checks

```bash
az account show --output table
terraform state list
terraform plan -destroy
```

Confirm that:

- the selected subscription is correct;
- the plan targets only this project;
- no manually created or shared resources are in the workload resource group;
- any required Blob data has been backed up.

## Destroy the workload

```bash
terraform destroy
```

Alternatively, use the guarded helper:

```bash
bash scripts/destroy.sh
```

## Verify

```bash
az group exists --name rg-contoso-terraform-dev
```

The expected value after destruction is `false` if the resource group was fully managed by Terraform.

## Remote backend

Do not delete the state Storage account first. Terraform needs the state to know what to destroy.

After the workload has been destroyed and the state is no longer needed:

1. Download a final copy of the state Blob only if required for records.
2. Confirm no other project uses the backend Storage account.
3. Delete the backend resource group manually or through its separate bootstrap configuration.

```bash
az group delete \
  --name <state-resource-group> \
  --yes \
  --no-wait
```

## Common failure: `MissingSubscription`

Reset the active subscription before retrying:

```bash
az account list --output table
az account set --subscription "<subscription-id>"
az account show --query '{name:name,id:id,tenantId:tenantId}' --output table
```

Then re-run `terraform init` and the destroy plan.
