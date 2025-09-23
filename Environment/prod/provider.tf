terraform {
 # backend "azurerm" {
    #resource_group_name  = "RG_Backend"
    #storage_account_name = "madarikakhel"
    #container_name       = "tfstate"    
    #key                  = "prod.terraform.tfstate" 
 # }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "a3b72b1f-08a2-44c9-85c2-f37d5039f6d6"
}
