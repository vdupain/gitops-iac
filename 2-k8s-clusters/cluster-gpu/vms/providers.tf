provider "proxmox" {
  endpoint  = var.proxmox.endpoint
  api_token = var.proxmox.api_token
  insecure  = var.proxmox.insecure
  tmp_dir   = "/tmp"
  ssh {
    agent    = true
    username = var.proxmox.username
  }
}