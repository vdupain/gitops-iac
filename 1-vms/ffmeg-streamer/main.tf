resource "proxmox_virtual_environment_vm" "rocky_ffmpeg_streamer_vm" {

  name        = "${var.vm_hostname}"
  node_name   = var.pve_node
  vm_id       = var.vm_id
  description = "Managed by Terraform"
  tags        = ["terraform", "rocky"]

  started = true
  on_boot = true

  machine = "q35"
  scsi_hardware = "virtio-scsi-single"
  bios          = "seabios"

  agent {
    enabled = true
  }

  cpu {
    type    = var.vm_cpu_type
    cores   = var.vm_cpu_cores_number
  }

  memory {
    dedicated = var.vm_memory_max
  }

  network_device {
    bridge = "vmbr0"
  }

  disk {
    datastore_id = var.vm_datastore_id
    interface    = "scsi0"
    iothread     = true
    cache        = "writethrough"
    discard      = "on"
    ssd          = true
    file_format  = "raw"
    size         = var.vm_disk_size
    file_id      = proxmox_virtual_environment_download_file.rocky_cloud_image.id
  }

  boot_order = ["scsi0"]

  operating_system {
    type = "l26"
  }

#  usb {
#    #host = "08bb:29c0"
#    mapping = "usb_audio_codec"
#    usb3    = false
#  }

  initialization {
    ip_config {
      ipv4 {
        address = join("/", [cidrhost(var.net_cidr, var.vm_ip), var.net_cidr_prefix])
        gateway = var.net_gateway
      }
    }

    dns {
      servers = var.dns
    }

    datastore_id      = var.vm_datastore_id
    interface         = "ide2"
    user_data_file_id = proxmox_virtual_environment_file.cloud_user_config.id
    meta_data_file_id = proxmox_virtual_environment_file.cloud_meta_config.id
  }

}
