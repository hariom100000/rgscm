data "azurerm_subnet" "example" {
  name                 = "subnet01"
  virtual_network_name = "vnet02"
  resource_group_name  = "RH1"
}

data "azurerm_subnet" "vnet1" {
  name                 = "subnet02"
  virtual_network_name = "vnet03"
  resource_group_name  = "RH1"
}

data "azurerm_network_security_group" "example-nsg" {
  name                = "nsg01"
  resource_group_name = "RH1"
}