# Virtual Network aur uske andar Dynamic Subnets
resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnet_cfg
  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  address_space       = each.value.address_space

  # --- DYNAMIC SUBNET BLOCK ---
  dynamic "subnet" {
    for_each = each.value.subnets
    content {
      name             = subnet.value.name
      address_prefixes = [subnet.value.prefix] # Provider v4.x mein 'address_prefixes' (list) use hota hai
    }
  }
}
