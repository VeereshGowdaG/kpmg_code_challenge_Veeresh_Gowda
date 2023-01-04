output "network_name" {
  value = azurerm_virtual_network.vnet01.name
  description = "Name of the Virtual network"
}

output "websubnet_id" {
  value = azurerm_subnet.web-subnet.id
  description = "Id of the websubnet in the network"
}

output "appsubnet_id" {
  value = azurerm_subnet.app-subnet.id
  description = "Id of the appsubnet in the network"
}

output "dbsubnet_id" {
  value = azurerm_subnet.db-subnet.id
  description = "Id of the dbsubnet in the network"
}


