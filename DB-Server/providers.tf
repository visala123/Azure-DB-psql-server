terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90"
    }
  }
}
provider "azurerm" {
  features {}
  #use_oidc        = false
}
