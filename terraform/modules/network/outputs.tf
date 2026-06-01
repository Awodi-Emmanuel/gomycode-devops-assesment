output "subnet_id" {
  description = "ID of the subnet"
  value       = azurerm_subnet.main.id
}

output "network_interface_id" {
  description = "ID of the network interface"
  value       = azurerm_network_interface.main.id
}

output "public_ip_address" {
  description = "Public IP address"
  value       = azurerm_public_ip.main.ip_address
}
