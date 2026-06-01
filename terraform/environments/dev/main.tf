terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0"
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = var.environment
    project     = "gomycode-assessment"
  }
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vm_name             = var.vm_name
  environment         = var.environment
}

module "security" {
  source               = "../../modules/security"
  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  vm_name              = var.vm_name
  environment          = var.environment
  network_interface_id = module.network.network_interface_id
}

module "compute" {
  source               = "../../modules/compute"
  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  admin_username       = var.admin_username
  environment          = var.environment
  network_interface_id = module.network.network_interface_id
}
