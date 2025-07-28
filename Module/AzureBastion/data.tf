data "azurerm_subnet" "example-bast" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "vnet02"
  resource_group_name  = "RH1"
}


data "azurerm_public_ip" "example-pub2" {
  name                = "publicip02"
  resource_group_name = "RH1"
}
