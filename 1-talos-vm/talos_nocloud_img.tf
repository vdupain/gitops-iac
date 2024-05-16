resource "proxmox_virtual_environment_download_file" "talos_cloud_image" {
  count                     = length(var.pve_nodes) 
  content_type              = "iso"
  datastore_id              = "local"
  node_name                 = var.pve_nodes[count.index]
  overwrite                 = false
  overwrite_unmanaged       = false
  decompression_algorithm   = "zst"
  file_name                 = "nocloud-amd64-v1.7.1.img"
  url = "https://github.com/siderolabs/talos/releases/download/v1.7.1/nocloud-amd64.raw.xz"
  checksum                  = "fd32b81671753ef784de171e78c758c52659a4a72adaa9564722d310d2d7a615989817ff2704e22aa73246ca0265c27fbf398f7e5c9ff963891ba9e4e4cdf5f2"
  checksum_algorithm        = "sha512"  
}
