output "id" {
  value = values(azurerm_network_security_group.example)[*].id
}
