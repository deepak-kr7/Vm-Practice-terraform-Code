variable "vm_cfg" {
  type = map(object({
    name        = string
    rg_name     = string
    location    = string
    vnet_name   = string
    subnet_name = string
    vm_size     = string
    username    = string
    password    = string
  }))
}
