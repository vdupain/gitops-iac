resource "proxmox_virtual_environment_vm" "ubuntu_vm" {

  count       = var.vm_count
  name        = "${var.vm_name}-${count.index}"
  node_name   = var.pve_nodes[count.index]
  description = "Managed by Terraform"
  tags        = ["terraform", "ubuntu"]

  started = true
  on_boot = true

  machine       = "q35"
  scsi_hardware = "virtio-scsi-single"
  bios          = "seabios"

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
    file_id      = proxmox_virtual_environment_download_file.ubuntu_cloud_image[count.index].id
  }
  
  boot_order = ["scsi0"]

  operating_system {
    type = "l26"
  }

  initialization {
    ip_config {
      ipv4 {
        address = join("/", [cidrhost(var.net_cidr, count.index + var.vm_ip_offset), var.net_cidr_prefix])
        gateway = var.net_gateway
      }
      ipv6 {
        address = "dhcp"
      }
    }

    dns {
      servers = var.dns
    }

    datastore_id      = var.vm_datastore_id
    user_data_file_id = "local:snippets/ubuntu-user.yml"
    meta_data_file_id = "local:snippets/ubuntu-meta_data.yml"
  }
}
