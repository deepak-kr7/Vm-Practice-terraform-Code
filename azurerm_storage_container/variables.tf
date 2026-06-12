variable "container" {
  type = map(object({
    name                 = string
    storage_account_name = string
    rg_name              = string
    access_type          = string
  }))
}
