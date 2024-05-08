resource "proxmox_virtual_environment_vm" "talos-worker" {
  count     = var.vm_worker_count
  name      = "talos-worker-${count.index}"
  node_name = "pve1"
  vm_id     = sum([1110, count.index])

  started = true
  on_boot = false
  
  agent {
    enabled = false
  }

  cpu {
    type    = var.vm_cpu_type
    cores   = 4
    sockets = var.vm_socket_number
    flags   = []
  }

  memory {
    dedicated = 16384
  }

  disk {
    datastore_id = var.vm_datastore_id
    #file_id      = "local:iso/nocloud-amd64-v1.7.1.img"
    file_id      = proxmox_virtual_environment_download_file.talos_cloud_image.id
    interface    = "scsi0"
    discard      = "ignore"
    size         = 50
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
         address = "192.168.10.23${count.index}/24"
         gateway = "192.168.10.1"
       }
     }

    datastore_id         = var.vm_datastore_id
    interface            = "ide2"
  }
}
