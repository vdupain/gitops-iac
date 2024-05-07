resource "proxmox_virtual_environment_file" "ubuntu_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.pve_target_node
  overwrite = true

  source_file {
    path = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
    checksum = "da76b0ef1cd45939f0d14ca11dd4dfabbe13b94d2ec144d54c805d1baf852e67"
  }
}
