
resource "proxmox_virtual_environment_network_linux_bridge" "default" {
  node_name = var.node_name
  name      = var.bridge_name
  address = var.bridge_address
  comment = var.bridge_comment
  ports = []
}