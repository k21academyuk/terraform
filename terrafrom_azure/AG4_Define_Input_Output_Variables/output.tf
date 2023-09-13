output "public-ip" {
 description = "Public IP Address of Virtual Machine"
 value = azurerm_public_ip.publicip.ip_address
}
output "vnet-info" {
 description = "Vnet Information"
 value = var.vnet_info
}