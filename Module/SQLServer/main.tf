resource "azurerm_mssql_server" "example" {
  for_each                     = var.sql
  name                         = each.value.name
  resource_group_name          = each.value.rg
  location                     = each.value.location
  version                      = each.value.verg
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password

}