resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  count                     = length(var.pve_nodes) 
  content_type              = "iso"
  datastore_id              = "local"
  node_name                 = var.pve_nodes[count.index]
  overwrite                 = false
  url = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
  checksum = "1718f177dde4c461148ab7dcbdcf2f410c1f5daa694567f6a8bbb239d864b525"
  checksum_algorithm        = "sha256"
}
