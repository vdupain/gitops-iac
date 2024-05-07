resource "proxmox_virtual_environment_vm" "talos-controle-plane" {
  count     = var.vm_cp_count
  name      = "talos-cp-${count.index}"
  node_name = var.pve_target_node
  vm_id     = sum([1100, count.index])

  started = true
  on_boot = false
  
  agent {
    enabled = false
  }

  cpu {
    type    = var.vm_cpu_type
    cores   = 2
    sockets = var.vm_socket_number
    flags   = []
  }

  memory {
    dedicated = 2048
  }

  disk {
    datastore_id = var.vm_datastore_id
    #file_id      = "local:iso/nocloud-amd64-v1.7.1.img"
    file_id      = proxmox_virtual_environment_download_file.talos_cloud_image.id
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
         #address = "dhcp"
         address = "192.168.10.24${count.index}/24"
         gateway = "192.168.10.1"
       }
     }

    datastore_id         = var.vm_datastore_id
    interface            = "ide2"
  }
}
