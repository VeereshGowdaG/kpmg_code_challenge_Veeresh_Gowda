resource "azurerm_resource_group" "rsg_grp" {
  name     = "${var.name}-RG"
  location = var.location
  tags     = { 
    environment = "${var.environment}"
  }
}
