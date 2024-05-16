resource "proxmox_virtual_environment_vm" "ubuntu_vm_vlan_devops" {
  depends_on = [proxmox_virtual_environment_file.cloud_user_config, proxmox_virtual_environment_file.cloud_meta_config]

  count     = var.vm_count
  name      = "${var.vm_name}-vlan-devops-${count.index}"
  node_name = "pved${(count.index % 3) + 1}"
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
    vlan_id   = var.net_vlan_devops
  }

  machine =  "q35"

  operating_system {
    type = "l26"
  }

  initialization {
     ip_config {
       ipv4 {
         address = join("/", [cidrhost(var.net_cidr_devops, count.index + var.vm_ip_offset), var.net_cidr_prefix_devops ])
         gateway = var.net_gateway_devops
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

resource "proxmox_virtual_environment_vm" "ubuntu_vm_vlan_staging" {
  depends_on = [proxmox_virtual_environment_file.cloud_user_config, proxmox_virtual_environment_file.cloud_meta_config]

  count     = var.vm_count
  name      = "${var.vm_name}-vlan-staging-${count.index}"
  node_name = "pved${(count.index % 3) + 1}"
  vm_id     = sum([1010, count.index])
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
    vlan_id   = var.net_vlan_staging
  }

  machine =  "q35"

  operating_system {
    type = "l26"
  }

  initialization {
     ip_config {
       ipv4 {
         address = join("/", [cidrhost(var.net_cidr_staging, count.index + var.vm_ip_offset), var.net_cidr_prefix_staging ])
         gateway = var.net_gateway_staging
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

resource "proxmox_virtual_environment_vm" "ubuntu_vm_vlan_dev" {
  depends_on = [proxmox_virtual_environment_file.cloud_user_config, proxmox_virtual_environment_file.cloud_meta_config]

  count     = var.vm_count
  name      = "${var.vm_name}-vlan-dev-${count.index}"
  node_name = "pved${(count.index % 3) + 1}"
  vm_id     = sum([1020, count.index])
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
    vlan_id   = var.net_vlan_dev
  }

  machine =  "q35"

  operating_system {
    type = "l26"
  }

  initialization {
     ip_config {
       ipv4 {
         address = join("/", [cidrhost(var.net_cidr_dev, count.index + var.vm_ip_offset), var.net_cidr_prefix_dev ])
         gateway = var.net_gateway_dev
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

# output "vm_ipv4_address_vlan_dev" {
#   value = proxmox_virtual_environment_vm.ubuntu_vm_vlan_dev[*].initialization
# }

# output "vm_ipv4_address_vlan_devops" {
#   value = proxmox_virtual_environment_vm.ubuntu_vm_vlan_devops[*].initialization
# }

# output "vm_ipv4_address_vlan_staging" {
#   value = proxmox_virtual_environment_vm.ubuntu_vm_vlan_staging[*].initialization
# }