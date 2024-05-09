resource "proxmox_virtual_environment_vm" "k8s-worker" {
  count     = var.vm_worker_count
  name      = "k8s-worker-${count.index}"
  node_name = "pve1"
  vm_id     = sum([2010, count.index])
  description = "Managed by Terraform"
  tags        = ["terraform", "talos", "k8s-worker"]

  started = true
  on_boot = true
  
  agent {
    enabled = false
  }

  cpu {
    type    = "host"
    cores   = 6
    sockets = 1
  }

  memory {
    dedicated = 16384
  }

  disk {
    datastore_id = var.vm_datastore_id
    file_id      = "local:iso/nocloud-amd64-v1.7.1.img"
    #file_id      = proxmox_virtual_environment_download_file.talos_cloud_image.id
    interface    = "scsi0"
    discard      = "ignore"
    size         = 30
    file_format  = "raw"
  }

  network_device {
    bridge    = "vmbr0"
    #vlan_id   = 44
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
