resource "azurerm_bastion_host" "host-example" {
  for_each = var.bas
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group

  ip_configuration {
    name                 = each.value.ipname
    subnet_id            = data.azurerm_subnet.example-bast.id
    public_ip_address_id = data.azurerm_public_ip.example-pub2.id
  }
}