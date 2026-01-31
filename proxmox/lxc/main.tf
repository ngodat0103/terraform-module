resource "proxmox_virtual_environment_container" "container" {
  description = var.description
  cpu {
    cores = var.cores
  }
  memory {
    dedicated = var.memory
  }

  node_name = var.node_name
  vm_id     = var.vm_id
  tags      = var.tags

  initialization {
    hostname = var.hostname
    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.gateway
      }
    }
    user_account {
      keys = [
        trimspace(tls_private_key.ubuntu_container_key.public_key_openssh)
      ]
      password = random_password.ubuntu_container_password.result
    }
  }

  network_interface {
    name   = var.network_interface_name
    bridge = var.network_interface_bridge
  }

  disk {
    datastore_id = var.mount_volume_name
    size         = var.mount_volume_size
  }

  operating_system {
    template_file_id = var.template_file_id
    # Or you can use a volume ID, as obtained from a "pvesm list <storage>"
    # template_file_id = "local:vztmpl/jammy-server-cloudimg-amd64.tar.gz"
    type = var.operating_system_type
  }
  startup {
    order      = var.startup_config.order
    up_delay   = var.startup_config.up_delay
    down_delay = var.startup_config.down_delay
  }
  protection = var.protection

  lifecycle {
    ignore_changes = [operating_system]
  }
}
resource "random_password" "ubuntu_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "tls_private_key" "ubuntu_container_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}