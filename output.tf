output "rg_name" {
  value = azurerm_resource_group.rg.name
}
output "rg_location" {
  value = azurerm_resource_group.rg.location
}
output "virtual_network-name" {
  value = azurerm_virtual_network.virtualnet.name
}
output "subnet_name" {
  value = azurerm_subnet.sub_net.name
}
output "public_IP_name" {
  value = azurerm_public_ip.pubip.name
}
output "public_IP_Allocation_method" {
  value = azurerm_public_ip.pubip.allocation_method
}
output "nic_name" {
  value = azurerm_network_interface.nicard.name
}
output "nsg_name" {
  value = azurerm_network_security_group.nsg.name
}
output "vm_name" {
  value = azurerm_windows_virtual_machine.V_M.name
}
output "vm_size" {
  value = azurerm_windows_virtual_machine.V_M.size
}
output "vm_admin_username" {
  value     = azurerm_windows_virtual_machine.V_M.admin_username
  sensitive = true
}
output "vm_admin_password" {
  value     = azurerm_windows_virtual_machine.V_M.admin_password
  sensitive = true
}

