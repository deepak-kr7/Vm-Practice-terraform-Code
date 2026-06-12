vm = {
  vm1 = {
    name                = "test-vm"
    location            = "central india"
    resource_group_name = "Test_dev_rg"
    nic_name            = "nic_1"
    vm_size             = "Standard_D3s_v3"
    admin_username      = "deepakadmin"
    admin_password      = "Admin@123456"
  }
  vm2 = {
    name                = "test-vm2"
    location            = "west us"
    resource_group_name = "Test_dev_rg2"
    nic_name            = "nic_2"
    vm_size             = "Standard_D3s_v3"
    admin_username      = "deepakadmin"
    admin_password      = "Admin@123456"
  }
}

prefix = "test"
