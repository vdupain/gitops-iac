output "vm_ipv4_address_vms" {
  value = [
    for vm in proxmox_virtual_environment_vm.vms : vm.initialization[0].ip_config[0].ipv4[0].address
  ]
}

output "vm_ipv6_address_vms" {
  value = [
    for vm in proxmox_virtual_environment_vm.vms : vm.initialization[0].ip_config[0].ipv6[0].address
  ]
}
