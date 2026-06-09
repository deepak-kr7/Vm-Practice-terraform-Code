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
    nsg_name    = string
    
    # Nested Map for Extra Disks
    extra_disks = map(object({
      size_gb = number
      type    = string
    }))

    # Map for Image Details
    image = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}
