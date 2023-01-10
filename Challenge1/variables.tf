#Variables in this project
variable "name" {
  # type = string
  # description = "Resource Group Name"
  # default = "Three-tier-arch"
}

variable "location" {
  # type = string
  # description = "Location of the three-tier-arch deployment"
  # default = "eastus"
}
variable "environment" {}
variable "vnet_iprange" {}
variable "websubnet_iprange" {}
variable "appsubnet_iprange" {}
variable "dbsubnet_iprange" {}
variable "web_host_name" {}
variable "web_username" {}
variable "web_os_password" {}
variable "app_host_name" {}
variable "app_username" {}
variable "app_os_password" {}
variable "primary_database" {}
variable "primary_database_admin" {}
variable "primary_database_password" {}
variable "primary_database_version" {}