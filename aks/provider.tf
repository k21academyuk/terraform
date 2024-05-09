# Define the Azure provider configuration block.
provider "azurerm" {
  # Configure provider features, if any.
  features {}
}

# Declare the Terraform configuration block specifying required provider versions.
terraform {
  # Specify the required provider and its version.
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.66.0"
    }
  }
  # Specify the minimum required Terraform version.
  required_version = ">= 0.14"
}
