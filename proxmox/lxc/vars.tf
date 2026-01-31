variable "node_name" {
  description = "Proxmox node name"
  type        = string
  default     = "pve"
}

variable "vm_id" {
  description = "Container VM ID"
  type        = number
  default     = null
}
variable "network_interface_name" {
  description = "interface name"
  type        = string
  default     = "eth0"
}
variable "network_interface_bridge" {
  description = "The network interface, default to vmbr0"
  type        = string
}

variable "hostname" {
  description = "Container hostname"
  type        = string
  default     = "terraform-provider-proxmox-ubuntu-container"
}

variable "container_disk_size" {
  description = "Container disk size in GB"
  type        = number
  default     = 4
}

variable "template_file_id" {
  description = "Template file id"
  type        = string
}

variable "mount_bind_volume" {
  description = "Bind mount volume path"
  type        = string
  default     = "/mnt/bindmounts/shared"
}

variable "mount_volume_name" {
  description = "Volume mount name"
  type        = string
}

variable "mount_volume_size" {
  description = "Volume mount size in GB"
  type        = number
  default     = 10
}
variable "tags" {
  type    = list(string)
  default = [""]
}

variable "mount_volume_path" {
  description = "Volume mount path inside container"
  type        = string
  default     = "/mnt/volume"
}
variable "ip_address" {
  type        = string
  description = "ip address"
}
variable "gateway" {
  type        = string
  description = "Gateway"
}
variable "cores" {
  type    = number
  default = 1
}
variable "memory" {
  default = 512
  type    = number
}
variable "datastore_id" {
  type    = string
  default = "local-lvm"
}
variable "operating_system_type" {
  type    = string
  default = "unmanaged"
}
variable "startup_config" {
  description = "Startup configuration for the VM"
  type = object(
    {
      order      = number
      up_delay   = number
      down_delay = number
    }
  )
  default = {
    order      = 3
    up_delay   = 60
    down_delay = 60
  }
}
variable "protection" {
  description = ""
  default     = false
  type        = bool
}
variable "description" {
  default = "Managed by Terraform"
  type    = string
}
