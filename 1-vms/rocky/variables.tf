variable "proxmox" {
  type = object({
    endpoint  = optional(string)
    insecure  = optional(bool)
    username  = optional(string)
    password  = optional(string)
    api_token = optional(string)
  })
  sensitive = true
}

variable "pve_nodes" {
  type = list(string)
}
variable "vm_cpu_cores_number" {
  type = number
}
variable "vm_cpu_type" {
  type = string
}
variable "vm_datastore_id" {
  type = string
}
variable "vm_disk_size" {
  type = number
}
variable "vm_memory_max" {
  type = number
}
variable "vm_name" {
  type = string
}
variable "vm_socket_number" {
  type = number
}
variable "vm_hostname" {
  type = string
}
variable "vm_count" {
  type    = number
  default = 1
}
variable "vm_ip_offset" {
  type = number
}
variable "dns" {
  type    = list(string)
  default = ["192.168.10.4"]
}
variable "net_vlan" {
  type    = number
  default = 43
}
variable "net_cidr" {
  type    = string
  default = "192.168.10.0/24"
}
variable "net_cidr_prefix" {
  type    = number
  default = 24
}
variable "net_gateway" {
  type    = string
  default = "192.168.10.1"
}

