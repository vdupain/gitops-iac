terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">=0.65.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox.endpoint
  api_token = var.proxmox.api_token
  insecure = var.proxmox.insecure
  tmp_dir  = "/tmp"
  ssh {
    agent    = true
    username = var.proxmox.username
  }
}