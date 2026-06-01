output "public_ip_address" {
  description = "Public IP address of the VM"
  value       = module.network.public_ip_address
}

output "ssh_command" {
  description = "SSH command to connect"
  value       = "ssh ${var.admin_username}@${module.network.public_ip_address}"
}

output "vm_name" {
  description = "Name of the VM"
  value       = module.compute.vm_name
}
