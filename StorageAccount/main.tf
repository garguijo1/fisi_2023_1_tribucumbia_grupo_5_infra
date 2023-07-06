resource "azurerm_storage_account" "name" {
  name                              = "stg${lower(var.base_name)}" 
  resource_group_name               = var.resource_group_name
  location                          = var.location
  account_tier                      = "Standard"
  account_replication_type          = "LRS"
  account_kind                      = "StorageV2"
  is_hns_enabled                    = "true"
  enable_https_traffic_only         = true
  access_tier                       = "Hot"  
  allow_nested_items_to_be_public   = false
}

resource "azurerm_storage_data_lake_gen2_filesystem" "name" {
  name                       = "stg${lower(var.dlgen2_name)}"
  storage_storage_account_id = azurerm_storage_account.example.id 
  properties = {
    hello = "aGVsbG8="
  }  
}