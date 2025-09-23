data "azurerm_network_interface" "example" {
  name                = "nic01"
  resource_group_name = "RH1"
}

output "network_interface_id" {
  value = data.azurerm_network_interface.example.id
}

data "azurerm_key_vault" "example-key" {
  name                = "hariomkey33"
  resource_group_name = "RG_Backend"
}

data "azurerm_key_vault_secret" "vm-passwd" {
  name         = "vmpassw"
  key_vault_id = data.azurerm_key_vault.example-key.id
}

data "azurerm_key_vault_secret" "vm-username" {
  name         = "vmuser"
  key_vault_id = data.azurerm_key_vault.example-key.id
}
