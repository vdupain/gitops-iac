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
    cpu           = number
    ram_dedicated = number
    disk_size     = number
    gpu           = optional(bool, false)
    install_disk  = string
    hostname      = optional(string)
  }))
}
