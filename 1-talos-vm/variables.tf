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
variable "vm_datastore_id" {
  type = string
}
variable "vm_cp_count" {
    type = number
}
variable "vm_worker_count" {
    type = number
}