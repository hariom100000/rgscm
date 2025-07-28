output "id" {
  value = values(azurerm_public_ip.example-pip)[*].id
}
