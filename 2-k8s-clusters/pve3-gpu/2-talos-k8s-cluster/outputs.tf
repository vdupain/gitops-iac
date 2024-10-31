output "talosconfig" {
  value     = data.talos_client_configuration.this.talos_config
  sensitive = true
}

output "kubeconfig" {
  value     = resource.talos_cluster_kubeconfig.this.kubeconfig_raw
  sensitive = true
}

resource "local_file" "talos_config" {
  content         = data.talos_client_configuration.this.talos_config
  filename        = "output/talos-config.yaml"
  file_permission = "0600"
}

resource "local_file" "kube_config" {
  content         = resource.talos_cluster_kubeconfig.this.kubeconfig_raw
  filename        = "output/kube-config.yaml"
  file_permission = "0600"
}