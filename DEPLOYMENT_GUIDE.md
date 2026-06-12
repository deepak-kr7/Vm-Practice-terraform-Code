# Vm-Practice-terraform-Code
# Azure Terraform Practice Repository

This repository contains Terraform configurations for provisioning and managing Azure infrastructure components. It is designed for learning and practicing Infrastructure as Code (IaC) concepts using Terraform and the AzureRM provider.

## 🚀 Recommended Deployment Sequence

To avoid dependency errors, follow this order for the first run:

1.  **Resource Group** (`azurerm_resource_group`)
2.  **Virtual Network** (`azurerm_vnet`)
3.  **Subnet** (`azurerm_subnet`)
4.  **Network Interface** (`azurerm_nic`)
5.  **Network Security Group** (`azurerm_nsg`)
6.  **Virtual Machine** (`azurerm_vm`)
7.  **VNet Peering** (`azurerm_vnet_peering`)
8.  **Bastion Host** (`azurerm_bastion`)

For detailed steps, refer to the [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md).

## Resources Covered

* Azure Resource Group
* Azure Virtual Network (VNet) & Subnets
* Azure Network Interface (NIC)
* Azure Network Security Group (NSG)
* Azure Virtual Machine (VM)
* Azure Bastion Host
* Azure VNet Peering

## Repository Structure

```text
.
├── azurerm_resource_group/
├── azurerm_vnet/
├── azurerm_subnet/
├── azurerm_nic/
├── azurerm_nsg/
├── azurerm_vm/
├── azurerm_vnet_peering/
├── azurerm_bastion/
└── README.md
```

## Prerequisites

* Terraform
* Azure CLI
* Azure Subscription

## Quick Start

1. Login to Azure: `az login`
2. Navigate to a resource folder: `cd azurerm_resource_group`
3. Initialize: `terraform init`
4. Apply: `terraform apply`

## Author

Deepak Kumar
GitHub: [https://github.com/deepak-kr7](https://github.com/deepak-kr7)
e access (RDP/SSH) ke liye Bastion set karein.
*   **Kyun?** Iske liye `AzureBastionSubnet` ka hona zaroori hai (Step 3).
*   **Folder:** `azurerm_bastion/`

---

## Pro-Tips:
1.  **Variables Sync:** Sabhi folders ke `terraform.tfvars` mein Resource Group aur Location match honi chahiye.
2.  **Destruction Sequence:** Agar resources delete karne ho, to **Reverse Order** follow karein:
    `Bastion -> Peering -> VM -> NSG -> NIC -> Subnet -> VNet -> RG`
