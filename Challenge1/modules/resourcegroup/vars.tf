variable "name" {}
variable "location" {}
variable "environment" {
    type = string
    description = "Environment to deploy"
    default = "dev"
}
