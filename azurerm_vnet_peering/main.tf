data "azurerm_virtual_network" "vnet_src" {
  for_each            = var.peering_cfg
  name                = each.value.vnet_name
  resource_group_name = each.value.rg_name
}

data "azurerm_virtual_network" "vnet_dest" {
  for_each            = var.peering_cfg
  name                = each.value.remote_vnet_name
  resource_group_name = each.value.remote_rg_name
}

resource "azurerm_virtual_network_peering" "peering_src_to_dest" {
  for_each                  = var.peering_cfg
  name                      = "${each.key}-src-to-dest"
  resource_group_name       = each.value.rg_name
  virtual_network_name      = each.value.vnet_name
  remote_virtual_network_id = data.azurerm_virtual_network.vnet_dest[each.key].id
}

resource "azurerm_virtual_network_peering" "peering_dest_to_src" {
  for_each                  = var.peering_cfg
  name                      = "${each.key}-dest-to-src"
  resource_group_name       = each.value.remote_rg_name
  virtual_network_name      = each.value.remote_vnet_name
  remote_virtual_network_id = data.azurerm_virtual_network.vnet_src[each.key].id
}
