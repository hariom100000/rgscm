resource "azurerm_virtual_network_peering" "example-1" {
  name                      = "peer1to2"
  resource_group_name       = "RH1"
  virtual_network_name      = data.azurerm_virtual_network.example-1.name
  remote_virtual_network_id = data.azurerm_virtual_network.example-2.id
}

resource "azurerm_virtual_network_peering" "example-2" {
  name                      = "peer2to1"
  resource_group_name       = "RH1"
  virtual_network_name      = data.azurerm_virtual_network.example-2.name
  remote_virtual_network_id = data.azurerm_virtual_network.example-1.id
}