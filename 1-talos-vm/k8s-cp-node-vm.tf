resource "proxmox_virtual_environment_vm" "k8s-control-plane" {
  count     = var.vm_count_k8s_cp
  name      = "k8s-cp-${count.index}"
  node_name = "pved${sum([1, count.index])}"

  vm_id     = sum([var.vm_first_vm_id_k8s_cluster, count.index])
  description = "Managed by Terraform"
  tags        = ["terraform", "talos", "k8s-cp"]

  started = true
  on_boot = true
  
  agent {
    enabled = false
  }

  cpu {
    type    = var.vm_cpu_type_k8s_cp
    cores   = var.vm_cpu_cores_number_k8s_cp
    sockets = var.vm_socket_number_k8s_cp
  }

  memory {
    dedicated = var.vm_memory_k8s_cp
  }

  disk {
    datastore_id = var.vm_datastore_id_k8s_cp
    file_id      = "local:iso/nocloud-amd64-v1.7.1.img"
    interface    = "scsi0"
    discard      = "ignore"
    size         = var.vm_disk_size_k8s_cp
    file_format  = "raw"
  }

  network_device {
    bridge    = "vmbr0"
    vlan_id   = var.net_vlan_devops
  }

  machine =  "q35"

  operating_system {
    type = "l26"
  }

  initialization {
     ip_config {
       ipv4 {
          address = join("/", [cidrhost(var.net_cidr_devops, count.index + var.vm_ip_offset_k8s_cluster), var.net_cidr_prefix_devops ])
          gateway = var.net_gateway_devops
       }
     }

    dns {
      servers = var.dns
    }   

    datastore_id         = var.vm_datastore_id_k8s_cp
    interface            = "ide2"
  }
}
