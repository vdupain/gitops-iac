# provider "proxmox" {
#   endpoint = var.pve_endpoint
#   # using PROXMOX_VE_USERNAME instead of api token
#   # https://github.com/Telmate/terraform-provider-proxmox/issues/764
#   #api_token = var.pve_api_token
#   insecure = true
#   tmp_dir  = "/tmp"
#   ssh {
#     agent    = false
#   #  username = "root"
#   #  password = "vince"
#   }
# }
provider "proxmox" {
  endpoint      = var.proxmox.endpoint
  api_token     = var.proxmox.api_token
  insecure      = var.proxmox.insecure
  tmp_dir       = "/tmp"
  random_vm_ids = true
  ssh {
    agent    = false
    username = var.proxmox.username
    password = var.proxmox.password
  }
}