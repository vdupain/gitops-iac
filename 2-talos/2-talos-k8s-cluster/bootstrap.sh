#!/bin/sh

tofu output -raw kubeconfig > kubeconfig-talos-cluster
tofu output -raw talosconfig > talosconfig-talos-cluster
mkdir -p $HOME/.kube && cp kubeconfig-talos-cluster $HOME/.kube/config


