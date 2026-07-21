#!/usr/bin/env bash
set -euo pipefail

if ! command -v terraform >/dev/null 2>&1; then
  echo "Error: terraform is not installed or not in PATH." >&2
  exit 1
fi

if ! command -v az >/dev/null 2>&1; then
  echo "Error: Azure CLI is not installed or not in PATH." >&2
  exit 1
fi

echo "Active Azure subscription:"
az account show --query '{name:name,id:id,tenantId:tenantId}' --output table

echo
terraform init -input=false
terraform plan -destroy -out=destroy.tfplan

echo
read -r -p "Type DESTROY to apply this destruction plan: " confirmation
if [[ "${confirmation}" != "DESTROY" ]]; then
  echo "Cancelled."
  rm -f destroy.tfplan
  exit 0
fi

terraform apply destroy.tfplan
rm -f destroy.tfplan
