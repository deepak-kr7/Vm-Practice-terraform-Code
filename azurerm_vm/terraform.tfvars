vm_cfg = {
  vm1 = {
    name        = "vm-frontend-east"
    rg_name     = "rg-practice1"
    location    = "central india"
    vnet_name   = "vnet-practice-east"
    subnet_name = "frontend"
    vm_size     = "Standard_D2s_v3"
    username    = "azureuser"
    password    = "Admin@123456!"
    nsg_name    = "nsg-frontend"

    extra_disks = {
      disk1 = { size_gb = 10, type = "Standard_LRS" }
    }

    image = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }

  vm2 = {
    name        = "vm-frontend-west"
    rg_name     = "rg-practice2"
    location    = "austriaeast"
    vnet_name   = "vnet-practice-west"
    subnet_name = "Frontend1"
    vm_size     = "Standard_D2s_v3"
    username    = "azureuser"
    password    = "Admin@123456!"
    nsg_name    = "nsg-frontend-west" # Make sure this NSG exists in rg-practice2

    extra_disks = {} # West VM ke liye extra disk nahi chahiye (example)

    image = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}
