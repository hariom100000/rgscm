rgs = {
  "rg1" = {
    "name"     = "RH1"
    "location" = "West Europe"
  }
    "rg2" = {
    "name"     = "RH2"
    "location" = "West Europe"
  }
  
}

vnet-name = {
  "vnet1" = {
    "name"          = "vnet02"
    "location"      = "West Europe"
    "rgname"        = "RH1"
    "address_space" = ["10.0.0.0/16"]
  }
    "vnet2" = {
    "name"          = "vnet03"
    "location"      = "West Europe"
    "rgname"        = "RH1"
    "address_space" = ["10.1.0.0/16"]
  }
}

subnet = {
  "subnet" = {
    "name"                 = "subnet01"
    "resource_group_name"  = "RH1"
    "virtual_network_name" = "vnet02"
    "address_prefixes"     = ["10.0.1.0/24"]
  }
  "subnet2" = {
    "name"                 = "subnet02"
    "resource_group_name"  = "RH1"
    "virtual_network_name" = "vnet03"
    "address_prefixes"     = ["10.1.0.0/24"]
  }
  "subnet3" = {
    "name"                 = "AzureBastionSubnet"
    "resource_group_name"  = "RH1"
    "virtual_network_name" = "vnet02"
    "address_prefixes"     = ["10.0.3.0/27"]
  }
}

publicip  = {
  "pip1" = {
    "name" = "publicip01"
    "resource_group_name"="RH1"
    "location"="West Europe"
  }
    "pip2" = {
    "name" = "publicip02"
    "resource_group_name"="RH1"
    "location"="West Europe"
  }
}

sgh = {
  "nsg1" = {
    name                = "nsg01"
    resource_group_name = "RH1"
    location            = "West Europe"
  }
}
  rule = {
      "rule1" = {
        name                       = "test12"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }


nic = {
  "nic1" = {
    "name" = "nic01"
    "location"="West Europe"
    "resource_group_name"="RH1"
    "ipname"="internal"
    "subnet_id"="/subscriptions/a3b72b1f-08a2-44c9-85c2-f37d5039f6d6/resourceGroups/RH1/providers/Microsoft.Network/virtualNetworks/vnet02/subnets/subnet01"
    "ip_allocation"="Dynamic"
  }
    "nic2" = {
    "name" = "nic02"
    "location"="West Europe"
    "resource_group_name"="RH1"
    "ipname"="test"
    "subnet_id"="/subscriptions/a3b72b1f-08a2-44c9-85c2-f37d5039f6d6/resourceGroups/RH1/providers/Microsoft.Network/virtualNetworks/vnet03/subnets/subnet02"
    "ip_allocation"="Dynamic"
  }
}

vm1 = {
  "vm1" = {
    "name"                            = "vm01"
    "rg"                              = "RH1"
    "location"                        = "West Europe"
    "size"                            = "Standard_F2"
    "disable_password_authentication" = "false"
    "network_interface_id"            = "/subscriptions/a3b72b1f-08a2-44c9-85c2-f37d5039f6d6/resourceGroups/RH1/providers/Microsoft.Network/networkInterfaces/nic01"
    "caching"                         = "ReadWrite"
    "storage_account_type"            = "Standard_LRS"
    "publisher"                       = "Canonical"
    "offer"                           = "0001-com-ubuntu-server-jammy"
    "sku"                             = "22_04-lts"
    "version"                         = "latest"
  },

  "vm2" = {
    "name"                            = "vm02"
    "rg"                              = "RH1"
    "location"                        = "West Europe"
    "size"                            = "Standard_F2"
    "disable_password_authentication" = "false"
    "network_interface_id"            = "/subscriptions/a3b72b1f-08a2-44c9-85c2-f37d5039f6d6/resourceGroups/RH1/providers/Microsoft.Network/networkInterfaces/nic02"
    
    "caching"                         = "ReadWrite"
    "storage_account_type"            = "Standard_LRS"
    "publisher"                       = "Canonical"
    "offer"                           = "0001-com-ubuntu-server-jammy"
    "sku"                             = "22_04-lts"
    "version"                         = "latest"
  }
}

bas = {
    "bastion1" = {
        "name"="bastion01"
        "location"="West Europe"
        "resource_group"="RH1"
        "ipname"="bastionip"
    }
}
