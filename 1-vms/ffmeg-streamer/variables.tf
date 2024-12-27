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

variable "pve_node" {
  type = string
}
variable "vm_cpu_cores" {
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
variable "vm_memory" {
  type = number
}
variable "vm_name" {
  type = string
}
variable "vm_hostname" {
  type = string
}
variable "vm_ipv4_address" {
  type = string
}
variable "vm_ipv4_gateway" {
  type = string
}
variable "vm_dns" {
  type = list(string)
}
