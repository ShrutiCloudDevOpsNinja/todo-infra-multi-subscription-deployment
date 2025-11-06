data "azurerm_subnet" "subnet-b" {
  for_each = var.child-vm-v
    name                 = each.value.subnet_name
    virtual_network_name = each.value.virtual_network_name
    resource_group_name  = each.value.resource_group_name
}


resource "azurerm_network_interface" "nic-b" {
  for_each = var.child-vm-v
  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet-b[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm-b" {
  for_each = var.child-vm-v
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password = each.value.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic-b[each.key].id,
  ]
disable_password_authentication = false
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_network_security_group" "nsg-b" {
  for_each = var.child-vm-v
  name                = each.value.nsg_name
  location            = each.value.nsg_location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


resource "azurerm_network_interface_security_group_association" "assocc-b" {
  for_each = var.child-vm-v
  network_interface_id      = azurerm_network_interface.nic-b[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg-b[each.key].id
}



