terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.50"
    }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "statefile"
    storage_account_name = "statefilenew787873"
    container_name       = "statefilecontainer"
    key                  = "test"
  }
}

provider "azurerm" {
  features {}
}