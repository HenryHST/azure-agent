terraform {
  required_providers {
    azurerm = {
      source  = "microsoft/azuredevops"
      version = "1.11.2"
    }
    
  }
  required_version = ">= 1.13.4"
}

provider "azuredevops" {
  org_service_url = "https://dev.azure.com/my-org"
  client_id     = "00000000-0000-0000-0000-000000000001"
  tenant_id     = "00000000-0000-0000-0000-000000000001"
  client_secret = "top-secret-password-string"
}