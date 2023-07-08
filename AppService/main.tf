resource "azurerm_app_service_plan" "app_plan" {
    name                = "app_${lower(var.app_plan_name)}"
    location            = var.location
    resource_group_name = var.resource_group_name
    sku {
        tier = "Free"
        size = "F1"
    }
}

resource "azurerm_app_service" "app_service" {
    name                = "aps_${lower(var.app_service_name)}"
    location            = var.location
    resource_group_name = var.resource_group_name
    app_service_plan_id = azurerm_app_service_plan.app_plan.id
    site_config {
        linux_fx_version = var.version
    }
}