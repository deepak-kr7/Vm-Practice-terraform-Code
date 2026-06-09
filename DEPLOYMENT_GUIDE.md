# Azure Infrastructure Deployment Guide (Step-by-Step)

Azure mein infrastructure deploy karne ka sahi sequence niche diya gaya hai. Is sequence ko follow karne se "Dependency Errors" nahi aayenge.

---

### Step 1: Resource Group (`azurerm_resource_group`)
Sabse pehle container banayein jahan baaki sab rahega.
*   **Kyun?** Bina RG ke koi bhi resource nahi ban sakta.
*   **Folder:** `azurerm_resource_group/`

### Step 2: Virtual Network (`azurerm_vnet`)
Network layout aur subnets define karein.
*   **Kyun?** VM aur Bastion ko IP addresses isi network se milenge.
*   **Folder:** `azurerm_vnet/`

### Step 3: Network Security Group (`azurerm_nsg`)
Security rules (Ports 22, 80, 443) tayyar karein.
*   **Kyun?** VM banne se pehle security rules ready hone chahiye taaki bante hi rules apply ho sakein.
*   **Folder:** `azurerm_nsg/`

### Step 4: Storage Account (`azurerm_storage_account`) - *Optional*
Agar Boot Diagnostics ya scripts store karni hain.
*   **Folder:** `azurerm_storage_account/`

### Step 5: Virtual Machine (`azurerm_vm`)
Ab VM banayein aur use Step 2 (Subnet) aur Step 3 (NSG) se connect karein.
*   **Kyun?** Is step par VM ko NIC, Public IP, aur NSG Association milta hai.
*   **Folder:** `azurerm_vm/`

### Step 6: VNet Peering (`azurerm_vnet_peering`)
Agar do alag VNet ke beech connection chahiye.
*   **Kyun?** Dono VNet ka pehle se bana hona zaroori hai.
*   **Folder:** `azurerm_vnet_peering/` ya `peering/`

### Step 7: Bastion Host (`azurerm_bastion`)
Secure access ke liye Bastion set karein.
*   **Kyun?** Bastion ke liye ek khaas subnet (`AzureBastionSubnet`) chahiye hota hai jo Step 2 mein banta hai.
*   **Folder:** `azurerm_bastion/`

---

## Pro-Tips for Next Time:
1.  **Variables Sync:** Hamesha check karein ki `azurerm_vm` ke `terraform.tfvars` mein wahi RG aur VNet ka naam ho jo aapne Step 1 aur 2 mein banaya hai.
2.  **NSG Association:** VM banate waqt use Subnet level par associate karna portal visibility ke liye best rehta hai.
3.  **Destruction Sequence:** Agar delete karna ho, to hamesha **Ulta (Reverse)** chalein:
    `Bastion -> Peering -> VM -> NSG -> VNet -> RG`
