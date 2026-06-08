peerings = {
  east_to_west = {
    name                 = "peering-east-to-west"
    resource_group_name  = "rg-practice1"
    virtual_network_name = "vnet-practice-east"
    remote_vnet_name     = "vnet-practice-west"
    remote_rg_name       = "rg-practice2"
  }
  west_to_east = {
    name                 = "peering-west-to-east"
    resource_group_name  = "rg-practice2"
    virtual_network_name = "vnet-practice-west"
    remote_vnet_name     = "vnet-practice-east"
    remote_rg_name       = "rg-practice1"
  }
}
