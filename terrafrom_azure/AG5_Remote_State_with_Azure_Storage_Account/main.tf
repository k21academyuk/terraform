#Set up remote state
terraform {
 backend "azurerm" {
 resource_group_name = "TFAzure-rg"
 storage_account_name = "tfstorage24"
 container_name = "k21trainings"
 key = "dev.terraform.tfstate"
 }
}
#configure azurerm provider
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
 name = "tfdemo-rg"
 location = "westus2"
 tags = {
 environment = "dev"
 }
}