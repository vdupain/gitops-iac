variable "pve_endpoint" {
  type = string
}
variable "pve_api_token" {
  type = string
}
variable "pve_api_user" {
  type = string
}
variable "pve_node" {
  type = string
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
variable "vm_id" {
  type = number
}
variable "vm_memory_max" {
  type = number
}
variable "vm_memory_min" {
  type = number
}
variable "vm_name" {
  type = string
}
variable "vm_hostname" {
  type = string
}
variable "vm_ip" {
  type = number
}
variable "dns" {
  type    = list(string)
  default = ["192.168.10.4"]
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

