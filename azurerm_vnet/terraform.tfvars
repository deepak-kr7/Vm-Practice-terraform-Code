vnet_cfg = {
  "vnet1" = { 
    name          = "vnet-practice-east"
    rg_name       = "rg-practice1"
    location      = "East US"
    address_space = ["10.1.0.0/16"]
    
    subnets = {
      "s1" = { 
        name = "frontend"
        prefix = "10.1.1.0/24" 
        }
      "s2" = { 
        name = "backend"
        prefix = "10.1.2.0/24" }
    }
  }

  "vnet2" = { 
    name          = "vnet-practice-west"
    rg_name       = "rg-practice2"
    location      = "West US"
    address_space = ["10.2.0.0/16"]
   
    subnets = {
      "s1" = { 
        name = "Frontend1",   
         prefix = "10.2.1.0/24" 
         }
      "s2" = { 
        name = "backend1",   
         prefix = "10.2.2.0/24" 
         }
    }
  }
}
