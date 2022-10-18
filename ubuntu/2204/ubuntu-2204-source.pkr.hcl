source "vsphere-iso" "ubuntu-server" {
  vcenter_server      = var.vcenter_server
  username            = var.vcenter_username
  password            = var.vcenter_password
  insecure_connection = var.vcenter_insecure_connection
  iso_url             = var.iso_url
  iso_checksum        = var.iso_checksum
  ssh_username        = var.vm_username
  ssh_password        = var.vm_password
  host                = var.esxi_host
  datastore           = var.datastore

  shutdown_command = "shutdown -P now"

  # VM Settings
  vm_name = var.vm_name
  storage {
    disk_size             = 20480
    disk_controller_index = 0
    disk_thin_provisioned = true
  }


}
