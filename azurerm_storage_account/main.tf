resource "azurerm_storage_account" "st" {
  for_each                 = var.stg
  name                     = "${each.value.name}${random_string.random1.result}"
  resource_group_name      = each.value.rg_name
  location                 = each.value.location
  account_tier             = each.value.tier
  account_replication_type = each.value.rep_type
}

