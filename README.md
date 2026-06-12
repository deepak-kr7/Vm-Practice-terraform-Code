# Azure Terraform Practice Repository (Vm-Practice-terraform-Code)

This repository contains Terraform configurations for provisioning and managing Azure infrastructure components. It is designed for learning and practicing Infrastructure as Code (IaC) concepts using Terraform and the AzureRM provider.

---

## 🚀 Step-by-Step Deployment Guide (First Run)

Azure mein infrastructure deploy karne ka sahi sequence niche diya gaya hai. Is sequence ko follow karne se **Dependency Errors** nahi aayenge.

### Step 1: Resource Group (`azurerm_resource_group`)
Sabse pehle container banayein jahan baaki sab rahega.
*   **Kyun?** Bina RG ke koi bhi resource nahi ban sakta.
*   **Action:** `cd azurerm_resource_group && terraform apply`

### Step 2: Virtual Network (`azurerm_vnet`)
Base network layout tayyar karein.
*   **Kyun?** Subnets aur baaki networking resources isi ke andar honge.
*   **Action:** `cd ../azurerm_vnet && terraform apply`

### Step 3: Subnet (`azurerm_subnet`)
VNet ke andar logical divisions (subnets) banayein.
*   **Kyun?** NIC aur Bastion ko specific subnets ki zaroorat hoti hai.
*   **Action:** `cd ../azurerm_subnet && terraform apply`

### Step 4: Network Interface (`azurerm_nic`)
VM ke liye Network Interface Card (NIC) banayein.
*   **Kyun?** VM ko network se connect karne ke liye NIC zaroori hai.
*   **Action:** `cd ../azurerm_nic && terraform apply`

### Step 5: Network Security Group (`azurerm_nsg`)
Security rules (Ports 22, 80, 443) define karein.
*   **Kyun?** VM access control ke liye rules pehle se ready hone chahiye.
*   **Action:** `cd ../azurerm_nsg && terraform apply`

### Step 6: Virtual Machine (`azurerm_vm`)
Ab Compute resource (VM) banayein aur use Step 4 (NIC) se connect karein.
*   **Kyun?** Is step par actual server deploy hota hai.
*   **Action:** `cd ../azurerm_vm && terraform apply`

### Step 7: VNet Peering (`azurerm_vnet_peering`)
Agar do alag VNet ke beech private connection chahiye.
*   **Kyun?** Dono VNets ka active hona zaroori hai.
*   **Action:** `cd ../azurerm_vnet_peering && terraform apply`

### Step 8: Bastion Host (`azurerm_bastion`)
Secure access (RDP/SSH) ke liye Bastion set karein.
*   **Kyun?** Iske liye `AzureBastionSubnet` ka hona zaroori hai (Step 3).
*   **Action:** `cd ../azurerm_bastion && terraform apply`

### Step 9: Storage Account (`azurerm_storage_account`)
Data persistence ke liye storage account banayein.
*   **Kyun?** Files aur data save karne ke liye.
*   **Action:** `cd ../azurerm_storage_account && terraform apply`

### Step 10: Storage Container (`azurerm_storage_container`)
Storage account ke andar logical container banayein.
*   **Kyun?** Blobs aur files ko organize karne ke liye. Storage account ka deploy hona zaroori hai.
*   **Action:** `cd ../azurerm_storage_container && terraform apply`

---

## 🛠 Prerequisites & Workflow

### Prerequisites
* **Terraform** installed.
* **Azure CLI** installed.
* An active **Azure Subscription**.

### Workflow
1. **Login:** `az login`
2. **Initialize:** `terraform init` (In each folder)
3. **Plan:** `terraform plan`
4. **Apply:** `terraform apply`

---

## 💡 Pro-Tips
*   **Provider Version:** Sabhi modules mein `azurerm` provider version ko `~> 4.0` kar diya gaya hai taaki 4.x series ke updates automatically mil sakein.
*   **Variables Sync:** Sabhi folders ke `terraform.tfvars` mein Resource Group aur Location match honi chahiye.
*   **Destruction Sequence:** Agar resources delete karne ho, to **Reverse Order** follow karein:
    `Container -> Storage Account -> Bastion -> Peering -> VM -> NSG -> NIC -> Subnet -> VNet -> RG`
*   **Sensitive Data:** `terraform.tfvars` files are now tracked in this repo for practice purposes, but be careful with secrets in production.

---

## 📁 Repository Structure
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
├── azurerm_storage_account/
├── azurerm_storage_container/
└── README.md
```

## 👨‍💻 Author
**Deepak Kumar**
GitHub: [https://github.com/deepak-kr7](https://github.com/deepak-kr7)
