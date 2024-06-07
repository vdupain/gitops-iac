resource "proxmox_virtual_environment_hardware_mapping_pci" "nvidia_3060" {
  comment = "nvidia_3060"
  name    = "nvidia_3060"
  map = [
    {
      comment = "nvidia_3060"
      id      = "10de:2503"
      iommu_group = 2
      node        = "pve3"
      path        = "0000:bd:00.0"
      subsystem_id = "10de:1522"
    }
  ]
  mediated_devices = false
}