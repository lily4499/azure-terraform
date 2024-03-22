//variable "ARM_SUBSCRIPTION_ID" {
//  description = "Azure Subscription ID"
//}

//variable "ARM_CLIENT_ID" {
 // description = "Azure Client ID"
//}

//variable "ARM_CLIENT_SECRET" {
//  description = "Azure Client Secret"
//}

//variable "ARM_TENANT_ID" {
//  description = "Azure Tenant ID"
//}


variable "acr_name" {
  description = "Name of the Azure Container Registry"
}

variable "aks_name" {
  description = "Name of the Azure Kubernetes Service"
}
variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
}
variable "azure_region" {
  description = "Azure region where resources will be deployed"
}
