resource "azurerm_resource_group" "example-RG" {
  for_each = var.rgname
  name     = each.value.name
  location = each.value.location
}