module "vms" {
  source = "./vms"

  proxmox = var.proxmox

  cluster = {
    gateway = var.cluster.gateway
  }

  vms = var.vms

}

module "talos_k8s" {
  depends_on = [module.vms]
  source     = "./talos_k8s"

  cluster = {
    name     = var.cluster.name
    endpoint = var.cluster.endpoint
  }

  nodes = var.nodes
}

module "fluxcd" {
  depends_on = [module.talos_k8s.talos_cluster_health]
  source     = "./fluxcd"

  providers = {
    kubernetes = kubernetes
  }

  cluster = {
    name = var.cluster.name
  }

  github = var.github

}