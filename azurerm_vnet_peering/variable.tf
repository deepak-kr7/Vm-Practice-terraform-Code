variable "peering" {
  type = map(object({
    vnet1_name = string
    vnet1_rg   = string
    vnet2_name = string
    vnet2_rg   = string
  }))
}
