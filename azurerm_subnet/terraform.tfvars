subnet = {
  sub1 = {
    name                 = "frontsub_india"
    resource_group_name  = "Test_dev_rg"
    virtual_network_name = "Vnet_india"
    address_prefixes     = ["10.5.1.0/24"]
  }
  sub2 = {
    name                 = "backen_india"
    resource_group_name  = "Test_dev_rg"
    virtual_network_name = "Vnet_india"
    address_prefixes     = ["10.5.2.0/24"]
  }
  sub3 = {
    name                 = "frontsub_india1"
    resource_group_name  = "Test_dev_rg2"
    virtual_network_name = "Vnet_us"
    address_prefixes     = ["10.6.1.0/24"]
  }
  sub4 = {
    name                 = "backen_india1"
    resource_group_name  = "Test_dev_rg2"
    virtual_network_name = "Vnet_us"
    address_prefixes     = ["10.6.2.0/24"]
  }
  bastion_sub = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "Test_dev_rg"
    virtual_network_name = "Vnet_india"
    address_prefixes     = ["10.5.10.0/24"]
  }
}
