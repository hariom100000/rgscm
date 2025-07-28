resource "azurerm_linux_virtual_machine" "example-vm" {
  for_each                        = var.vm
  name                            = each.value.name
  resource_group_name             = each.value.rg
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.vm-username.value
  admin_password                  = data.azurerm_key_vault_secret.vm-passwd.value
  disable_password_authentication = each.value.disable_password_authentication

  network_interface_ids = [each.value.network_interface_id]

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}