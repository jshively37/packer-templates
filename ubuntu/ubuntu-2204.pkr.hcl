variable "username" {
    type = string
    description = "The username for vCenter"
}

variable "password" {
    type = string
    description = "The password for vCenter"
}

variable "vcenter_server" {
    type = string
    description = "The IP or FQDN for vCenter"
}

variable "insecure_connection" {
    type = bool
    description = "Validate certificate"
    default = false
}

variable "esxi_host" {
	type = string
	description = "ESXi host to target"
}

packer {
  required_plugins {
    vmware = {
      version = ">= 1.0.3"
      source  = "github.com/hashicorp/vmware"
    }
  }
}

source "vsphere-iso" "ubuntu-server" {
  vcenter_server      = var.vcenter_server
  username            = var.username
  password            = var.password
  insecure_connection = var.insecure_connection
  iso_url             = "https://releases.ubuntu.com/22.10/ubuntu-22.10-beta-live-server-amd64.iso"
  iso_checksum        = "a9e9c95170827d96560d6aede0b09863575309c8749291073c1fe721fd32b690"
  ssh_username        = "packer"
  ssh_password        = "packer"
	host = var.esxi_host
	datastore = "direct_storage"

  shutdown_command    = "shutdown -P now"



	# VM Settings
	vm_name = "test"
  storage {
    disk_size = 20480
    disk_controller_index = 0
    disk_thin_provisioned = true
  }


}

build {
  sources = [
    "source.vsphere-iso.ubuntu-server"]
 }
