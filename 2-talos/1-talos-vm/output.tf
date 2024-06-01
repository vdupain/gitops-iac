output "vm_ipv4_address_k8s_control_plane" {
  value = proxmox_virtual_environment_vm.k8s-control-plane[*].initialization[0].ip_config[0].ipv4[0].address
}

output "vm_ipv4_address_k8s_worker" {
  value = proxmox_virtual_environment_vm.k8s-worker[*].initialization[0].ip_config[0].ipv4[0].address
}

output "vm_ipv4_address_k8s_worker_gpu" {
  value = proxmox_virtual_environment_vm.k8s-worker-gpu[*].initialization[0].ip_config[0].ipv4[0].address
}
