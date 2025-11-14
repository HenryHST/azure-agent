terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.1.0"
    }

  }
  required_version = ">= 1.5.7"
}

provider "azuredevops" {
  org_service_url       = var.org_service_url
  personal_access_token = var.token
}