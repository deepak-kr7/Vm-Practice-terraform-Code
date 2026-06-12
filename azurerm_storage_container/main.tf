data "azurerm_storage_account" "st" {
  for_each            = var.container
  name                = "${each.value.storage_account_name}08" # Yahan suffix hardcoded hai, ideal approach outputs hota
  resource_group_name = each.value.rg_name
}

resource "azurerm_storage_container" "sc" {
  for_each              = var.container
  name                  = each.value.name
  storage_account_id    = data.azurerm_storage_account.st[each.key].id
  container_access_type = each.value.access_type
}
