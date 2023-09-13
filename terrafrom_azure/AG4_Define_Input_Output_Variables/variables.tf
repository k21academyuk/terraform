variable "location" {}
variable "admin_username" {
 type = string
 description = "Administrator user name for virtual machine"
}

variable "admin_password" {
 type = string
 description = "Password must meet Azure complexity
requirements"
}

variable "vnet_address_space" {
 type = list
 description = "Address space for Virtual Network"
 default = ["10.0.0.0/16"]
}

variable "vnet_info" {
 type = tuple([string, bool, list(string)])
 description = "Vnet Information"
}


variable "managed_disk_type" {
 type = map
 description = "Disk type Premium in Primary location Standard
in DR location"
 default = {
 westus2 = "Premium_LRS"
 eastus = "Standard_LRS"
 }
}

variable "os" {
 description = "OS image to deploy"
 type = object({
 publisher = string
 offer = string
 sku = string
 version = string
 })
}

