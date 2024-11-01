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
    name    = string
    gateway  = optional(string)
    gateway_v6  = optional(string)
    cidr     = number
    cidr_v6     = number
    vlan_id = optional(number, null)
  })
}

variable "vms" {
  description = "Configuration for cluster nodes"
  type = map(object({
    host_node      = string
    machine_type   = string
    datastore_id   = optional(string, "local-lvm")
    ip             = string
    ipv6           = string
    cpu            = number
    ram_dedicated  = number
    os_disk_size   = number
    data_disk_size = number
    gpu            = optional(bool, false)
  }))
}

variable "pci" {
  description = "Configuration mapping PCI"
  type = map(object({
    name         = string
    id           = string
    iommu_group  = number
    node         = string
    path         = string
    subsystem_id = string
  }))
}
