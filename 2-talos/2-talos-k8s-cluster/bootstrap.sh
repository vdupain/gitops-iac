#!/bin/sh

terraform output -raw kubeconfig > kubeconfig-talos-cluster
terraform output -raw talosconfig > talosconfig-talos-cluster
cp kubeconfig-talos-cluster $HOME/.kube/config
