resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_postgresql_flexible_server" "psql" {
  name                   = var.psql_server_name
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  administrator_login    = var.admin_user
  administrator_password = var.admin_password
  version                = "15"
  sku_name               = "B_Standard_B1ms"
  storage_mb             = 32768
  zone                   = "1"

  authentication {
    password_auth_enabled = true
  }

#   backup {
#     backup_retention_days        = 7
#     geo_redundant_backup_enabled = false
#   }

  lifecycle {
    prevent_destroy = false
  }
}
