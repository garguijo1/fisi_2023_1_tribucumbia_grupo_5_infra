resource "azurerm_api_management" "apim1" {
  name                = "apim-${lower(var.api_name)}"
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = var.publisher_name
  publisher_email     = "gabriel.guillen@unmsm.edu.pe"
  sku_name            = "Developer"
}