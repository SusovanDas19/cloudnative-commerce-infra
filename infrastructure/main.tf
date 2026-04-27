provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "cnc-rg"
  location = "East Asia"
}

resource "azurerm_storage_account" "logs" {
  name                     = "cnclogs${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = "East Asia"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}
