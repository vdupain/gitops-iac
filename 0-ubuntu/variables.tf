variable "pve_endpoint" {
  type = string
}
variable "pve_api_token" {
  type = string
}
variable "pve_api_user" {
  type = string
}
variable "pve_target_node" {
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
variable "vm_socket_number" {
  type = number
}
variable "vm_hostname" {
  type = string
}
variable "vm_count" {
    type = number
    default = 1
}