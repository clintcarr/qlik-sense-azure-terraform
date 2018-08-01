### Variables

# Azure Tenant id
variable "tenant_id" {
  default = "YOUR_TENANT_ID"
}

# Azure secret key
variable "client_id" {
  default = "YOUR_CLIENT_ID"
}

variable "client_secret" {
  default = "YOUR_CLIENT_SECRET"
}

variable "subscription_id" {
  default = "YOUR_SUBSCRIPTION_ID"
}

variable "qlikSense_rg" {}

variable "azure_location" {}

variable "windows_administrator" {}

variable "windows_administrator_pass" {}

variable "server_hostname" {}

variable qse_svc_password {}

# Postgres password for Qlik Sense administrator
variable qse_db_admin_password {}

# Postgres password for repository
variable qse_db_repository_password {}

# Qlik Sense serial number
variable qse_license {}

# Qlik Sense control number
variable qse_control {}

# Qlik Sense license name
variable qse_name {}

# Qlik Sense license organisation
variable qse_org {}
