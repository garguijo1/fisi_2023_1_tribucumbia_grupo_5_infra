resource "azurerm_mysql_server" "servidor" {
  name                          = "${lower(var.base_name_server)}"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  version                       = "5.7"
  administrator_login           = "adminroot"
  administrator_login_password  = "abcdef123456*"
}

resource "azurerm_mysql_database" "example" {
  name                = "db_${lower(var.data_base_name)}"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.servidor.name
  charset             = "utf8"
  collation           = "utf8_general_ci"
}
