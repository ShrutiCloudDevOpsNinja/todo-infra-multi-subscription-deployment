rgs-pm = {
      rg1 = {
        name = "rg001-prod"
        location = "eastus"
    }
}

 stg-pm = {
    stg1 = {
      name = "stg8983w894wiouyiprod1"
      location = "eastus"
      resource_group_name = "rg001-prod"
      account_tier = "Standard"
      account_replication_type = "LRS"
    }
 }

vnet-pm = {
  todo-vnet-prod  = {
     name = "todo-vnet-prod"
     resource_group_name = "rg001-prod"
     location = "eastus"
     address_space = ["10.0.0.0/16"]
  }

}


subnet-pv = {
  subnet1-prod = {
    subnet_name = "subnet1-prod"
    resource_group_name = "rg001-prod"
    virtual_network_name = "todo-vnet-prod"
    address_prefixes = ["10.0.0.0/24"]
}
  subnet2-prod = {
    subnet_name = "subnet2-prod"
    resource_group_name = "rg001-prod"
    virtual_network_name = "todo-vnet-prod"
    address_prefixes = ["10.0.1.0/24"]
}
}


vm-pv = {
  frontend-vm-prod = {
    vm_name = "frontend-vm-prod"
    resource_group_name = "rg001-prod"
    location = "eastus"
    size = "Standard_f2"
    admin_username = "vikram"
    admin_password = "Vikram@02020202"
    nic_name = "frontend_nic-prod"
    subnet_name = "subnet1-prod"
    virtual_network_name = "todo-vnet-prod"
    nic_location = "eastus"
    nsg_name = "frontend-nsg-prod"
    nsg_location = "eastus"

  }
 backend-vm-prod = {
    vm_name = "backend-vm-prod"
    resource_group_name = "rg001-prod"
    location = "eastus"
    size = "Standard_f2"
    admin_username = "vikram"
    admin_password = "Vikram@02020202"
    nic_name = "backend_nic-prod"
    subnet_name = "subnet2-prod"
    virtual_network_name = "todo-vnet-prod"
    nic_location = "eastus"
    nsg_name = "backend-nsg-prod"
    nsg_location = "eastus"
   
 }
}









