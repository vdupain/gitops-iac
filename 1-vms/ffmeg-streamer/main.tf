resource "proxmox_virtual_environment_vm" "rocky_ffmpeg_streamer_vm" {

  count     = var.vm_count
  name      = "${var.vm_hostname}-${count.index}"
  node_name = var.pve_target_node
  vm_id     = var.vm_id
  description = "Managed by Terraform"
  tags        = ["terraform", "rocky"]

  started = true
  on_boot = true
  
  agent {
    enabled = true
  }

  cpu {
    type    = var.vm_cpu_type
    cores   = var.vm_cpu_cores_number
    sockets = var.vm_socket_number
  }

  memory {
    dedicated = var.vm_memory_max
  }

  disk {
    datastore_id = var.vm_datastore_id
    file_id      = "local:iso/rocky9.img"
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

  usb {
     #host = "08bb:29c0"
     mapping = "usb_audio_codec"
     usb3 = false
   }

  initialization {
     ip_config {
       ipv4 {
         address = join("/", [cidrhost(var.net_cidr, count.index + var.vm_ip_offset), var.net_cidr_prefix])
         gateway = var.net_gateway
       }
     }

    dns {
      servers = var.dns
    }   

    datastore_id         = var.vm_datastore_id
    interface            = "ide2"
    user_data_file_id    = proxmox_virtual_environment_file.cloud_user_config.id
    meta_data_file_id    = proxmox_virtual_environment_file.cloud_meta_config.id
  }

}
