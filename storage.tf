data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "imported_rg" {
    name = "rg-unmanaged-1"
    location = "northeurope"
}

//i mport {
//     to = azurerm_resource_group.imported_rg
//    id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/rg-unmanaged-1"
// }

resource "azurerm_storage_account" "imported_st" {
  resource_group_name               = "rg-unmanaged-1"
  access_tier                       = "Hot"
  account_kind                      = "StorageV2"
  account_replication_type          = "LRS"
  account_tier                      = "Standard"
  location                          = "northeurope"
  name                              = "stheccjcmlab1"

  lifecycle {
    prevent_destroy = true
  }
}

///import {
//  to = azurerm_storage_account.imported_st
//  id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/rg-unmanaged-1/providers/Microsoft.Storage/storageAccounts/stheccjcmlab1"
//}

