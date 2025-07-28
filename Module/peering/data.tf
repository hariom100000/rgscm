data "azurerm_virtual_network" "example-1" {
  name                = "vnet02"
  resource_group_name = "RH1"
}

data "azurerm_virtual_network" "example-2" {
  name                = "vnet03"
  resource_group_name = "RH1"
}