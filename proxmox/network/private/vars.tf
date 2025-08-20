variable "node_name" {
  description = "Name of the Proxmox node"
  type        = string
  default     = "pve"
}

variable "bridge_name" {
  description = "Name of the Linux bridge"
  type        = string
}

variable "bridge_address" {
  description = "IP address and subnet for the bridge"
  type        = string
}

variable "bridge_comment" {
  description = "Comment for the bridge"
  type        = string
  default     = "vmbr99 comment"
}
variable "is_dhcp_enabled"{
  type = bool
  default = false
}