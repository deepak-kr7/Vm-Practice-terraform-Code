# Vm-Practice-terraform-Code
# Azure Terraform Practice Repository

This repository contains Terraform configurations for provisioning and managing Azure infrastructure components. It is designed for learning and practicing Infrastructure as Code (IaC) concepts using Terraform and the AzureRM provider.

## Resources Covered

The repository includes Terraform code for the following Azure resources:

* Azure Resource Group
* Azure Virtual Network (VNet)
* Azure Network Security Group (NSG)
* Azure Virtual Machine (VM)
* Azure Storage Account
* Azure Bastion Host
* Azure VNet Peering

## Repository Structure

```text
.
├── azurerm_resource_group/
├── azurerm_vnet/
├── azurerm_nsg/
├── azurerm_vm/
├── azurerm_storage_account/
├── azurerm_bastion/
├── azurerm_vnet_peering/
├── peering/
└── README.md
```

Each directory contains a separate Terraform configuration for the corresponding Azure resource.

## Prerequisites

Before using this repository, ensure the following tools are installed:

* Terraform
* Azure CLI
* Azure Subscription

## Azure Authentication

Login to Azure:

```bash
az login
```

Verify the active subscription:

```bash
az account show
```

Set a specific subscription if required:

```bash
az account set --subscription "<subscription-id>"
```

## Terraform Workflow

Navigate to the required resource directory:

```bash
cd azurerm_vnet
```

Initialize Terraform:

```bash
terraform init
```

Validate configuration:

```bash
terraform validate
```

Preview changes:

```bash
terraform plan
```

Create resources:

```bash
terraform apply
```

Destroy resources:

```bash
terraform destroy
```

## Variables

Most modules use a `terraform.tfvars` file for variable values.

Example:

```hcl
location = "Central India"

resource_group_name = "rg-demo"
```

## Learning Objectives

This repository helps in understanding:

* Terraform fundamentals
* Azure resource provisioning
* Variables and outputs
* Data sources
* Resource dependencies
* for_each and dynamic resource creation
* VNet peering configuration
* Infrastructure as Code best practices

## Notes

* Do not commit sensitive information such as passwords, secrets, or service principal credentials.
* Review `.gitignore` before pushing changes.
* Use separate tfvars files for different environments.

## Author

Deepak Kumar

GitHub: https://github.com/deepak-kr7

