# Talos

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

## Docs

* <https://github.com/siderolabs/contrib/tree/main/examples/terraform/basic>