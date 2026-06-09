stg = {
  stg1 = { 
    name = "newstg22"
    rg_name = "rg-practice1"
    location = "East US"
    tier = "Standard"
    rep_type = "LRS"
     }
  stg2 = { 
    name = "newstg33"
    rg_name = "rg-practice2"
    location = "West US"
    tier = "Standard"
    rep_type = "LRS" 
    }
}

container = {
  cont1 = { 
    name               = "containernew"
    storage_account_id = "stg1"
    access_type        = "private"
  }
  cont2 = { 
    name               = "containernew2"
    storage_account_id = "stg1"
    access_type        = "private" 
  }
}