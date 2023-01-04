variable "primary_database" {}
variable "resource_group" {}
variable "location" {}
variable "environment" {
    type = string
    description = "Environment to deploy"
    default = "dev"
}
variable "primary_database_version" {}
variable "primary_database_admin" {}
variable "primary_database_password" {}

