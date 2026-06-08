variable "bastion_cfg" {
  type = map(object({
    name      = string
    rg_name   = string
    location  = string
    vnet_name = string
  }))
}
