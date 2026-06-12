nic = {
  nc1 = {
    name                = "nic_1"
    location            = "central india"
    resource_group_name = "Test_dev_rg"
    vnet_name           = "Vnet_india"
    subnet_name         = "frontsub_india"
  }
  nc2 = {
    name                = "nic_2"
    location            = "west us"
    resource_group_name = "Test_dev_rg2"
    vnet_name           = "Vnet_us"
    subnet_name         = "frontsub_india1"
  }
}
