resource "azuredevops_project" "project" {
  name               = "Template Project"
  description        = "Template project for pipeline support"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
}

resource "azuredevops_git_repository" "repository" {
  project_id = azuredevops_project.project.id
  name       = "Template Repo"
  default_branch = "refs/heads/main"
  initialization {
    init_type = "Clean"
  }
}
resource "azuredevops_build_definition" "build_definition" {
  project_id = azuredevops_project.project.id
  name       = "My Awesome Build Pipeline"
  path       = "\\"
  repository {
    repo_type   = "Git"
    repo_id     = azuredevops_git_repository.repository.id
    branch_name = azuredevops_git_repository.repository.default_branch
    yml_path    = "azure-pipelines.yml"
  }
}

resource "azuredevops_area_permissions" "example-root-permissions" {
  project_id = azuredevops_project.example.id
  principal  = data.azuredevops_group.example-project-readers.id
  path       = "/"
  permissions = {
    CREATE_CHILDREN = "Deny"
    GENERIC_READ    = "Allow"
    DELETE          = "Deny"
    WORK_ITEM_READ  = "Allow"
  }
}
resource "azuredevops_agent_pool" "test_pool" {
  name           = "Test-pool"
  auto_provision = false
  auto_update    = false
}