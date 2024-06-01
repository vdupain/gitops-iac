resource "proxmox_virtual_environment_download_file" "rocky_cloud_image" {
  content_type          = "iso"
  datastore_id          = "local"
  node_name             = var.pve_target_node
  overwrite             = false
  overwrite_unmanaged   = false
  url                   = "https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud-Base.latest.x86_64.qcow2"
  file_name             = "rocky9.img"
  checksum              = "39277948d53a10f1087454a1e0ed1c9bb48b48f6a4ddbf5113adc36f70be6730"
  checksum_algorithm    = "sha256"
}
