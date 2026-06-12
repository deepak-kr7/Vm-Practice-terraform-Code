vnet = {
  vn1 = {
    name                = "Vnet_india"
    address_space       = ["10.5.0.0/16"]
    location            = "central india"
    resource_group_name = "Test_dev_rg"
  }
  vn2 = {
    name                = "Vnet_us"
    address_space       = ["10.6.0.0/16"]
    location            = "west us"
    resource_group_name = "Test_dev_rg2"
  }

}
