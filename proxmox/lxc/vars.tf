variable "node_name" {
  description = "Proxmox node name"
  type        = string
  default     = "pve"
}

variable "vm_id" {
  description = "Container VM ID"
  type        = number
  default     = 1234
}
variable "network_interface_name"{
  description = "interface name"
  type = string
}
variable "network_interface_bridge"{
  description = "The network interface, default to vmbr0"
  type = string
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

variable "mount_bind_path" {
  description = "Bind mount path inside container"
  type        = string
  default     = "/mnt/shared"
}

variable "mount_volume_name" {
  description = "Volume mount name"
  type        = string
  default     = "local-lvm"
}

variable "mount_volume_size" {
  description = "Volume mount size"
  type        = string
  default     = "10G"
}

variable "mount_volume_path" {
  description = "Volume mount path inside container"
  type        = string
  default     = "/mnt/volume"
}
variable "ip_address"{
        type = string
        description = "ip address"
}
variable "gateway" {
        type = string
        description ="Gateway"
}
variable "cores"{
        type = number
        default = 1
}
variable "memory"{
        default = 512
        type = number
}
