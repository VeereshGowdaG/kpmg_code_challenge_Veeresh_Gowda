resource "azurerm_virtual_network" "vnet01" {
  name                = "vnet-${var.environment}-${var.location}-001"
  resource_group_name = var.resource_group
  location            = var.location
  address_space       = [var.vnet_iprange]
}

resource "azurerm_subnet" "web-subnet" {
  name                 = "snet-web-${var.environment}-001"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.websubnet_iprange]
  depends_on = [
    azurerm_virtual_network.vnet01
  ]
}

resource "azurerm_subnet" "app-subnet" {
  name                 = "snet-app-${var.environment}-002"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.appsubnet_iprange]
  depends_on = [
   azurerm_virtual_network.vnet01
  ]
}

resource "azurerm_subnet" "db-subnet" {
  name                 = "snet-db-${var.environment}-003"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.dbsubnet_iprange]
  depends_on = [
   azurerm_virtual_network.vnet01
  ]
}
