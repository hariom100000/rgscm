terraform {
  backend "azurerm" {
    resource_group_name  = "RG-backend"
    storage_account_name = "madarikakhel"               # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                    # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "database.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
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