terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.37.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# locals {
#   tags = {
#     environment = "dev"
#     owner = "Veeresh"
#   }
# }

#Creating a Resource Group
# resource "azurerm_resource_group" "rg-grp" {
#   name     = var.name
#   location = var.location
#   tags = local.tags
# }

module "resourcegroup" {
  source      = "./modules/resourcegroup"
  name        = var.name
  location    = var.location
  environment = var.environment
}

module "vnet_module" {
  source            = "./modules/vnet_module"
  location          = module.resourcegroup.location_id
  resource_group    = module.resourcegroup.rg_name
  environment       = var.environment
  vnet_iprange      = var.vnet_iprange
  websubnet_iprange = var.websubnet_iprange
  appsubnet_iprange = var.appsubnet_iprange
  dbsubnet_iprange  = var.dbsubnet_iprange

  depends_on = [
    module.resourcegroup
  ]
}

module "nsgroup" {
  source         = "./modules/nsgroup"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.rg_name
  web_subnet_id  = module.vnet_module.websubnet_id
  app_subnet_id  = module.vnet_module.appsubnet_id
  db_subnet_id   = module.vnet_module.dbsubnet_id

  depends_on = [
    module.resourcegroup,
    module.vnet_module
  ]
}

module "vm_compute" {
  source          = "./modules/vm_compute"
  location        = module.resourcegroup.location_id
  resource_group  = module.resourcegroup.rg_name
  environment     = var.environment
  web_subnet_id   = module.vnet_module.websubnet_id
  app_subnet_id   = module.vnet_module.appsubnet_id
  web_host_name   = var.web_host_name
  web_username    = var.web_username
  web_os_password = var.web_os_password
  app_host_name   = var.app_host_name
  app_username    = var.app_username
  app_os_password = var.app_os_password

  depends_on = [
    module.resourcegroup,
    module.vnet_module,
    module.nsgroup
  ]
}

module "backend_db" {
  source                    = "./modules/backend_db"
  location                  = module.resourcegroup.location_id
  resource_group            = module.resourcegroup.rg_name
  primary_database          = var.primary_database
  primary_database_version  = var.primary_database_version
  primary_database_admin    = var.primary_database_admin
  primary_database_password = var.primary_database_password
  environment               = var.environment

  depends_on = [
    module.resourcegroup
  ]
}