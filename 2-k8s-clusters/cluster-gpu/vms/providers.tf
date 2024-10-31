terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">=0.66.3"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox.endpoint
  # using PROXMOX_VE_USERNAME instead of api token
  # https://github.com/Telmate/terraform-provider-proxmox/issues/764
  # see .envrc
  #api_token = var.proxmox.api_token
  insecure = var.proxmox.insecure
  tmp_dir  = "/tmp"
  ssh {
    agent    = true
    username = var.proxmox.username
  }
}