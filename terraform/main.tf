resource "azuredevops_project" "project" {
  name = "Template Project"
  description  = "All of my awesomee things"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
}

resource "azuredevops_git_repository" "repository" {
  project_id = azuredevops_project.project.id
  name       = "My Awesome Repo"
  initialization {
    init_type = "Clean"
  }
}