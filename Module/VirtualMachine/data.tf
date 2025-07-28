data "azurerm_network_interface" "example" {
  name                = "nic01"
  resource_group_name = "RH1"
}

output "network_interface_id" {
  value = data.azurerm_network_interface.example.id
}

data "azurerm_key_vault" "example-key" {
  name                = "hariomkey3"
  resource_group_name = "RG-backend"
}

data "azurerm_key_vault_secret" "vm-passwd" {
  name         = "vmpasswd"
  key_vault_id = data.azurerm_key_vault.example-key.id
}

data "azurerm_key_vault_secret" "vm-username" {
  name         = "vmusername"
  key_vault_id = data.azurerm_key_vault.example-key.id
}
