rgs-pm = {
      rg1 = {
        name = "rg001-dev"
        location = "centralindia"
    }
}

 stg-pm = {
    stg1 = {
      name = "stg8983w894wiouyidev1"
      location = "centralindia"
      resource_group_name = "rg001-dev"
      account_tier = "Standard"
      account_replication_type = "LRS"
    }
 }

vnet-pm = {
  todo-vnet-dev  = {
     name = "todo-vnet-dev"
     resource_group_name = "rg001-dev"
     location = "centralindia"
     address_space = ["10.0.0.0/16"]
  }

}


subnet-pv = {
  subnet1-dev = {
    subnet_name = "subnet1-dev"
    resource_group_name = "rg001-dev"
    virtual_network_name = "todo-vnet-dev"
    address_prefixes = ["10.0.0.0/24"]
}
  subnet2-dev = {
    subnet_name = "subnet2-dev"
    resource_group_name = "rg001-dev"
    virtual_network_name = "todo-vnet-dev"
    address_prefixes = ["10.0.1.0/24"]
}
}


vm-pv = {
  frontend-vm-dev = {
    vm_name = "frontend-vm-dev"
    resource_group_name = "rg001-dev"
    location = "centralindia"
    size = "Standard_f2"
    admin_username = "vikram"
    admin_password = "Vikram@02020202"
    nic_name = "frontend_nic-dev"
    subnet_name = "subnet1-dev"
    virtual_network_name = "todo-vnet-dev"
    nic_location = "centralindia"
    nsg_name = "frontend-nsg-dev"
    nsg_location = "centralindia"

  }
 backend-vm-dev = {
    vm_name = "backend-vm-dev"
    resource_group_name = "rg001-dev"
    location = "centralindia"
    size = "Standard_f2"
    admin_username = "vikram"
    admin_password = "Vikram@02020202"
    nic_name = "backend_nic-dev"
    subnet_name = "subnet2-dev"
    virtual_network_name = "todo-vnet-dev"
    nic_location = "centralindia"
    nsg_name = "backend-nsg-dev"
    nsg_location = "centralindia"
   
 }
}









