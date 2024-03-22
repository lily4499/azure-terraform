# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  client_id     = var.TF_VAR_client_id
  client_secret = var.TF_VAR_client_secret
  tenant_id     = var.TF_VAR_tenant_id
}

# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.96.0"
    }
  }
}
