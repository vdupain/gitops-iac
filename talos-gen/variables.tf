variable "cluster_name" {
  description = "A name to provide for the Talos cluster"
  type        = string
  default     = "talos-cluster"
}

variable "cluster_endpoint" {
  description = "The endpoint for the Talos cluster"
  type        = string
  default     = "https://192.168.10.240:6443"
}

variable "node_data" {
  description = "A map of node data"
  type = object({
    controlplanes = map(object({
      install_disk = string
      hostname     = optional(string)
    }))
    workers = map(object({
      install_disk = string
      hostname     = optional(string)
    }))
  })
  default = {
    controlplanes = {
      "192.168.10.240" = {
        install_disk = "/dev/sda"
        hostname     = "cp-1"
      },
      "192.168.10.241" = {
        install_disk = "/dev/sda"
        hostname     = "cp-2"
      }
    }
    workers = {
      "192.168.10.230" = {
        install_disk = "/dev/sda"
        hostname     = "worker-1"
      },
      "192.168.10.231" = {
        install_disk = "/dev/sda"
        hostname     = "worker-2"
      }
    }
  }
}
