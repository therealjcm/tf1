terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

locals {
    subnets = cidrsubnets("10.0.0.0/24", 8, 7)
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "core"
}

resource "azurerm_resource_group" "demo" {
  for_each = var.resource_groups
  name     = "${var.prefix}_${each.value}"
  location = var.region
  tags     = var.tags
}
