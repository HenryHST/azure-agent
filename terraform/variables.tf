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