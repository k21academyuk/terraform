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

resource "azurerm_virtual_network" "Tf-Vnet" {
 name = "tf-vnet1"
 location = var.location
 resource_group_name = var.resourceGroupName
 address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "Tf-Subnet" {
 name = "tf-subnet1"
 resource_group_name = var.resourceGroupName
 virtual_network_name = azurerm_virtual_network.Tf-Vnet.name
 address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "publicIP" {
 name = "tf-pip1"
 location = "eastus"
 resource_group_name = var.resourceGroupName
 allocation_method = "Static"
 ip_version = "IPv4"
}

resource "azurerm_network_interface" "Tf-nic" {
 name = "tf-nic1"
 location = "eastus"
 resource_group_name = var.resourceGroupName

 ip_configuration {
 name = "ip-config1"
 subnet_id = azurerm_subnet.Tf-Subnet.id
 private_ip_address_allocation = "Dynamic"
 public_ip_address_id = azurerm_public_ip.publicIP.id
 }
}

resource "azurerm_virtual_machine" "TFAzureVM" {
 name = "tfAzurevm1"
 location = var.location
 resource_group_name = var.resourceGroupName
 vm_size = "Standard_DS1_v2"
 network_interface_ids = [azurerm_network_interface.Tfnic.id]

 storage_image_reference {
 publisher = "Canonical"
 offer = "UbuntuServer"
 sku = "20.04-LTS"
 version = "latest"
 }
 storage_os_disk {
 name = "disk1"
 caching = "ReadWrite"
 create_option = "FromImage"
 managed_disk_type = "Standard_LRS"
 }
 os_profile {
 computer_name = "tfAzuredev01"
 admin_username = "azureuser"
 admin_password = "Welcome1@123"
 }
 os_profile_linux_config {
 disable_password_authentication = false
 }
}
