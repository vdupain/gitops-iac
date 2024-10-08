resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  count               = length(var.pve_nodes)
  content_type        = "iso"
  datastore_id        = "local"
  node_name           = var.pve_nodes[count.index]
  overwrite           = false
  overwrite_unmanaged = true
  url                 = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  #checksum              = "87fcf1ec874ef3e98807c79dffaf016037b9c8ab34d51a75109ac6a960f48b18"
  #checksum_algorithm    = "sha256"
}
