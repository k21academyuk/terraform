variable "resourceGroupName" {
 type = string
 description = "name of resource group"
}
variable "location" {
 type = string
 description = "location of your resource group"
}

variable "vm_size" {
 type = map
 default = {
 default = "Standard_DS1_v2"
 dev = "Standard_DS2_v2"
 prod = "Standard_DS3_v2"
 }
}
