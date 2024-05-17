resource "proxmox_virtual_environment_download_file" "rocky_cloud_image" {
  count                     = length(var.pve_nodes) 
  content_type              = "iso"
  datastore_id              = "local"
  node_name                 = var.pve_nodes[count.index]
  overwrite                 = false
  url = "https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud-Base.latest.x86_64.qcow2"
  file_name                 = "rocky9.img"
  #checksum = "1718f177dde4c461148ab7dcbdcf2f410c1f5daa694567f6a8bbb239d864b525"
  #checksum_algorithm        = "sha256"
}
