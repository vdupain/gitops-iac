provider "flux" {
  kubernetes = {
    host                   = module.talos_k8s.kube_config.kubernetes_client_configuration.host
    client_certificate     = base64decode(module.talos_k8s.kube_config.kubernetes_client_configuration.client_certificate)
    client_key             = base64decode(module.talos_k8s.kube_config.kubernetes_client_configuration.client_key)
    cluster_ca_certificate = base64decode(module.talos_k8s.kube_config.kubernetes_client_configuration.ca_certificate)
  }

  git = {
    url = "https://github.com/${var.github.org}/${var.github.repository}.git"
    http = {
      username = "git" # This can be any string when using a personal access token
      password = var.github.token
    }
  }
}
