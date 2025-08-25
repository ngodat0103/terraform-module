

resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.node_name
  source_raw {
    data      = <<-EOF
    #cloud-config
    hostname: ${var.hostname}
    timezone: Asia/Ho_Chi_Minh
    users:
      - name: root
        shell: /bin/bash
        ssh_authorized_keys:
          - ${var.public_key}
    package_update: true
    EOF
    file_name = "${var.name}-cloud-config.yaml"
  }
}

resource "proxmox_virtual_environment_vm" "vm_general" {
  name        = var.name
  description = var.description
  tags        = var.tags
  protection  = var.protection
  node_name   = var.node_name
  vm_id       = var.vm_id

  agent {
    # read 'Qemu guest agent' section, change to true only when ready
    enabled = false
    timeout = "3m"
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true
  startup {
    order      = var.startup_config.order
    up_delay   = var.startup_config.up_delay
    down_delay = var.startup_config.down_delay
  }

  cpu {
    cores = var.cpu_cores
    type  = var.cpu_type
  }

  memory {
    dedicated = var.memory
    #floating  = 2048 # set equal to dedicated to enable ballooning
  }
  disk {
    datastore_id = var.datastore_id
    import_from  = var.template_image_id
    size         = var.boot_disk_size
    interface    = var.boot_disk_interface
  }

  dynamic "disk" {
    for_each = var.additional_disks != null ? var.additional_disks : {}
    content {
      datastore_id      = disk.value["datastore_id"]
      path_in_datastore = disk.value["path_in_datastore"]
      file_format       = disk.value["file_format"]
      size              = disk.value["size"]
      interface         = disk.value["interface"]
      backup            = disk.value["backup"]
      replicate = disk.value["replicate"]
    }
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.ip_address != "" ? var.ip_address : "dhcp"
        gateway = var.gateway != "" ? var.gateway : ""
      }
    }
    datastore_id = var.datastore_id

    user_data_file_id = resource.proxmox_virtual_environment_file.user_data_cloud_config.id
  }

  network_device {
    bridge = var.bridge_name
  }

  operating_system {
    type = "l26" #Linux Kernel 2.6 - 5.X.
  }

  tpm_state {
    version      = "v2.0"
    datastore_id = var.datastore_id
  }

  serial_device {}
}
