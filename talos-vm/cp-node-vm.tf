resource "proxmox_virtual_environment_vm" "talos-controle-plane" {
  count     = 2
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
    cores   = var.vm_cpu_cores_number
    sockets = var.vm_socket_number
    flags   = []
  }

  memory {
    dedicated = var.vm_memory_max
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = "local:iso/nocloud-amd64-v1.7.1.img"
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

    datastore_id         = "local-lvm"
    interface            = "ide2"
  }
}
