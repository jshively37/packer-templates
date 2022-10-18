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
