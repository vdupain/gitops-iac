module "vms" {
  source = "./vms"

  proxmox = var.proxmox

  cluster = {
    name    = var.cluster.name
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

  nodes = var.vms
}

module "fluxcd" {
  depends_on = [module.talos_k8s]
  source     = "./fluxcd"

  providers = {
    kubernetes = kubernetes
  }

  cluster = {
    name = var.cluster.name
  }

  github = var.github

}