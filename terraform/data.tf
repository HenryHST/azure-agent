###
data "azuredevops_agent_pool" "example" {
  name = "HomeLab Pool"
}
data "azuredevops_group" "example" {
  project_id = data.azuredevops_project.example.id
  name       = "Reviewer"
}

data "azuredevops_project" "example" {
  name = "Template Project"
}