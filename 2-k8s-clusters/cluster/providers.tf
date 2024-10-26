terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.31.0"
    }
  }
}

provider "kubernetes" {
  host                   = module.talos_k8s.kube_config.kubernetes_client_configuration.host
  client_certificate     = base64decode(module.talos_k8s.kube_config.kubernetes_client_configuration.client_certificate)
  client_key             = base64decode(module.talos_k8s.kube_config.kubernetes_client_configuration.client_key)
  cluster_ca_certificate = base64decode(module.talos_k8s.kube_config.kubernetes_client_configuration.ca_certificate)
}
