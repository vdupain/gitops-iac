variable "pve_endpoint" {
  type = string
}
variable "pve_api_token" {
  type = string
}
variable "pve_api_user" {
  type = string
}
variable "pve_nodes" {
  type = list(string)
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
variable "vm_ip_offset" {
    type = number
}
variable "dns" {
  type = list(string)
  default = ["10.60.64.1", "10.60.64.2"]
}
variable "net_vlan_dev" {
    type = number
    default = 43
}
variable "net_vlan_devops" {
    type = number
    default = 44
}
variable "net_vlan_staging" {
    type = number
    default = 45
}
variable "net_cidr_dev" {
    type = string
    default = "10.60.128.128/26"
}
variable "net_cidr_devops" {
    type = string
    default = "10.60.128.192/26"
}
variable "net_cidr_staging" {
    type = string
    default = "10.60.193.0/24"
}
variable "net_cidr_prefix_dev" {
    type = number
    default = 26
}
variable "net_cidr_prefix_devops" {
    type = number
    default = 26
}
variable "net_cidr_prefix_staging" {
    type = number
    default = 24
}
variable "net_gateway_dev" {
    type = string
    default = "10.60.128.190"
}
variable "net_gateway_devops" {
    type = string
    default = "10.60.128.254"
}
variable "net_gateway_staging" {
    type = string
    default = "10.60.193.254"
}

