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
    base_name   = "myfirstresourcegroup" #El script al final agrega las letras RG => ${variable}RG
    location    = "eastus2" #ubicacion geografica del datacenter 
}

module "StorageAccount" {
    source              = "./StorageAccount"
    base_name           = "mystorageaccountterraform" # El script crea un storage account
    dlgen2_name         = "mydatalakegen2terraform" # los datalakegen2 se crean en Hot y Cool 
    resource_group_name = module.ResourceGroup.rg_name_out
    location            = module.ResourceGroup.rg_location_out     
}



