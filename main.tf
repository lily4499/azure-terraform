provider "azurerm" {
  features {}
}

# Create a resource group

resource "azurerm_resource_group" "arg" {
  name     = var.resource_group_name
  location = var.resource_group_region
}

resource "azurerm_container_registry" "acr" {
  name                     = var.acr_name
  resource_group_name      = var.resource_group_name
  location                 = var.azure_region
  sku                      = "Basic"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.azure_region
  resource_group_name = var.resource_group_name
  dns_prefix          = var.aks_name
  kubernetes_version  = "1.20.9"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }
}
