output "vm_ipv4_address" {
  value = proxmox_virtual_environment_vm.ubuntu_vm[*].initialization[0].ip_config[0].ipv4[0].address
}
