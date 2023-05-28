resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.rgloc
}

resource "azurerm_virtual_network" "virtualnet" {
  name                = var.v_net
  address_space       = var.add_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "sub_net" {
  name                 = var.subnetname
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.virtualnet.name
  address_prefixes     = var.add_pref
}

resource "azurerm_public_ip" "pubip" {
  name                = var.publicip_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = var.alloc_method

}

resource "azurerm_network_interface" "nicard" {
  name                = var.nic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.nic_ip_conf_name
    subnet_id                     = azurerm_subnet.sub_net.id
    private_ip_address_allocation = var.private_ip_add_alloc
    public_ip_address_id          = azurerm_public_ip.pubip.id
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_nameforvm
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = var.nsg_sec_name
    priority                   = var.nsg_prority
    direction                  = var.nsg_dir
    access                     = var.nsg_access
    protocol                   = var.nsg_protocol
    source_port_range          = var.nsg_sour_port_range
    destination_port_range     = var.nsg_des_port_range
    source_address_prefix      = var.nsg_sour_add_pref
    destination_address_prefix = var.nsg_des_add_pref
  }
}
resource "azurerm_network_interface_security_group_association" "nisga" {
  network_interface_id      = azurerm_network_interface.nicard.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}


resource "azurerm_windows_virtual_machine" "V_M" {
  name                = var.win_VM
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.win_VM_size
  admin_username      = var.win_VM_username
  admin_password      = var.win_VM_pwd
  network_interface_ids = [
    azurerm_network_interface.nicard.id,
  ]

  os_disk {
    caching              = var.os_disk
    storage_account_type = var.strg_acc_type
  }

  source_image_reference {
    publisher = var.sipublisher
    offer     = var.sioffer
    sku       = var.sisku
    version   = var.siversion
  }
}