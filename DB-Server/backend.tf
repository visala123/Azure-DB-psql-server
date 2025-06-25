terraform {
  backend "azurerm" {
    resource_group_name  = "storage-rg-v"
    storage_account_name = "terraformbackendalgorims"
    container_name       = "backend"
    key                  = "terraform.tfstate"
  }
}
