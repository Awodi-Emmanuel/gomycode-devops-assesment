output "vm_id" {
  description = "ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.main.id
}

output "vm_name" {
  description = "Name of the virtual machine"
  value       = azurerm_linux_virtual_machine.main.name
}

output "public_ip" {
  description = "Public IP of the VM"
  value       = azurerm_linux_virtual_machine.main.public_ip_address
}
