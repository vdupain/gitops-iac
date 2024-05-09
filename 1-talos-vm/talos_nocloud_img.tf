# resource "proxmox_virtual_environment_download_file" "talos_cloud_image" {
#   content_type              = "iso"
#   datastore_id              = "local"
#   node_name                 = var.pve_target_node
#   overwrite                 = false
#   overwrite_unmanaged       = false
#   decompression_algorithm   = "zst"
#   file_name                 = "nocloud-amd64-v1.7.1.img"
#   url = "https://github.com/siderolabs/talos/releases/download/v1.7.1/nocloud-amd64.raw.xz"
# }

# resource "proxmox_virtual_environment_download_file" "talos_cloud_image_pve0" {
#   content_type              = "iso"
#   datastore_id              = "local"
#   node_name                 = "pve0"
#   overwrite                 = false
#   overwrite_unmanaged       = false
#   decompression_algorithm   = "zst"
#   file_name                 = "nocloud-amd64-v1.7.1.img"
#   url = "https://github.com/siderolabs/talos/releases/download/v1.7.1/nocloud-amd64.raw.xz"
# }
