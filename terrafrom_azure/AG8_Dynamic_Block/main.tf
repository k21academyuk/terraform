terraform {
 required_providers {
 azurerm = {
 source = "hashicorp/azurerm"
 version = "4.10.0"
 }
 }
}
provider "azurerm" {
 # Configuration options
 features {
   
 }
 subscription_id = "<>"
}

resource "azurerm_virtual_network" "TFAzure-vnet" {
 name = "tfAzure-vnet"
 location = var.location
 resource_group_name = var.rg-name
 address_space = ["10.0.0.0/16"]
 dynamic "subnet" {
 for_each = var.subnet_data
 content {
 name = subnet.value["name"]
 address_prefixes = subnet.value["address_prefix"]
 }
 }
}

output "subnets-address" {
 value = azurerm_virtual_network.TFAzure-vnet.subnet[*].address_prefixes
}
