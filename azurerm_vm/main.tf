data "azurerm_subnet" "sb" {
  for_each             = var.vm_cfg
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_network_security_group" "nsg" {
  for_each            = var.vm_cfg
  name                = each.value.nsg_name
  resource_group_name = each.value.rg_name
}

resource "azurerm_public_ip" "pip" {
  for_each            = var.vm_cfg
  name                = "pip-${each.value.name}"
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "nic" {
  for_each            = var.vm_cfg
  name                = "nic-${each.value.name}"
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.sb[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  for_each                  = var.vm_cfg
  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}

resource "azurerm_subnet_network_security_group_association" "sb_nsg" {
  for_each                  = var.vm_cfg
  subnet_id                 = data.azurerm_subnet.sb[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = var.vm_cfg
  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.vm_size
  admin_username      = each.value.username
  admin_password      = each.value.password
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.image.publisher
    offer     = each.value.image.offer
    sku       = each.value.image.sku
    version   = each.value.image.version
  }
}

# --- NESTED DISK LOGIC ---
locals {
  disk_list = flatten([
    for vm_key, vm in var.vm_cfg : [
      for disk_key, disk in vm.extra_disks : {
        vm_key   = vm_key
        disk_key = disk_key
        name     = "${vm.name}-${disk_key}"
        size     = disk.size_gb
        type     = disk.type
        rg       = vm.rg_name
        loc      = vm.location
      }
    ]
  ])
}

resource "azurerm_managed_disk" "extra" {
  for_each             = { for d in local.disk_list : "${d.vm_key}-${d.disk_key}" => d }
  name                 = each.value.name
  location             = each.value.loc
  resource_group_name  = each.value.rg
  storage_account_type = each.value.type
  create_option        = "Empty"
  disk_size_gb         = each.value.size
}

resource "azurerm_virtual_machine_data_disk_attachment" "attach" {
  for_each           = { for d in local.disk_list : "${d.vm_key}-${d.disk_key}" => d }
  managed_disk_id    = azurerm_managed_disk.extra[each.key].id
  virtual_machine_id = azurerm_linux_virtual_machine.vm[each.value.vm_key].id
  lun                = 10 + index(local.disk_list, each.value) # Simple LUN generator
  caching            = "ReadWrite"
}
