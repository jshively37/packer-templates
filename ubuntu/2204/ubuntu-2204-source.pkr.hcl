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

  # VM Settings
  vm_name = var.vm_name
  CPUs    = var.vm_cpus
  RAM     = var.vm_ram

  storage {
    disk_size             = var.vm_disk_size
    disk_controller_index = 0
    disk_thin_provisioned = true
  }
  # http_directory = "http"
  http_content = {
    "/meta-data" = file("http/meta-data")
    "/user-data" = file("http/user-data")
  }
  boot_order = "disk,cdrom"
  boot_wait  = "10s"

  # Need to fix because it cuts off linux /c from command and does not read the preseed file
  boot_command = [
    "<esc><wait>",
    "linux /casper/vmlinuz --- autoinstall ds=\"nocloud-net;seedfrom=http://{{.HTTPIP}}:{{.HTTPPort}}/\"",
    "<enter><wait>",
    "initrd /casper/initrd",
    "<enter><wait>",
    "boot",
    "<enter>"
  ]
}
