variable "org_service_url" {
  description = "org service url"
  sensitive   = false
  type        = string
}
variable "token" {
  description = "token for azure devops project"
  sensitive   = true
  type        = string
}
variable "azure_subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "location_short" {
  description = "Azure Region Short"
  type        = string
}

variable "common_name" {
  description = "Common Name"
  type        = string
}