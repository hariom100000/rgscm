output "id" {
  value = values(azurerm_resource_group.example-RG)[*].id
}
