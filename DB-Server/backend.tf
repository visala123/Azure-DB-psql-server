terraform {
  backend "azurerm" {
    resource_group_name  = var.resource_group_name
    storage_account_name = "terraformbackendalgorims"
    container_name       = "backend"
    key                  = "terraform.tfstate"
  }
}
