resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = data.azurerm_subnet.example.id
  network_security_group_id = data.azurerm_network_security_group.example-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "example2" {
  subnet_id                 = data.azurerm_subnet.vnet1.id
  network_security_group_id = data.azurerm_network_security_group.example-nsg.id
}