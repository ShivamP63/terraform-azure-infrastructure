# Interview notes

## 60-second project explanation

“I built a small Azure environment entirely with Terraform. It includes segmented networking, a Linux VM with SSH-key authentication and managed identity, private Blob storage, and Azure Monitor integration using AMA, a Data Collection Rule, Log Analytics, an action group, and a CPU alert. I migrated Terraform state to an Azure Blob backend and then refactored the original flat configuration into four reusable modules. I used Terraform moved blocks and validated each migration with a zero-change plan so no live resources were recreated.”

## Design decisions to explain

- **Why modules?** To separate responsibilities and make the configuration easier to test, understand, and reuse.
- **Why a separate state resource group?** The backend must survive workload destruction and should have a different lifecycle.
- **Why `moved` blocks?** They update Terraform resource addresses safely without import commands or resource replacement.
- **Why a DCR?** AMA requires an explicit rule describing which data to collect and where to send it.
- **Why restrict SSH?** Port 22 is limited to a supplied administrator CIDR instead of the entire Internet.
- **Why keep a public IP at all?** It provides an easy portfolio demonstration path; production would use private administration.

## Likely questions

### What happens if two people run Terraform simultaneously?

The Azure Blob backend uses a lease to lock the state. A second operation cannot acquire the lock until the first releases it.

### How did you prevent the module refactor from recreating resources?

Each existing root resource was mapped to its new child-module address with a `moved` block. I refactored one area at a time and required a plan of zero changes before committing.

### How are modules connected?

The networking module exports the web subnet ID to compute. Compute exports the VM ID to monitoring. The root module owns orchestration and shared tags.

### What would you improve for production?

Private connectivity, Bastion or VPN access, workload identity for CI, Azure Policy, Defender for Cloud, stronger storage network restrictions, backup, patch management, multiple environments, and a formal bootstrap configuration for the backend.

### Why is a metric alert separate from Log Analytics?

Percentage CPU is an Azure platform metric and can be evaluated directly by Azure Monitor. Syslog collection follows the AMA/DCR/Log Analytics path.

## Evidence to reference

- Clean Terraform plan: `docs/screenshots/04-terraform-plan-clean.png`
- Remote state: `docs/screenshots/05-remote-state-blob.png`
- Module structure: `docs/screenshots/02-module-structure.png`
- Monitoring chain: screenshots 10 through 15
