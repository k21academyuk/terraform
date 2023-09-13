terraform {
 required_providers {
 azurerm = {
 source = "hashicorp/azurerm"
 version = "3.53.0"
 }
 }
}
provider "azurerm" {
 # Configuration options
}


#create resource group
resource "azurerm_resource_group" "rg" {
 name = "module-rg"
 location = "westus"
}


#Call module vnet
module "vnet" {
 source = "./modules/vnet"
 rg-name = azurerm_resource_group.rg.name
 location = azurerm_resource_group.rg.location
 address_space = ["10.0.0.0/16"]
 subnet_prefixes = ["10.0.1.0/24"]
 subnet_name = "subnet1"
}


#Call module storage-account
module "storage_account" {
 source = "./modules/storage-account"
 rg-name = azurerm_resource_group.rg.name
 location = azurerm_resource_group.rg.location
 sa-name = "tfstorage234"
}