output "vm_ipv4_address_vlan_dev" {
  value = proxmox_virtual_environment_vm.ubuntu_vm_vlan_dev[*].initialization[0].ip_config[0].ipv4[0].address
}

output "vm_ipv4_address_vlan_devops" {
  value = proxmox_virtual_environment_vm.ubuntu_vm_vlan_devops[*].initialization[0].ip_config[0].ipv4[0].address
}

output "vm_ipv4_address_vlan_staging" {
  value = proxmox_virtual_environment_vm.ubuntu_vm_vlan_staging[*].initialization[0].ip_config[0].ipv4[0].address
}