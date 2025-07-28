module "rgroup" {
  source ="../../Module/RG"
  rgname = var.rgs
}

module "virtualnet" {
    depends_on = [ module.rgroup ]
  source = "../../Module/vnet"
  vnet-name1 = var.vnet-name
}

module "subnetw" {
    depends_on = [ module.rgroup,module.virtualnet ]
    source = "../../Module/subnet"
    subnet-name = var.subnet
  
}
module "nsg" {
    depends_on = [ module.rgroup ]
    source = "../../Module/NSG"
    nsg = var.sgh
    rules = var.rule
}
module "publicip" {
  depends_on = [ module.rgroup ]
  source = "../../Module/publicip"
  pip = var.publicip
}

module "nic" {
    depends_on = [ module.rgroup,module.subnetw,module.publicip ]
  source = "../../Module/NIC"
  nic = var.nic
}

module "vmcre" {
    depends_on = [ module.rgroup,module.virtualnet,module.subnetw,module.nic,module.nsg ]
  source = "../../Module/VirtualMachine"
  vm = var.vm1
}

module "map" {
  depends_on = [ module.nic,module.nsg,module.subnetw,module.virtualnet,module.vmcre,module.rgroup ]
  source = "../../Module/NSG associate subnet"
}

module "azurebastion" {
  depends_on = [ module.rgroup,module.virtualnet,module.subnetw,module.publicip ]
  source = "../../Module/AzureBastion"
  bas = var.bas
}

module "vnetpeering" {
  depends_on = [ module.rgroup,module.virtualnet,module.subnetw,module.nic,module.vmcre ]
  source = "../../Module/peering"
}