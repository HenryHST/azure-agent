terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.20.0"
    }
  }
  required_version = ">= 1.5.7"
}

provider "azuredevops" {
  org_service_url       = var.org_service_url
  personal_access_token = var.token
}
provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}
resource "azurerm_resource_group" "this" {
  name     = "rg-${var.environment}-${var.location_short}-${var.common_name}"
  location = var.location
}