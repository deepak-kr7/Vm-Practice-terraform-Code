data "azurerm_subnet" "sb" {
  for_each             = var.nic
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
}

resource "azurerm_network_interface" "main" {
  for_each            = var.nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = data.azurerm_subnet.sb[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
