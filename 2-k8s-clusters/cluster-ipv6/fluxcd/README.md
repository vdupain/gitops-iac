# Gitops k8s

## Bootstrap FluxCD

```sh
export GITHUB_TOKEN=<gh-token>
flux bootstrap github  --owner=vdupain --repository=gitops --branch=main \
    --personal --path=clusters/cluster-ipv6 --token-auth \
    --kubeconfig ../output/kube-config.yaml
```

## Docs

* <https://fluxcd.io/>
