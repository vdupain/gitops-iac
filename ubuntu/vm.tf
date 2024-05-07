resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  count     = var.vm_count
  name      = "${var.vm_name}-${count.index}"
  node_name = var.pve_target_node
  vm_id     = sum([var.vm_id, count.index])

  started = true
  on_boot = false
  
  agent {
    enabled = false
  }

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
    file_id      = "local:iso/jammy-server-cloudimg-amd64.img"
    #file_id      = proxmox_virtual_environment_file.ubuntu_cloud_image.id
    interface    = "scsi0"
    discard      = "ignore"
    size         = var.vm_disk_size
    file_format  = "raw"
  }

  network_device {
    bridge = "vmbr0"
  }

  machine =  "q35"

  operating_system {
    type = "l26"
  }

  initialization {
     ip_config {
       ipv4 {
         address = "dhcp"
         #address = "192.168.10.20${count.index}/24"
         #gateway = "192.168.10.1"
       }
     }

    datastore_id         = "lvm-thin"
    interface            = "ide2"
    user_data_file_id    = proxmox_virtual_environment_file.cloud_user_config.id
    #meta_data_file_id    = proxmox_virtual_environment_file.cloud_meta_config.id
  }
}
