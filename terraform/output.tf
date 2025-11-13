#######
## Output file
#######
output "name" {
  value = data.azuredevops_agent_pool.example.name
}

output "pool_type" {
  value = data.azuredevops_agent_pool.example.pool_type
}

output "auto_provision" {
  value = data.azuredevops_agent_pool.example.auto_provision
}

output "auto_update" {
  value = data.azuredevops_agent_pool.example.auto_update
}