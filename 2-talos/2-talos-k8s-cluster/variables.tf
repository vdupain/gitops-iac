variable "cluster" {
  description = "Cluster configuration"
  type = object({
    name     = string
    endpoint = string
  })
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
    workers_gpu = map(object({
      gpu = optional(string)
    }))
  })
  default = {
    controlplanes = {
      "192.168.10.220" = {
        install_disk = "/dev/sda"
        hostname     = "cp-0"
      },
      "192.168.10.221" = {
        install_disk = "/dev/sda"
        hostname     = "cp-1"
      },
      "192.168.10.222" = {
        install_disk = "/dev/sda"
        hostname     = "cp-2"
      }
    }
    workers = {
      "192.168.10.223" = {
        install_disk = "/dev/sda"
        hostname     = "worker-0"
      },
      "192.168.10.224" = {
        install_disk = "/dev/sda"
        hostname     = "worker-1"
      },
      "192.168.10.225" = {
        install_disk = "/dev/sda"
        hostname     = "worker-2"
      },
      "192.168.10.226" = {
        install_disk = "/dev/sda"
        hostname     = "worker-gpu"
      }
    }
    workers_gpu = {
      "192.168.10.226" = {
        gpu = "nvidia"
      }
    }
  }
}
