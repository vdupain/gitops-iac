resource "proxmox_virtual_environment_file" "cloud_user_config" {
  count        = length(var.pve_nodes) 
  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.pve_nodes[count.index]

  source_raw {
    data = file("cloud-init/user_data")
    file_name = "rocky-user.yml"
  }
}

resource "proxmox_virtual_environment_file" "cloud_meta_config" {
  count        = length(var.pve_nodes) 
  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.pve_nodes[count.index]

  source_raw {
    data = templatefile("cloud-init/meta_data",
      {
        instance_id    = sha1(var.vm_hostname)
        local_hostname = var.vm_hostname
      }
    )
    file_name = "rocky-meta_data.yml"
  }
}
