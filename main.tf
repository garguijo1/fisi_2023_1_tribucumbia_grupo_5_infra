terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "=3.37.0"
        }
    }
}

provider "azurerm" {
    features {

    }
}

module "ResourceGroup" {
    source      = "./ResourceGroup"
    base_name   = "la_bisteca"
    location    = "eastus2"
}

module "StorageAccount" {
    source              = "./StorageAccount"
    base_name           = "archivos_reporte_1"
    dlgen2_name         = "archivos_reporte_1"
    resource_group_name = module.ResourceGroup.rg_name_out
    location            = module.ResourceGroup.rg_location_out     
}


module "DataBaseMySQL" {
    source                  = "./mySqlDatabase"
    basebase_name_server    = "labisteca-reservaciones"
    data_base_name          = "labisteca"
    resource_group_name     = module.ResourceGroup.rg_name_out
    location                = module.ResourceGroup.rg_location_out     
}

module "ApiManagment" {
    source                  = "./apiManagment"
    api_name                = "labisteca_1"
    publisher_name          = "LA BISTECA"
    resource_group_name     = module.ResourceGroup.rg_name_out
    location                = module.ResourceGroup.rg_location_out     
}

module "AppService" {
    source                  = "./AppService"
    version                 = "NODE|16-lts"
    app_plan_name           = "labisteca-reservaciones"
    app_service_name        = "la_bisteca"
    resource_group_name     = module.ResourceGroup.rg_name_out
    location                = module.ResourceGroup.rg_location_out     
}

