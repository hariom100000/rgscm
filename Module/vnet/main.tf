resource "azurerm_virtual_network" "example-vnet" {
  for_each            = var.vnet-name1
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rgname
  address_space       = each.value.address_space
}