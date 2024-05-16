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
variable "dns" {
  type = list(string)
  default = ["192.168.10.1"]
}
variable "net_vlan" {
    type = number
    default = 43
}
variable "net_cidr" {
    type = string
    default = "192.168.10.1/24"
}
variable "net_cidr_prefix_" {
    type = number
    default = 24
}
variable "net_gateway" {
    type = string
    default = "192.168.10.1"
}
variable "vm_first_vm_id_k8s_cluster" {
    type = number
    default = 5000
}
variable "vm_ip_offset_k8s_cluster" {
    type = number
    default = 1
}
variable "vm_count_k8s_cp" {
    type = number
    default = 3
}
variable "vm_count_k8s_worker" {
    type = number
    default = 3
}
variable "vm_cpu_type_k8s_cp" {
    type = string
    default = "host"
}
variable "vm_cpu_type_k8s_worker" {
    type = string
    default = "host"
}
variable "vm_cpu_cores_number_k8s_cp" {
    type = number
    default = 4
}
variable "vm_cpu_cores_number_k8s_worker" {
    type = number
    default = 2
}
variable "vm_socket_number_k8s_cp" {
    type = number
    default = 1
}
variable "vm_socket_number_k8s_worker" {
    type = number
    default = 1
}
variable "vm_memory_k8s_cp" {
    type = number
    default = 4096
}
variable "vm_memory_k8s_worker" {
    type = number
    default = 2048
}
variable "vm_disk_size_k8s_cp" {
    type = number
    default = 30
}
variable "vm_disk_size_k8s_worker" {
    type = number
    default = 30
}
variable "vm_datastore_id_k8s_cp" {
    type = string
    default = "local-lvm"
}
variable "vm_datastore_id_k8s_worker" {
    type = string
    default = "local-lvm"
}
