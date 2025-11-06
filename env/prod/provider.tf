terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
}

provider "azurerm" {

  subscription_id = "e939c0ee-ab91-49f3-b854-6a4cab5b9219"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }

}

