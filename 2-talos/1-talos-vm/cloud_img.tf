resource "proxmox_virtual_environment_download_file" "talos_cloud_image" {
  #count                     = length(var.pve_nodes) 
  #node_name                 = var.pve_nodes[count.index]
  node_name                 = var.pve_target_node
  content_type              = "iso"
  datastore_id              = "local"
  overwrite                 = false
  overwrite_unmanaged       = false
  decompression_algorithm   = "zst"
  file_name                 = "nocloud-amd64.img"
  url                       = "https://github.com/siderolabs/talos/releases/download/v1.7.6/nocloud-amd64.raw.xz"
  #checksum                  = "a83ac4e94262e43995e3ceb26074f28ea7f406443ec85f31038a8aa99c13802a6ca7a21eadee0ca7536a3f9f4e6d9b8d1a1808f05d3b8e73f632e39ba2332556"
  #checksum_algorithm        = "sha512"  
}
