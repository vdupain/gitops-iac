resource "proxmox_virtual_environment_vm" "vms" {
  for_each = var.vms

  node_name = each.value.host_node

  name        = each.key
  description = each.value.machine_type
  tags        = ["terraform", "talos", "k8s", "${each.value.machine_type}"]
  on_boot     = true
  started     = true
  vm_id       = each.value.vm_id

  machine       = "q35"
  scsi_hardware = "virtio-scsi-single"
  bios          = "seabios"

  agent {
    enabled = true
  }

  cpu {
    cores = each.value.cpu
    type  = "host"
  }

  memory {
    dedicated = each.value.ram_dedicated
  }

  network_device {
    bridge = "vmbr0"
  }

  disk {
    datastore_id = each.value.datastore_id
    interface    = "scsi0"
    iothread     = true
    cache        = "writethrough"
    discard      = "on"
    ssd          = true
    file_format  = "raw"
    size         = each.value.disk_size
    file_id      = proxmox_virtual_environment_download_file.this["${each.value.host_node}_${each.value.gpu == true ? local.image_nvidia_id : local.image_id}"].id
  }

  boot_order = ["scsi0"]

  operating_system {
    type = "l26"
  }

  initialization {
    datastore_id = each.value.datastore_id
    ip_config {
      ipv4 {
        address = "${each.value.ip}/24"
        gateway = var.cluster.gateway
      }
      ipv6 {
        #address = "dhcp"
        address = "${each.value.ipv6}/64"
      }
    }
  }

  dynamic "hostpci" {
    for_each = each.value.gpu ? [1] : []
    content {
      # Passthrough GPU
      device  = "hostpci0"
      mapping = "nvidia_3060"
      pcie    = true
      rombar  = true
      xvga    = false
    }
  }
}
