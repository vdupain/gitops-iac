# Talos

## Provisionner un cluster k8s

```sh
terraform apply -auto-approve
terraform output -raw kubeconfig > kubeconfig-talos-cluster
terraform output -raw talosconfig > talosconfig-talos-cluster

k9s --kubeconfig kubeconfig-talos-cluster
```

Et voila !

En gros le provisionning Terraform pour Talos est l'équivalent de ceci en ligne de commande:

```sh
export CONTROL_PLANE_IP=192.168.10.240
talosctl gen config talos-proxmox-cluster https://$CONTROL_PLANE_IP:6443 --output-dir _out --force

talosctl apply-config --insecure --nodes $CONTROL_PLANE_IP --file _out/controlplane.yaml
talosctl apply-config --insecure --nodes 192.168.10.241 --file _out/controlplane.yaml

talosctl apply-config --insecure --nodes 192.168.10.230 --file _out/worker.yaml
talosctl apply-config --insecure --nodes 192.168.10.231 --file _out/worker.yaml

export TALOSCONFIG="_out/talosconfig"
talosctl config endpoint $CONTROL_PLANE_IP
talosctl config node $CONTROL_PLANE_IP

talosctl bootstrap
talosctl kubeconfig .
```

## Bootstrap Flux

```sh
export GITHUB_TOKEN=<gh-token>
flux bootstrap github  --owner=vdupain --repository=gitops --branch=main \
    --personal --path=clusters/talos-proxmox-cluster \
    --kubeconfig kubeconfig-talos-cluster
```

## Docs

* <https://www.talos.dev/v1.7/talos-guides/install/virtualized-platforms/proxmox/>
* <https://github.com/siderolabs/contrib/tree/main/examples/terraform/basic>