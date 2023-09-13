variable "rg-name" {
 type = string
 description = "Name of resource group"
}
variable "location" {
 type = string
 description = "Azure location of storage account
environment"
}
variable "address_space" {
 type = list
 description = "address space for vnet"
}
variable "subnet_prefix" {
 type = string
 description = "subnet address prefix"
}
variable "subnet_name" {
 type = string
 description = "subnet names"
}