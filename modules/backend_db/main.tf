
resource "azurerm_mssql_server" "sqlserver01" {
    name                          = var.primary_database
    resource_group_name           = var.resource_group
    location                      = var.location
    version                       = var.primary_database_version
    administrator_login           = var.primary_database_admin
    administrator_login_password  = var.primary_database_password
    minimum_tls_version           = "1.2"

    tags     = { 
    environment = "${var.environment}"
  }
}
resource "azurerm_mssql_database" "db" {
  name                = "sql_db_01"
  # resource_group_name = var.resource_group
  # location            = var.location
  server_id         = azurerm_mssql_server.sqlserver01.id
  storage_account_type = "Local"
}

