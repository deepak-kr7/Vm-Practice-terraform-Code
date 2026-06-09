resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsg_cfg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
}

locals {
  nsg_rules = flatten([
    for nsg_key, nsg in var.nsg_cfg : [
      for rule_key, rule in nsg.rules : {
        nsg_key                    = nsg_key
        nsg_name                   = nsg.name
        rule_key                   = rule_key
        name                       = rule.name
        priority                   = rule.priority
        direction                  = rule.direction
        access                     = rule.access
        protocol                   = rule.protocol
        source_port_range          = rule.source_port_range
        destination_port_range     = rule.destination_port_range
        source_address_prefix      = rule.source_address_prefix
        destination_address_prefix = rule.destination_address_prefix
        rg_name                    = nsg.rg_name
      }
    ]
  ])
}

resource "azurerm_network_security_rule" "rules" {
  for_each                    = { for rule in local.nsg_rules : "${rule.nsg_key}-${rule.rule_key}" => rule }
  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = each.value.rg_name
  network_security_group_name = azurerm_network_security_group.nsg[each.value.nsg_key].name
}
