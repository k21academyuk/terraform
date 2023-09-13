variable "rg-name" {
 type = string
 description = "Name of resource group"
}
variable "location" {
 type = string
 description = "Azure location of storage account
environment"
 default = "westus2"
}
variable "sa-name" {
 type = string
 description = "Name of storage account"
}