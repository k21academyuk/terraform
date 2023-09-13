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
resource "azurerm_virtual_network" "TFAzure-vnet" {
 name = "tfAzure-vnet"
 location = var.location
 resource_group_name = var.resourceGroupName
 address_space = ["10.0.0.0/16"]
 dns_servers = ["8.8.8.8", "8.8.4.4"]
 tags = {
 environment = "Dev"
 }
}

resource "azurerm_subnet" "TFAzure-sub" {
 name = "testsubnet"
 resource_group_name = var.resourceGroupName
 virtual_network_name = azurerm_virtual_network.TFAzurevnet.name
 address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "TFAzure-publicIP" {
 name = "tfAzure-publicIP"
 location = "eastus"
 resource_group_name = var.resourceGroupName
 allocation_method = "Static"
 ip_version = "IPv4"
 tags = {
 environment = "Dev"
 }
}

resource "azurerm_network_security_group" "TFAzureSG" {
 name = "tfAzureSG"
 location = "eastus"
 resource_group_name = var.resourceGroupName
}
resource "azurerm_network_security_rule" "Port80" {
 name = "Allow80"
 priority = 102
 direction = "Inbound"
 access = "Allow"
 protocol = "Tcp"
 source_port_range = "*"
 destination_port_range = "80"
 source_address_prefixes = "*"
 destination_address_prefix = "*"
 resource_group_name = azurerm_network_security_group.TFAzureSG.resource_group_name
 network_security_group_name = azurerm_network_security_group.TFAzureSG.name
}
resource "azurerm_network_security_rule" "Port443" {
 name = "Allow443"
 priority = 101
 direction = "Inbound"
 access = "Allow"
 protocol = "Tcp"
 source_port_range = "*"
 destination_port_range = "443"
 source_address_prefixes = "*"
 destination_address_prefix = "*"
 resource_group_name = azurerm_network_security_group.TFAzureSG.resource_group_name
 network_security_group_name = azurerm_network_security_group.TFAzureSG.name
}

resource "azurerm_network_interface" "TFAzure-nic" {
 name = "myNIC"
 location = "eastus"
 resource_group_name = var.resourceGroupName
 ip_configuration {
 name = "myNicConfiguration"
 subnet_id = azurerm_subnet.TFAzuresub.id
 private_ip_address_allocation = "Dynamic"
 public_ip_address_id = azurerm_public_ip.TFAzurepublicIP.id
 }
tags = {
 environment = "Dev"
 }
}

resource
"azurerm_network_interface_security_group_association"
"NSGAssociation" {
 network_interface_id = azurerm_network_interface.TFAzure-nic.id
 network_security_group_id = azurerm_network_security_group.TFAzureSG.id
}



