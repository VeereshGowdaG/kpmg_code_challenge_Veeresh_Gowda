output "rg_name" {
    value = azurerm_resource_group.rsg_grp.name
    description = "Name of the resource group."
}

output "location_id" {
    value = azurerm_resource_group.rsg_grp.location
    description = "Location id of the resource group"
}
