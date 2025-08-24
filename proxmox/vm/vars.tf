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

variable "cpu_cores" {
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
  default = "local-lvm"
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
variable "boot_disk_size"{
  type = number
  default = 30
}
variable "cpu_type"{
  type =  string
  default = "x86-64-v2-AES"
}
variable "boot_disk_interface"{
  type = string
  default = "virtio0"
}
variable "protection"{
  type = bool
  default =false
  description ="(Optional) Sets the protection flag of the VM. This will disable the remove VM and remove disk operations (defaults to false).Optional) Sets the protection flag of the VM. This will disable the remove VM and remove disk operations (defaults to false)."
}

variable "additional_disks"{
  description = "Map of disk file definitions"
  type = map(object({
    datastore_id      = optional(string,null)
    path_in_datastore = optional(string,null)
    file_format       = optional(string,null)
    size              = optional(number,null)
    interface = string
    backup = optional(bool,true)
  }))
  default = null
}