output "id" {
  value = values(azurerm_subnet.example-subnet)[*].id
}
