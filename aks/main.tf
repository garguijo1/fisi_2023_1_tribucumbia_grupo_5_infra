resource "azurerm_virtual_network" "example" {
  name                = "vn-${lower(var.virtual_network-name)}"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-${lower(var.subnet-name)}"
  address_prefixes     = ["10.0.1.0/24"]
  virtual_network_name = azurerm_virtual_network.example.name
  resource_group_name  = var.resource_group_name
}

resource "azurerm_network_security_group" "network_security" {
  name                = "secnet-${lower(var.secnet-name)}"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "network_security_group" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.exnetwork_securityample.id
}

resource "azurerm_container_registry" "container-register" {
  name                = "cr-${lower(var.container_register-name)}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"
}

resource "azurerm_kubernetes_cluster" "aks_labisteca" {
  name                = "aks-${lower(var.nombre_aks)}}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "example-aks"
  linux_profile {
    admin_username = "adminuser"
    ssh_key {
      key_data = file("~/.ssh/id_rsa.pub")
    }
  }
  agent_pool_profile {
    name            = "example-aks-pool"
    count           = var.count_nodos
    vm_size         = "Standard_DS2_v2"
    os_type         = "Linux"
    vnet_subnet_id  = azurerm_subnet.subnet.id
    max_pods        = var.max_pods
    os_disk_size_gb = var.os_disk_size_gb
  }
  service_principal {
    client_id     = "00000000-0000-0000-0000-000000000000"
    client_secret = "00000000-0000-0000-0000-000000000000"
  }
  depends_on = [
    azurerm_container_registry.container-register
  ]
}