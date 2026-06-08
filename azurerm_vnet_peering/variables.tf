variable "peering_cfg" {
  type = map(object({
    rg_name          = string
    vnet_name        = string
    remote_rg_name   = string
    remote_vnet_name = string
  }))
}
