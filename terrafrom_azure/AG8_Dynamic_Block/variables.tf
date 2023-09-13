variable "rg-name" {
 type = string
 description = "name of resource group"
}
variable "location" {
 type = string
 description = "location of your resource group"
}

variable "subnet_data" {
 default = {
 subnet1 = {
 name = "subnet1"
 address_prefixes = ["10.0.1.0/24"]
 }
 subnet2 = {
 name = "subnet2"
 address_prefixes = ["10.0.2.0/24"]
 }
 subnet3 = {
 name = "subnet2"
 address_prefixes = ["10.0.3.0/24"]
 }
 }
}


