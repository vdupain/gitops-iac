resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  depends_on = [proxmox_virtual_environment_download_file.ubuntu_cloud_image,proxmox_virtual_environment_file.cloud_user_config, proxmox_virtual_environment_file.cloud_meta_config]

  count     = var.vm_count
  name      = "${var.vm_name}-${count.index}"
  node_name = "pve${(count.index % 3)}"
  vm_id     = sum([1000, count.index])
  description = "Managed by Terraform"
  tags        = ["terraform", "ubuntu"]

  started = true
  on_boot = false
  
  agent {
    enabled = false
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
    file_id      = "local:iso/jammy-server-cloudimg-amd64.img"
    interface    = "scsi0"
    discard      = "ignore"
    size         = var.vm_disk_size
    file_format  = "raw"
  }

  network_device {
    bridge = "vmbr0"
    #vlan_id   = var.net_vlan
  }

  machine =  "q35"

  operating_system {
    type = "l26"
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
    user_data_file_id    = "local:snippets/ubuntu-user.yml"
    meta_data_file_id    = "local:snippets/ubuntu-meta_data.yml"
  }
}
