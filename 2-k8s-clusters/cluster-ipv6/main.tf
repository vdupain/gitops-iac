module "vms" {
  source = "./vms"

  proxmox = var.proxmox

  cluster = {
    name    = var.cluster.name
    gateway = var.cluster.gateway
    gateway_v6 = var.cluster.gateway_v6
    cidr    = var.cluster.cidr
    cidr_v6    = var.cluster.cidr_v6
    vlan_id = var.cluster.vlan_id
  }

  vms = var.vms
  pci = var.pci
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