variable "resource_group_name" {
  default = "rg_rds_psql"
}

variable "location" {
  default = "eastus"
}

variable "psql_server_name" {
  default = "psql-flexible-server123"
}

variable "admin_user" {
  default = "psqladmin"
}

variable "admin_password" {
  sensitive = true
}
