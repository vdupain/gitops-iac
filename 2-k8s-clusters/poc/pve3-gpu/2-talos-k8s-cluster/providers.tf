terraform {
  required_providers {
    talos = {
      source  = "siderolabs/talos"
      version = "0.6.1"
    }
  }
}

provider "talos" {}
