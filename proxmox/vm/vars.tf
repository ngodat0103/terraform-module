variable "name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "description" {
  description = "A description for the virtual machine."
  type        = string
  default = ""
}

variable "tags" {
  description = "Tags to assign to the virtual machine."
  type        = list(string)
  default     = []
}

variable "node_name" {
  description = "The Proxmox node where the VM will be created."
  type        = string
}

variable "vm_id" {
  description = "The unique ID for the virtual machine."
  type        = number
}

variable "cores" {
  description = "The number of CPU cores for the virtual machine."
  type        = number
}

variable "memory" {
  description = "The amount of memory (in MB) for the virtual machine."
  type        = number
}

variable "datastore_id" {
  description = "The datastore ID where the VM's disk will be stored."
  type        = string
}

variable "template_image_id" {
  description = "The ID of the template image to use for the VM."
  type        = string
}

variable "bridge_name" {
  description = "The name of the network bridge to attach the VM to."
  type        = string
}
variable "ip_address"{
        type = string
        default = "dhcp"
}
variable "gateway"{
        type = string
        default = ""
}
variable "hostname"{
        type = string
        
}
variable "public_key"{
  type = string
}