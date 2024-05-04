resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  name      = var.vm_name
  node_name = var.pve_target_node
  vm_id     = var.vm_id

  started = false
  
  cpu {
    type    = var.vm_cpu_type
    cores   = var.vm_cpu_cores_number
    sockets = var.vm_socket_number
    flags   = []
  }

  memory {
    dedicated = var.vm_memory_max
  }

  disk {
    datastore_id = "lvm-thin"
    #file_id      = "local:iso/jammy-server-cloudimg-amd64.img"
    #file_id      = proxmox_virtual_environment_file.ubuntu_cloud_image.id
    interface    = "scsi0"
    iothread     = true
    discard      = "ignore"
    size         = var.vm_disk_size
    file_format  = "raw"
  }

  network_device {
    bridge = "vmbr0"
    #tag    = ??
  }

  initialization {
    # ip_config {
    #   ipv4 {
    #     address = "dhcp"
    #   }
    # }

    datastore_id         = "local"
    interface            = "ide2"
    #user_data_file_id    = proxmox_virtual_environment_file.cloud_user_config.id
    #meta_data_file_id    = proxmox_virtual_environment_file.cloud_meta_config.id
  }
}

# resource "proxmox_virtual_environment_file" "cloud_user_config" {
#   content_type = "snippets"
#   datastore_id = "local"
#   node_name    = var.pve_target_node

#   source_raw {
#     data = file("cloud-init/user_data")
#     file_name = "${var.vm_hostname}-ci-user.yml"
#   }
# }

# resource "proxmox_virtual_environment_file" "cloud_meta_config" {
#   content_type = "snippets"
#   datastore_id = "local"
#   node_name    = var.pve_target_node

#   source_raw {
#     data = templatefile("cloud-init/meta_data",
#       {
#         instance_id    = sha1(var.vm_hostname)
#         local_hostname = var.vm_hostname
#       }
#     )
#     file_name = "${var.vm_hostname}-ci-meta_data.yml"
#   }
# }

# resource "proxmox_virtual_environment_file" "ubuntu_cloud_image" {
#   content_type = "iso"
#   datastore_id = "local"
#   node_name    = var.pve_target_node

#   source_file {
#     path = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
#   }
# }
