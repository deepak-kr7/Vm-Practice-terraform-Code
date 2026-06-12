variable "vm" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    nic_name            = string
    vm_size             = string
    admin_username      = string
    admin_password      = string
  }))
}

variable "prefix" {
  type    = string
  default = "test"
}
