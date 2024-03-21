resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.app_name}storeacc"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Application = "${var.app_name}"
    Environment = var.environment
  }
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "${var.app_name}blogcontainer"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "blob"
}