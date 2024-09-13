variable "cluster" {
  description = "Cluster configuration"
  type = object({
    name     = string
    endpoint = string
  })
}

variable "controlplanes" {
  description = "Configuration for worker nodes"
  type = map(object({
    install_disk = string
    hostname     = optional(string)
    gpu          = optional(bool, false)
  }))
}

variable "workers" {
  description = "Configuration for worker nodes"
  type = map(object({
    install_disk = string
    hostname     = optional(string)
    gpu          = optional(bool, false)
  }))
}
