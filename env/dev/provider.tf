terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
}

provider "azurerm" {

  subscription_id = "da583373-7ae0-4c7d-baba-868ff70eaf52"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }

}

