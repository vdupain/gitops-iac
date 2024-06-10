resource "proxmox_virtual_environment_vm" "k8s-worker-gpu" {

  count     = var.vm_count_k8s_worker_gpu
  name      = "k8s-worker-gpu-${count.index}"
  node_name = "pve3"
  vm_id     = sum([var.vm_first_vm_id_k8s_cluster, count.index + var.vm_count_k8s_cp + var.vm_count_k8s_worker])
  description = "Managed by Terraform"
  tags        = ["terraform", "talos", "k8s-worker-gpu"]

  started = true
  on_boot = false
  
  agent {
    enabled = true
  }

  cpu {
    type    = var.vm_cpu_type_k8s_worker_gpu
    cores   = var.vm_cpu_cores_number_k8s_worker_gpu
    sockets = var.vm_socket_number_k8s_worker_gpu
  }

  memory {
     dedicated = var.vm_memory_k8s_worker_gpu
 }

  disk {
    datastore_id = var.vm_datastore_id_k8s_worker_gpu
    file_id      = "truenas:iso/nocloud-amd64-nvidia-v1.7.4.img"
    interface    = "scsi0"
    discard      = "ignore"
    size         = var.vm_disk_size_k8s_worker_gpu
    file_format  = "raw"
  }

  network_device {
    bridge    = "vmbr0"
  }

  machine =  "q35"

  operating_system {
    type = "l26"
  }

  hostpci {
      device   = "hostpci0"
      mapping  = "nvidia_3060"
      pcie     = true
      rombar   = true
      xvga     = false
    }

  initialization {
     ip_config {
       ipv4 {
          address = join("/", [cidrhost(var.net_cidr, count.index + var.vm_ip_offset_k8s_cluster + var.vm_count_k8s_cp + var.vm_count_k8s_worker), var.net_cidr_prefix ])
          gateway = var.net_gateway
       }
     }

    dns {
      servers = var.dns
    }   

    datastore_id         = var.vm_datastore_id_k8s_worker_gpu
    interface            = "ide2"
  }

}
