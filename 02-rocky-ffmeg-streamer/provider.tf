terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">=0.54.0"
    }
  }
}

provider "proxmox" {
  endpoint  = var.pve_endpoint
  #api_token = var.pve_api_token
  username = "root@pam"
  password = "vince"
  insecure  = true
  tmp_dir  = "/tmp"
  ssh {
    agent    = true
    username = var.pve_api_user
  }
}