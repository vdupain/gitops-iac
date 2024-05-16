resource "proxmox_virtual_environment_vm" "k8s-worker" {
  count     = var.vm_count_k8s_worker
  name      = "k8s-worker-${count.index}"
  node_name = "pved${sum([1, count.index])}"
  vm_id     = sum([var.vm_first_vm_id_k8s_cluster, count.index + var.vm_count_k8s_cp])
  description = "Managed by Terraform"
  tags        = ["terraform", "talos", "k8s-worker"]

  started = true
  on_boot = true
  
  agent {
    enabled = false
  }

  cpu {
    type    = var.vm_cpu_type_k8s_worker
    cores   = var.vm_cpu_cores_number_k8s_worker
    sockets = var.vm_socket_number_k8s_worker
  }

  memory {
     dedicated = var.vm_memory_k8s_worker
 }

  disk {
    datastore_id = var.vm_datastore_id_k8s_worker
    file_id      = "local:iso/nocloud-amd64-v1.7.1.img"
    interface    = "scsi0"
    discard      = "ignore"
    size         = var.vm_disk_size_k8s_worker
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
          address = join("/", [cidrhost(var.net_cidr_devops, count.index + var.vm_ip_offset_k8s_cluster + var.vm_count_k8s_cp), var.net_cidr_prefix_devops ])
          gateway = var.net_gateway_devops
       }
     }

    dns {
      servers = var.dns
    }   

    datastore_id         = var.vm_datastore_id_k8s_worker
    interface            = "ide2"
  }

}
