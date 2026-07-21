# Release notes — v2.0.0

## Modular Azure Infrastructure

This release marks the completion of the Terraform Azure Infrastructure portfolio project.

### Highlights

- Refactored the original root configuration into networking, compute, storage, and monitoring modules.
- Preserved existing Azure resources with Terraform `moved` blocks.
- Verified every migration with a zero-change Terraform plan.
- Added Azure Blob remote state and state locking.
- Added Azure Monitor Agent, Linux Syslog DCR, Log Analytics, action group, and CPU alerting.
- Centralized tags and added variable validation.
- Added a non-deploying GitHub Actions workflow for formatting and validation.
- Rebuilt project documentation, architecture diagrams, cleanup runbook, interview notes, and redacted screenshot evidence.

### Verification

```text
Plan: 0 to add, 0 to change, 0 to destroy.
```

### Suggested Git tag

```bash
git tag -a v2.0.0 -m "Complete modular Terraform Azure infrastructure"
git push origin v2.0.0
```
