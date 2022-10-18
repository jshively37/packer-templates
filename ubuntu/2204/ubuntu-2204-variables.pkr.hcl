#
# vCenter and ESXi Variables
#

variable "vcenter_username" {
  type        = string
  description = "The username for vCenter"
}

variable "vcenter_password" {
  type        = string
  description = "The password for vCenter"
}

variable "vcenter_server" {
  type        = string
  description = "The IP or FQDN for vCenter"
}

variable "vcenter_insecure_connection" {
  type        = bool
  description = "Validate certificate"
  default     = false
}

variable "esxi_host" {
  type        = string
  description = "ESXi host to target"
}

variable "datastore" {
  type        = string
  description = "Datastore"
}

#
# ISO Variables
#
variable "iso_url" {
  type        = string
  description = "URL location for ISO"
}

variable "iso_checksum" {
  type        = string
  description = "Checksum for ISO"
}

#
# VM Variables
#
variable "vm_name" {
  type        = string
  description = "Name of the VM"
}

variable "vm_username" {
  type        = string
  description = "Username for VM"
}

variable "vm_password" {
  type        = string
  description = "Password for VM"
}

variable "vm_disk_size" {
  type        = number
  description = "Size of VM Disk"
}

variable "vm_cpus" {
  type        = number
  description = "Number of CPUs for the VM"
}

variable "vm_ram" {
  type        = number
  description = "Number of RAM in megabytes for the VM"
}
