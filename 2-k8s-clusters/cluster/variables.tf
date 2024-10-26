variable "proxmox" {
  type = object({
    endpoint  = string
    insecure  = bool
    username  = string
    api_token = string
  })
  sensitive = true
}

variable "cluster" {
  description = "Cluster configuration"
  type = object({
    gateway  = string
    name     = string
    endpoint = string
  })
}

variable "vms" {
  description = "Configuration for vms"
  type = map(object({
    host_node     = string
    machine_type  = string
    datastore_id  = optional(string, "local-lvm")
    ip            = string
    vm_id         = number
    cpu           = number
    ram_dedicated = number
    disk_size     = number
    gpu           = optional(bool, false)
  }))
}

variable "nodes" {
  description = "Configuration for k8s nodes"
  type = map(object({
    install_disk = string
    hostname     = optional(string)
    machine_type = string
    ip           = string
    gpu          = optional(bool, false)
  }))
}
