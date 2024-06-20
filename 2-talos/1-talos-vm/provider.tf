terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">=0.60.0"
    }
  }
}

provider "proxmox" {
  endpoint  = var.pve_endpoint
  # using PROXMOX_VE_USERNAME instead of api token
  # https://github.com/Telmate/terraform-provider-proxmox/issues/764
  # see .envrc
  #api_token = var.pve_api_token
  insecure  = true
  tmp_dir  = "/tmp"
  ssh {
    agent    = true
    username = var.pve_api_user
  }
}