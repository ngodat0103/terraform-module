output "ip_address" {
  value = var.ip_address
}
output "mac_addresses"{
  value = proxmox_virtual_environment_vm.vm_general.mac_addresses[0]
}